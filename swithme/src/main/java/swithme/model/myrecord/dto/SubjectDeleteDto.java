package swithme.model.myrecord.dto;

public class SubjectDeleteDto {
//	SUBJECT_ID       NOT NULL NUMBER       
//	MEM_ID           NOT NULL VARCHAR2(20) 
//	SUBJECT_NAME     NOT NULL VARCHAR2(20) 
//	SUBJECT_ADD_DATE NOT NULL TIMESTAMP(6) 
//	SUBJECT_DEL_DATE          TIMESTAMP(6) 
//	SUBJECT_COLOR    NOT NULL CHAR(1)    
	
	private Integer subjectId;
	private String memId;
	private String subjectDelDate;
	@Override
	public String toString() {
		return "SubjectDeleteDto [subjectId=" + subjectId + ", memId=" + memId + ", subjectDelDate=" + subjectDelDate
				+ "]";
	}
	public SubjectDeleteDto(Integer subjectId, String memId, String subjectDelDate) {
		super();
		this.subjectId = subjectId;
		this.memId = memId;
		this.subjectDelDate = subjectDelDate;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public String getMemId() {
		return memId;
	}
	public String getSubjectDelDate() {
		return subjectDelDate;
	}
	
}
