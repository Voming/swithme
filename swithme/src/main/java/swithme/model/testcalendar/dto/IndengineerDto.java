package swithme.model.testcalendar.dto;

public class IndengineerDto {
	private String descriptString;
	private String docRegStart;
	private String docRegEnd;
	private String docExam;
	private String docPass;
	private String pracRegStart;
	private String pracRegEnd;
	private String pracExamStart;
	private String pracExamEnd;
	private String pracPass;

	

	public IndengineerDto(String descriptString, String docRegStart, String docRegEnd, String docExam, String docPass,
			String pracRegStart, String pracRegEnd, String pracExamStart, String pracExamEnd, String pracPass) {
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

	public String getDocRegStart() {
		return docRegStart;
	}

	public String getDocRegEnd() {
		return docRegEnd;
	}

	public String getDocExam() {
		return docExam;
	}

	public String getDocPass() {
		return docPass;
	}

	public String getPracRegStart() {
		return pracRegStart;
	}

	public String getPracRegEnd() {
		return pracRegEnd;
	}

	public String getPracExamStart() {
		return pracExamStart;
	}

	public String getPracExamEnd() {
		return pracExamEnd;
	}

	public String getPracPass() {
		return pracPass;
	}

}
