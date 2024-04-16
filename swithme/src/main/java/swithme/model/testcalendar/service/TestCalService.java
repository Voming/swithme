package swithme.model.testcalendar.service;

import java.io.FileReader;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import swithme.model.testcalendar.dto.ProengineerDto;

public class TestCalService {
	public static String getTagValue(String tag, Element eElement) {
		System.out.println("들어옴");
		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nlList.item(0).getTextContent();
		return result;
	}

	public static Date getTagDateValue(String tag, Element eElement) {
		System.out.println("들어옴");
		// 결과를 저장할 result 변수 선언
		Date result = null;
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String resultStr = nlList.item(0).getTextContent();
		try {
			result =formatter.parse(resultStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, String childTag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		for (int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
			// result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}
		return result;
	}

	public void testCalApiCall() {
		Properties prop = new Properties();
		String currentPath = JdbcTemplate.class.getResource("./").getPath();
		try {

			prop.load(new FileReader(currentPath + "driver.properties"));
			String key = prop.getProperty("jdbc.swithme.servicekey");

			String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getPEList?serviceKey="
					+ key;
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println(nList);

			List<ProengineerDto> dtolist = new ArrayList<ProengineerDto>();

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);

				Element eElement = (Element) nNode;

//				System.out.println("회차 : " + getTagValue("description", eElement));
//				System.out.println("필기시험원서접수시작일자 : " + getTagValue("docregstartdt", eElement));
//				System.out.println("필기시험원서접수종료일자 : " + getTagValue("docregenddt", eElement));
//				System.out.println("필기시험일자 : " + getTagValue("docexamdt", eElement));
//				System.out.println("필기시험 합격(예정)자 발표일자 : " + getTagValue("docpassdt", eElement));
//				System.out.println("면접시험원서접수시작일자 : " + getTagValue("pracregstartdt", eElement));
//				System.out.println("면접시험원서접수종료일자 : " + getTagValue("pracregenddt", eElement));
//				System.out.println("면접시험시작일자 : " + getTagValue("pracexamstartdt", eElement));
//				System.out.println("면접시험종료일자 : " + getTagValue("pracexamenddt", eElement));
//				System.out.println("합격자발표일자 : " + getTagValue("pracpassdt", eElement));

				String description = getTagValue("description", eElement);
				Date docregstartdt = getTagDateValue("docregstartdt", eElement);
				Date docregenddt = getTagDateValue("docregenddt", eElement);
				Date docexamdt = getTagDateValue("docexamdt", eElement);
				Date docpassdt = getTagDateValue("docpassdt", eElement);
				Date pracregstartdt = getTagDateValue("pracregstartdt", eElement);
				Date pracregenddt = getTagDateValue("pracregenddt", eElement);
				Date pracexamstartdt = getTagDateValue("pracexamstartdt", eElement);
				Date pracexamenddt = getTagDateValue("pracexamenddt", eElement);
				Date pracpassdt = getTagDateValue("pracpassdt", eElement);

				ProengineerDto dto = new ProengineerDto(description, docregstartdt, docregenddt, docexamdt, docpassdt,
						pracregstartdt, pracregenddt, pracexamstartdt, pracexamenddt, pracpassdt);
				System.out.println(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
