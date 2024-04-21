package swithme.model.myrecord.dto;

public class DayStudyTimeDto {
//SUBJECT_ID, SUBJECT_NAME ,DIFFTIME ,SUBJECT_COLOR 
//당일 과목별 공부시간 합계 + 색깔 
	private Integer subjectId;
	private String subjectName;
	private String difftime;
	private String subjectColor;
	@Override
	public String toString() {
		return "DayStudyTimeDto [subjectId=" + subjectId + ", subjectName=" + subjectName + ", difftime=" + difftime
				+ ", subjectColor=" + subjectColor + "]";
	}
	public DayStudyTimeDto(Integer subjectId, String subjectName, String difftime, String subjectColor) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.difftime = difftime;
		this.subjectColor = subjectColor;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getDifftime() {
		return difftime;
	}
	public String getSubjectColor() {
		return subjectColor;
	}
}
