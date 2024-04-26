package swithme.model.testcalendar.dto;

public class ProEngineerSetDto {
	private Integer descrId;
	private String docregstartdt;
	private String docregenddt;
	private String docregstartdtEx;
	private String docregenddtEx;
	private String docexamdt;
	private String docpassdt;
	private String pracregstartdtEx;
	private String pracregenddtEx;
	private String pracexamstartdt;
	private String pracexamenddt;
	private String pracpassdt;

	@Override
	public String toString() {
		return "IndEngineerSetDto [descrId=" + descrId + ", docregstartdt=" + docregstartdt + ", docregenddt="
				+ docregenddt + ", docregstartdtEx=" + docregstartdtEx + ", docregenddtEx=" + docregenddtEx
				+ ", docexamdt=" + docexamdt + ", docpassdt=" + docpassdt + ", pracregstartdtEx=" + pracregstartdtEx
				+ ", pracregenddtEx=" + pracregenddtEx + ", pracexamstartdt=" + pracexamstartdt + ", pracexamenddt="
				+ pracexamenddt + ", pracpassdt=" + pracpassdt + "]";
	}

	public ProEngineerSetDto(Integer descrId, String docregstartdt, String docregenddt, String docregstartdtEx,
			String docregenddtEx, String docexamdt, String docpassdt, String pracregstartdtEx, String pracregenddtEx,
			String pracexamstartdt, String pracexamenddt, String pracpassdt) {
		super();
		this.descrId = descrId;
		this.docregstartdt = docregstartdt;
		this.docregenddt = docregenddt;
		this.docregstartdtEx = docregstartdtEx;
		this.docregenddtEx = docregenddtEx;
		this.docexamdt = docexamdt;
		this.docpassdt = docpassdt;
		this.pracregstartdtEx = pracregstartdtEx;
		this.pracregenddtEx = pracregenddtEx;
		this.pracexamstartdt = pracexamstartdt;
		this.pracexamenddt = pracexamenddt;
		this.pracpassdt = pracpassdt;
	}

	public Integer getDescrId() {
		return descrId;
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
