package swithme.model.myrecord.dto;

public class SubjectAddDto {
	private Integer subjectId;
	private String subjectMemId;
	private String subjectName;
	private String subjectColor;
	@Override
	public String toString() {
		return "SubjectAddDto [subjectId=" + subjectId + ", subjectMemId=" + subjectMemId + ", subjectName="
				+ subjectName + ", subjectColor=" + subjectColor + "]";
	}
	public SubjectAddDto(Integer subjectId, String subjectMemId, String subjectName, String subjectColor) {
		super();
		this.subjectId = subjectId;
		this.subjectMemId = subjectMemId;
		this.subjectName = subjectName;
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
	public String getSubjectColor() {
		return subjectColor;
	}
	
}
