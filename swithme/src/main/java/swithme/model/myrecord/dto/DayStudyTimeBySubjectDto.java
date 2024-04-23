package swithme.model.myrecord.dto;


public class DayStudyTimeBySubjectDto {
//SUBJECT_ID, SUBJECT_NAME ,DIFFTIME ,SUBJECT_COLOR 
//당일 과목별 공부시간 합계 + 색깔 
	private String subjectName;
	private String color;
	private String difftime;
	private String onlyDate;
	@Override
	public String toString() {
		return "DayStudyTimeBySubjectDto [subjectName=" + subjectName + ", color=" + color + ", difftime=" + difftime
				+ ", onlyDate=" + onlyDate + "]";
	}
	public DayStudyTimeBySubjectDto(String subjectName, String color, String difftime, String onlyDate) {
		super();
		this.subjectName = subjectName;
		this.color = color;
		this.difftime = difftime;
		this.onlyDate = onlyDate;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getColor() {
		return color;
	}
	public String getDifftime() {
		return difftime;
	}
	public String getOnlyDate() {
		return onlyDate;
	}

}
