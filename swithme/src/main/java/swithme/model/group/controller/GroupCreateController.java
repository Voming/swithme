package swithme.model.group.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.service.GroupService;
import swithme.model.member.dto.MemberInfoDto;
import swithme.server.common.ServerTemplate;

import com.cloudinary.Cloudinary;
import com.cloudinary.EagerTransformation;
import com.cloudinary.utils.ObjectUtils;

@WebServlet("/group/create")
public class GroupCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
	
    public GroupCreateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/group/groupcreate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String groupWriter = loginInfo.getMemId();
		
		Properties prop = new Properties();
		String currentPath = ServerTemplate.class.getResource("./").getPath();
		System.out.println("currentPath : "+ currentPath);
		try {
			prop.load(new FileReader(currentPath + "cloudinary.properties"));
			String cloud_name = prop.getProperty("cloud.name");
			String api_key = prop.getProperty("api.key");
			String api_secret = prop.getProperty("api.secret");
			
			
			Cloudinary cloudinary= new Cloudinary(ObjectUtils.asMap(
			  "cloud_name", cloud_name,
			  "api_key", api_key,
			  "api_secret", api_secret, 
			  "secure", true));
			
//			//TODO 입력하기 전에 체크하도록
//			//만약 가입한 그룹이 5개라면 더이상 그룹 생성 불가능
//			int mGroupCount = service.selectMyCount(groupWriter);
//			if(mGroupCount > 5) {
//				result = -1;
//				response.getWriter().append(String.valueOf(result));
//				return;
//			}
			
			String uploadPath = request.getServletContext().getRealPath("files");
			System.out.println("uploadPath : " + uploadPath ); 
			//만약 필요한 파일이 만들어져있지 않다면 만들기
			File uploadPathFile = new File(uploadPath); 
			if(!uploadPathFile.exists()) {
				uploadPathFile.mkdirs();
			}
			
			//form enctype = "multipart/form-data"형태로 전달된 경우
			int uploadFileLimit = 10*1024*1024; //10M 제한
			MultipartRequest multiReq = new MultipartRequest(request, 
					uploadPath, //서버에 저장할 디렉토리
					uploadFileLimit, //업로드 파일 크기 제한
					"UTF-8",
					new DefaultFileRenamePolicy() //was서버에 저장할 디렉토리에 동일 이름이 존재할 때 새로운 이름 부여 방식
					);		

			//Cloudinary
			@SuppressWarnings("unchecked")
			Map<String, Object> uploadResult  = cloudinary.uploader().upload(
					multiReq.getFile("uploadfile")
					, ObjectUtils.asMap(
						    "eager", Arrays.asList(
						    	      new EagerTransformation().width(290).height(180).crop("fill").gravity("north"))));
			
			System.out.println(uploadResult.get("url"));
			String imgPath = (String) uploadResult.get("url");
			String imgName = (String) uploadResult.get("original_filename");
			
			if(imgPath==null) {// 서버에 올리지 못했다면
				System.out.println("파일 업로드 실패");
				result = -1;
				response.getWriter().append(String.valueOf(result));
				return;
			}
			
			String groupName = multiReq.getParameter("groupName");
			String groupOpen = multiReq.getParameter("groupOpen");
			String groupExp = multiReq.getParameter("groupExp");
			String groupPwdstr = multiReq.getParameter("groupPwd");
			
			//공개 비공개 체크 -> 비밀번호 저장형식
			if(groupOpen.equals("open")) {
				groupOpen = "0";
				groupPwdstr = "0";
			}else {
				groupOpen = "1";
				if(groupPwdstr != null && !groupPwdstr.equals("")) {
					try {
						int groupPwd = 0;
						groupPwd = Integer.parseInt(groupPwdstr);
						System.out.println("비밀번호 : " + groupPwd);
					} catch (NumberFormatException e) {
						result = -1;
						response.getWriter().append(String.valueOf(result));
						e.printStackTrace();
					}
				}
			}
			GroupCreateDto dto = new GroupCreateDto(groupWriter, groupName, groupOpen, groupPwdstr, groupExp, imgPath, imgName);
			System.out.println(dto);
			result = service.insert(dto);
			
			response.getWriter().append(String.valueOf(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
