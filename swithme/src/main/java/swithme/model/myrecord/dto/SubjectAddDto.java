package swithme.model.myrecord.dto;

public class SubjectAddDto {
	private String subjectMemId;
	private String subjectName;
	private String subjectColor;

	@Override
	public String toString() {
		return "SubjectAddDto [subjectMemId=" + subjectMemId + ", subjectName=" + subjectName + ", subjectColor="
				+ subjectColor + "]";
	}
	
	public SubjectAddDto(String subjectMemId, String subjectName, String subjectColor) {
		super();
		this.subjectMemId = subjectMemId;
		this.subjectName = subjectName;
		this.subjectColor = subjectColor;
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
