package swithme.model.testcalendar.dto;

public class IndengineerDto {
//	DESCRIPTION	VARCHAR2(30 BYTE)
//	DOCREGSTARTDT	String
//	DOCREGENDDT	DATE
//	DOCEXAMDT	DATE
//	DOCPASSDT	DATE
//	PRACREGSTARTDT	DATE
//	PRACREGENDDT	DATE
//	PRACEXAMSTARTDT	DATE
//	PRACEXAMENDDT	DATE
//	PRACPASSDT	DATE
	private Integer descrId;
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

	public IndengineerDto() {
		super();
	}

	public IndengineerDto(Integer descrId, String description, String docregstartdt, String docregenddt,
			String docexamdt, String docpassdt, String pracregstartdt, String pracregenddt, String pracexamstartdt,
			String pracexamenddt, String pracpassdt) {
		super();
		this.descrId = descrId;
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

	public Integer getDescrId() {
		return descrId;
	}

	public void setDescrId(Integer descrId) {
		this.descrId = descrId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDocregstartdt() {
		return docregstartdt;
	}

	public void setDocregstartdt(String docregstartdt) {
		this.docregstartdt = docregstartdt;
	}

	public String getDocregenddt() {
		return docregenddt;
	}

	public void setDocregenddt(String docregenddt) {
		this.docregenddt = docregenddt;
	}

	public String getDocexamdt() {
		return docexamdt;
	}

	public void setDocexamdt(String docexamdt) {
		this.docexamdt = docexamdt;
	}

	public String getDocpassdt() {
		return docpassdt;
	}

	public void setDocpassdt(String docpassdt) {
		this.docpassdt = docpassdt;
	}

	public String getPracregstartdt() {
		return pracregstartdt;
	}

	public void setPracregstartdt(String pracregstartdt) {
		this.pracregstartdt = pracregstartdt;
	}

	public String getPracregenddt() {
		return pracregenddt;
	}

	public void setPracregenddt(String pracregenddt) {
		this.pracregenddt = pracregenddt;
	}

	public String getPracexamstartdt() {
		return pracexamstartdt;
	}

	public void setPracexamstartdt(String pracexamstartdt) {
		this.pracexamstartdt = pracexamstartdt;
	}

	public String getPracexamenddt() {
		return pracexamenddt;
	}

	public void setPracexamenddt(String pracexamenddt) {
		this.pracexamenddt = pracexamenddt;
	}

	public String getPracpassdt() {
		return pracpassdt;
	}

	public void setPracpassdt(String pracpassdt) {
		this.pracpassdt = pracpassdt;
	}

}
