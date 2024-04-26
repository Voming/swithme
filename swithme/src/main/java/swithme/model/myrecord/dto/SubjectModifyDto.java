package swithme.model.myrecord.dto;

public class SubjectModifyDto {
	private String memId;
	private String subjectName;
	private String modifySubName;
	private String modifySubColor;
	@Override
	public String toString() {
		return "SubjectModifyDto [memId=" + memId + ", subjectName=" + subjectName + ", modifySubName=" + modifySubName
				+ ", modifySubColor=" + modifySubColor + "]";
	}
	public SubjectModifyDto(String memId, String subjectName, String modifySubName, String modifySubColor) {
		super();
		this.memId = memId;
		this.subjectName = subjectName;
		this.modifySubName = modifySubName;
		this.modifySubColor = modifySubColor;
	}
	public String getMemId() {
		return memId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getModifySubName() {
		return modifySubName;
	}
	public String getModifySubColor() {
		return modifySubColor;
	}
}
