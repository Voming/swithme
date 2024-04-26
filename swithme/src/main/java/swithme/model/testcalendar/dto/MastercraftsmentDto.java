package swithme.model.testcalendar.dto;

public class MastercraftsmentDto {
	private String description;
	private String docregstartdt;
	private String docregenddt;
	private String docexamdt;
	private String docpassdt;
	private String pracregstartdt;
	private String pracregenddt;
	private String pracexamstartdt;
	private String pracexamenddt;
	private String pracpassdt;

	@Override
	public String toString() {
		return "IndengineerDto [description=" + description + ", docregstartdt=" + docregstartdt
				+ ", docregenddt=" + docregenddt + ", docexamdt=" + docexamdt + ", docpassdt=" + docpassdt
				+ ", pracregstartdt=" + pracregstartdt + ", pracregenddt=" + pracregenddt + ", pracexamstartdt="
				+ pracexamstartdt + ", pracexamenddt=" + pracexamenddt + ", pracpassdt=" + pracpassdt + "]";
	}

	public MastercraftsmentDto(String description, String docregstartdt, String docregenddt, String docexamdt,
			String docpassdt, String pracregstartdt, String pracregenddt, String pracexamstartdt, String pracexamenddt,
			String pracpassdt) {
		super();
		this.description = description;
		this.docregstartdt = docregstartdt;
		this.docregenddt = docregenddt;
		this.docexamdt = docexamdt;
		this.docpassdt = docpassdt;
		this.pracregstartdt = pracregstartdt;
		this.pracregenddt = pracregenddt;
		this.pracexamstartdt = pracexamstartdt;
		this.pracexamenddt = pracexamenddt;
		this.pracpassdt = pracpassdt;
	}

	public String getdescription() {
		return description;
	}

	public String getDocregstartdt() {
		return docregstartdt;
	}

	public String getDocregenddt() {
		return docregenddt;
	}

	public String getDocexamdt() {
		return docexamdt;
	}

	public String getDocpassdt() {
		return docpassdt;
	}

	public String getPracregstartdt() {
		return pracregstartdt;
	}

	public String getPracregenddt() {
		return pracregenddt;
	}

	public String getPracexamstartdt() {
		return pracexamstartdt;
	}

	public String getPracexamenddt() {
		return pracexamenddt;
	}

	public String getPracpassdt() {
		return pracpassdt;
	}
}
