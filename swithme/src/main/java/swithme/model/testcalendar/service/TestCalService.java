package swithme.model.testcalendar.service;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class TestCalService {
	public static String getTagValue(String tag, Element eElement) {
		System.out.println("들어옴");
		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nlList.item(0).getTextContent();
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
		String key = "t%2BMBfXyUlsCG64LCFFpv%2FVotwMILtIfeNO7zAeIjdTWYPTgoNLBWkbOaqy9OXo3PMctejj%2FXe7pWVinitw3AUg%3D%3D";
		try {
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

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);

				Element eElement = (Element) nNode;

				System.out.println("회차 : " + getTagValue("description", eElement));
				System.out.println("필기시험원서접수시작일자 : " + getTagValue("docregstartdt", eElement));
				System.out.println("필기시험원서접수종료일자 : " + getTagValue("docregenddt", eElement));
				System.out.println("필기시험일자 : " + getTagValue("docexamdt", eElement));
				System.out.println("필기시험 합격(예정)자 발표일자 : " + getTagValue("docpassdt", eElement));
				System.out.println("면접시험원서접수시작일자 : " + getTagValue("pracregstartdt", eElement));
				System.out.println("면접시험원서접수종료일자 : " + getTagValue("pracregenddt", eElement));
				System.out.println("면접시험시작일자 : " + getTagValue("pracexamstartdt", eElement));
				System.out.println("면접시험종료일자 : " + getTagValue("pracexamenddt", eElement));
				System.out.println("합격자발표일자 : " + getTagValue("pracpassdt", eElement));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
