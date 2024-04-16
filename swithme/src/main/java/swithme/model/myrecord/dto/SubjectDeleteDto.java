package swithme.model.myrecord.dto;

public class SubjectDeleteDto {
//	SUBJECT_ID       NOT NULL NUMBER       
//	MEM_ID           NOT NULL VARCHAR2(20) 
//	SUBJECT_NAME     NOT NULL VARCHAR2(20) 
//	SUBJECT_ADD_DATE NOT NULL TIMESTAMP(6) 
//	SUBJECT_DEL_DATE          TIMESTAMP(6) 
//	SUBJECT_COLOR    NOT NULL CHAR(1)    
	
	private Integer subjectId;
	private String subjectMemId;
	@Override
	public String toString() {
		return "SubjectDeleteDto [subjectId=" + subjectId + ", subjectMemId=" + subjectMemId + "]";
	}
	public SubjectDeleteDto(Integer subjectId, String subjectMemId) {
		super();
		this.subjectId = subjectId;
		this.subjectMemId = subjectMemId;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public String getSubjectMemId() {
		return subjectMemId;
	}
	
	
}
