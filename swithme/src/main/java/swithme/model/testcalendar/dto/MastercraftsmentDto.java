package swithme.model.testcalendar.dto;

import java.sql.Date;

public class MastercraftsmentDto {
//	DESCRIPTION	VARCHAR2(30 BYTE)
//	DOCREGSTARTDT	DATE
//	DOCREGENDDT	DATE
//	DOCEXAMDT	DATE
//	DOCPASSDT	DATE
//	PRACREGSTARTDT	DATE
//	PRACREGENDDT	DATE
//	PRACEXAMSTARTDT	DATE
//	PRACEXAMENDDT	DATE
//	PRACPASSDT	DATE
	private String descriptString;
	private Date docRegStart;
	private Date docRegEnd;
	private Date docExam;
	private Date docPass;
	private Date pracRegStart;
	private Date pracRegEnd;
	private Date pracExamStart;
	private Date pracExamEnd;
	private Date pracPass;

	

	public MastercraftsmentDto(String descriptString, Date docRegStart, Date docRegEnd, Date docExam, Date docPass,
			Date pracRegStart, Date pracRegEnd, Date pracExamStart, Date pracExamEnd, Date pracPass) {
		super();
		this.descriptString = descriptString;
		this.docRegStart = docRegStart;
		this.docRegEnd = docRegEnd;
		this.docExam = docExam;
		this.docPass = docPass;
		this.pracRegStart = pracRegStart;
		this.pracRegEnd = pracRegEnd;
		this.pracExamStart = pracExamStart;
		this.pracExamEnd = pracExamEnd;
		this.pracPass = pracPass;
	}

	@Override
	public String toString() {
		return "ProengineerDto [descriptString=" + descriptString + ", docRegStart=" + docRegStart + ", docRegEnd="
				+ docRegEnd + ", docExam=" + docExam + ", docPass=" + docPass + ", pracRegStart=" + pracRegStart
				+ ", pracRegEnd=" + pracRegEnd + ", pracExamStart=" + pracExamStart + ", pracExamEnd=" + pracExamEnd
				+ ", pracPass=" + pracPass + "]";
	}

	public String getDescriptString() {
		return descriptString;
	}

	public Date getDocRegStart() {
		return docRegStart;
	}

	public Date getDocRegEnd() {
		return docRegEnd;
	}

	public Date getDocExam() {
		return docExam;
	}

	public Date getDocPass() {
		return docPass;
	}

	public Date getPracRegStart() {
		return pracRegStart;
	}

	public Date getPracRegEnd() {
		return pracRegEnd;
	}

	public Date getPracExamStart() {
		return pracExamStart;
	}

	public Date getPracExamEnd() {
		return pracExamEnd;
	}

	public Date getPracPass() {
		return pracPass;
	}

}
