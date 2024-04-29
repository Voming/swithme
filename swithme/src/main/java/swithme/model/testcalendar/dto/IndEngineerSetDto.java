package swithme.model.testcalendar.dto;

public class IndEngineerSetDto {
//	DESCR_ID          NOT NULL NUMBER 
//	DOCREGSTARTDT     NOT NULL DATE   
//	DOCREGENDDT       NOT NULL DATE   
//	DOCREGSTARTDT_EX           DATE   
//	DOCREGENDDT_EX             DATE   
//	DOCEXAMDT         NOT NULL DATE   
//	DOCPASSDT         NOT NULL DATE   
//	PRACREGSTARTDT    NOT NULL DATE   
//	PRACREGENDDT      NOT NULL DATE   
//	PRACREGSTARTDT_EX          DATE   
//	PRACREGENDDT_EX            DATE   
//	PRACEXAMSTARTDT   NOT NULL DATE   
//	PRACEXAMENDDT     NOT NULL DATE   
//	PRACPASSDT        NOT NULL DATE   
	private String description;
	private String docregstartdt;
	private String docregenddt;
	private String docregstartdtEx;
	private String docregenddtEx;
	private String docexamdt;
	private String docpassdt;
	private String pracregstartdt;
	private String pracregenddt;
	private String pracregstartdtEx;
	private String pracregenddtEx;
	private String pracexamstartdt;
	private String pracexamenddt;
	private String pracpassdt;

	@Override
	public String toString() {
		return "IndEngineerSetDto [description=" + description + ", docregstartdt=" + docregstartdt + ", docregenddt="
				+ docregenddt + ", docregstartdtEx=" + docregstartdtEx + ", docregenddtEx=" + docregenddtEx
				+ ", docexamdt=" + docexamdt + ", docpassdt=" + docpassdt + ", pracregstartdt=" + pracregstartdt
				+ ", pracregenddt=" + pracregenddt + ", pracregstartdtEx=" + pracregstartdtEx + ", pracregenddtEx="
				+ pracregenddtEx + ", pracexamstartdt=" + pracexamstartdt + ", pracexamenddt=" + pracexamenddt
				+ ", pracpassdt=" + pracpassdt + "]";
	}

	public IndEngineerSetDto(String description, String docregstartdt, String docregenddt, String docregstartdtEx,
			String docregenddtEx, String docexamdt, String docpassdt, String pracregstartdt, String pracregenddt,
			String pracregstartdtEx, String pracregenddtEx, String pracexamstartdt, String pracexamenddt,
			String pracpassdt) {
		super();
		this.description = description;
		this.docregstartdt = docregstartdt;
		this.docregenddt = docregenddt;
		this.docregstartdtEx = docregstartdtEx;
		this.docregenddtEx = docregenddtEx;
		this.docexamdt = docexamdt;
		this.docpassdt = docpassdt;
		this.pracregstartdt = pracregstartdt;
		this.pracregenddt = pracregenddt;
		this.pracregstartdtEx = pracregstartdtEx;
		this.pracregenddtEx = pracregenddtEx;
		this.pracexamstartdt = pracexamstartdt;
		this.pracexamenddt = pracexamenddt;
		this.pracpassdt = pracpassdt;
	}

	public String getDescription() {
		return description;
	}

	public String getDocregstartdt() {
		return docregstartdt;
	}

	public String getDocregenddt() {
		return docregenddt;
	}

	public String getDocregstartdtEx() {
		return docregstartdtEx;
	}

	public String getDocregenddtEx() {
		return docregenddtEx;
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

	public String getPracregstartdtEx() {
		return pracregstartdtEx;
	}

	public String getPracregenddtEx() {
		return pracregenddtEx;
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
