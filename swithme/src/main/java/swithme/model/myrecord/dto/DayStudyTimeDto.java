package swithme.model.myrecord.dto;

import java.util.List;

public class DayStudyTimeDto {
//SUBJECT_ID, SUBJECT_NAME ,DIFFTIME ,SUBJECT_COLOR 
//당일 과목별 공부시간 합계 + 색깔 
	private String subjectName;
	private String color;
	private List<DateDifftimeDto> diffTimeByDayList;
	@Override
	public String toString() {
		return "DayStudyTimeDto [subjectName=" + subjectName + ", color=" + color + ", diffTimeByDayList="
				+ diffTimeByDayList + "]";
	}
	public DayStudyTimeDto(String subjectName, String color, List<DateDifftimeDto> diffTimeByDayList) {
		super();
		this.subjectName = subjectName;
		this.color = color;
		this.diffTimeByDayList = diffTimeByDayList;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getColor() {
		return color;
	}
	public List<DateDifftimeDto> getDiffTimeByDayList() {
		return diffTimeByDayList;
	}
//////
	public DayStudyTimeDto() {
		super();
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public void setDiffTimeByDayList(List<DateDifftimeDto> diffTimeByDayList) {
		this.diffTimeByDayList = diffTimeByDayList;
	}
}
