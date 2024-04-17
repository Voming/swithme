package swithme.model.myrecord.dto;

public class SubjectDto {
//	SUBJECT_ID       NOT NULL NUMBER       
//	MEM_ID           NOT NULL VARCHAR2(20) 
//	SUBJECT_NAME     NOT NULL VARCHAR2(20) 
//	SUBJECT_ADD_DATE NOT NULL TIMESTAMP(6) 
//	SUBJECT_DEL_DATE          TIMESTAMP(6) 
//	SUBJECT_COLOR    NOT NULL CHAR(1)    
	
	private Integer subjectId;
	private String subjectMemId;
	private String subjectName;
	private String subjectAddDate;
	private String subjectDelDate;
	private String subjectColor;
	@Override
	public String toString() {
		return "SubjectDto [subjectId=" + subjectId + ", subjectMemId=" + subjectMemId + ", subjectName=" + subjectName
				+ ", subjectAddDate=" + subjectAddDate + ", subjectDelDate=" + subjectDelDate + ", subjectColor="
				+ subjectColor + "]";
	}
	public SubjectDto(Integer subjectId, String subjectMemId, String subjectName, String subjectAddDate,
			String subjectDelDate, String subjectColor) {
		super();
		this.subjectId = subjectId;
		this.subjectMemId = subjectMemId;
		this.subjectName = subjectName;
		this.subjectAddDate = subjectAddDate;
		this.subjectDelDate = subjectDelDate;
		this.subjectColor = subjectColor;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public String getSubjectMemId() {
		return subjectMemId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getSubjectAddDate() {
		return subjectAddDate;
	}
	public String getSubjectDelDate() {
		return subjectDelDate;
	}
	public String getSubjectColor() {
		return subjectColor;
	}
	
}
