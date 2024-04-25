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

import com.cloudinary.Cloudinary;
import com.cloudinary.EagerTransformation;
import com.cloudinary.utils.ObjectUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupUpdateDto;
import swithme.model.group.dto.GroupUpdateMinDto;
import swithme.model.group.service.GroupService;
import swithme.model.member.dto.MemberInfoDto;
import swithme.server.common.ServerTemplate;

@WebServlet("/group/update")
public class GroupUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
	int groupId = 0;

	public GroupUpdateController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("/group/update doGet()");

		String groupIdstr = request.getParameter("groupId");
		try {
			groupId = Integer.parseInt(groupIdstr);
		} catch (NumberFormatException e) {
			response.getWriter().append("-1");
			return;
		}
		GroupDto groupInfo = service.selectGroupInfoOne(groupId); // 입력칸에 원래 있던 그룹 정보 넣음

		System.out.println("groupId : " + groupId);
		request.getSession().setAttribute("groupInfo", groupInfo);
		request.getRequestDispatcher("/WEB-INF/views/group/groupupdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		
		Properties prop = new Properties();
		String currentPath = ServerTemplate.class.getResource("./").getPath();
		System.out.println("currentPath : " + currentPath);
		
		try { //cloudinary 키 받아오기
			prop.load(new FileReader(currentPath + "cloudinary.properties"));
			String cloud_name = prop.getProperty("cloud.name");
			String api_key = prop.getProperty("api.key");
			String api_secret = prop.getProperty("api.secret");
			
			//Cloudinary 객체 생성
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", cloud_name, "api_key", api_key,
					"api_secret", api_secret, "secure", true));

			// form enctype = "multipart/form-data"형태로 전달된 경우
			String uploadPath = request.getServletContext().getRealPath("files");
			int uploadFileLimit = 10 * 1024 * 1024; // 10M 제한
			
			//MultipartRequest
			MultipartRequest multiReq = new MultipartRequest(request, uploadPath, // 서버에 저장할 디렉토리
					uploadFileLimit, // 업로드 파일 크기 제한
					"UTF-8", new DefaultFileRenamePolicy() // was서버에 저장할 디렉토리에 동일 이름이 존재할 때 새로운 이름 부여 방식
			);

			String filePath = multiReq.getFilesystemName("uploadfile"); //파일 정보
			String groupName = multiReq.getParameter("groupName");
			String groupOpen = multiReq.getParameter("groupOpen");
			String groupExp = multiReq.getParameter("groupExp");
			String groupPwdstr = multiReq.getParameter("groupPwd");
			
			// 공개 비공개 체크 -> 비밀번호 저장형식
			if (groupOpen.equals("open")) {
				groupOpen = "0";
				groupPwdstr = "0";
			} else {
				groupOpen = "1";
				if (groupPwdstr != null && !groupPwdstr.equals("")) {
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
			
			if (filePath == null) {  //파일이 없는 경우 파일 제외하고 업데이트
				System.out.println("첨부파일이 없었습니다.");
				//사진 없이 업데이트
				GroupUpdateMinDto dtomin = new GroupUpdateMinDto(groupId, groupName, groupOpen, groupPwdstr, groupExp);
				System.out.println(dtomin);
				result = service.updateMin(dtomin);
			} else { //파일이 있는 경우 파일 포함해서 업데이트
				// Cloudinary
				@SuppressWarnings("unchecked")
				Map<String, Object> uploadResult = cloudinary.uploader().upload(multiReq.getFile("uploadfile"),
						ObjectUtils.asMap("eager", Arrays
								.asList(new EagerTransformation().width(290).height(180).crop("fill").gravity("north"))));

				System.out.println(uploadResult.get("url"));
				String imgPath = (String) uploadResult.get("url");
				String imgName = (String) uploadResult.get("original_filename");
				
				if (imgPath == null) {// 서버에 올리지 못했다면
					System.out.println("파일 업로드 실패");
					result = -1;
					response.getWriter().append(String.valueOf(result));
					return;
				}
				
				//사진 포함 업데이트
				GroupUpdateDto dto = new GroupUpdateDto(groupId, groupName, groupOpen, groupPwdstr, groupExp, imgPath, imgName);
				result = service.update(dto);

				response.getWriter().append(String.valueOf(result));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
