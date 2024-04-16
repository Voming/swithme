package swithme.model.testcalendar.service;

import java.io.FileReader;
import java.util.ArrayList;

import java.util.List;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import swithme.jdbc.common.JdbcTemplate;
import swithme.model.testcalendar.dto.IndengineerDto;
import swithme.model.testcalendar.dto.MastercraftsmentDto;
import swithme.model.testcalendar.dto.ProengineerDto;

public class TestCalService {
	public static String getTagValue(String tag, Element eElement) {
		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nlList.item(0).getTextContent();
		return result;
	}

	public void testCalApiCall(int tabNum) {
		Properties prop = new Properties();
		String currentPath = JdbcTemplate.class.getResource("./").getPath();
		try {

			prop.load(new FileReader(currentPath + "driver.properties"));
			String key = prop.getProperty("jdbc.swithme.servicekey");
			String url = "";
			//1 : 기술사 2: 기능장 3: 기사 산업기사
			if(tabNum == 1) {
				url += "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getPEList?serviceKey=";
			}else if(tabNum == 2) {
				url += "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getMCList?serviceKey=";
			}else if(tabNum == 3) {
				url += "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getEList?serviceKey=";
			}
			url += key;
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			//1 : 기술사 2: 기능장 3: 기사 산업기사
			if(tabNum == 1) {
				List<ProengineerDto> dtolist = new ArrayList<ProengineerDto>();
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					Element eElement = (Element) nNode;

					String description = getTagValue("description", eElement);
					String docregstartdt = getTagValue("docregstartdt", eElement);
					String docregenddt = getTagValue("docregenddt", eElement);
					String docexamdt = getTagValue("docexamdt", eElement);
					String docpassdt = getTagValue("docpassdt", eElement);
					String pracregstartdt = getTagValue("pracregstartdt", eElement);
					String pracregenddt = getTagValue("pracregenddt", eElement);
					String pracexamstartdt = getTagValue("pracexamstartdt", eElement);
					String pracexamenddt = getTagValue("pracexamenddt", eElement);
					String pracpassdt = getTagValue("pracpassdt", eElement);

					ProengineerDto dto = new ProengineerDto(description, docregstartdt, docregenddt, docexamdt, docpassdt,
							pracregstartdt, pracregenddt, pracexamstartdt, pracexamenddt, pracpassdt);
					dtolist.add(dto);
				}
				System.out.println("기술사 : " + dtolist);
			}else if(tabNum == 2) {
				List<MastercraftsmentDto> dtolist = new ArrayList<MastercraftsmentDto>();
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					Element eElement = (Element) nNode;

					String description = getTagValue("description", eElement);
					String docregstartdt = getTagValue("docregstartdt", eElement);
					String docregenddt = getTagValue("docregenddt", eElement);
					String docexamdt = getTagValue("docexamdt", eElement);
					String docpassdt = getTagValue("docpassdt", eElement);
					String pracregstartdt = getTagValue("pracregstartdt", eElement);
					String pracregenddt = getTagValue("pracregenddt", eElement);
					String pracexamstartdt = getTagValue("pracexamstartdt", eElement);
					String pracexamenddt = getTagValue("pracexamenddt", eElement);
					String pracpassdt = getTagValue("pracpassdt", eElement);

					MastercraftsmentDto dto = new MastercraftsmentDto(description, docregstartdt, docregenddt, docexamdt, docpassdt,
							pracregstartdt, pracregenddt, pracexamstartdt, pracexamenddt, pracpassdt);
					dtolist.add(dto);
				}
				System.out.println("기능장 : " + dtolist);
			}else if(tabNum == 3) {
				List<IndengineerDto> dtolist = new ArrayList<IndengineerDto>();
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					Element eElement = (Element) nNode;

					String description = getTagValue("description", eElement);
					String docregstartdt = getTagValue("docregstartdt", eElement);
					String docregenddt = getTagValue("docregenddt", eElement);
					String docexamdt = getTagValue("docexamdt", eElement);
					String docpassdt = getTagValue("docpassdt", eElement);
					String pracregstartdt = getTagValue("pracregstartdt", eElement);
					String pracregenddt = getTagValue("pracregenddt", eElement);
					String pracexamstartdt = getTagValue("pracexamstartdt", eElement);
					String pracexamenddt = getTagValue("pracexamenddt", eElement);
					String pracpassdt = getTagValue("pracpassdt", eElement);

					IndengineerDto dto = new IndengineerDto(description, docregstartdt, docregenddt, docexamdt, docpassdt,
							pracregstartdt, pracregenddt, pracexamstartdt, pracexamenddt, pracpassdt);
					dtolist.add(dto);
				}
				System.out.println("기사 산업기사 : " + dtolist);
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
