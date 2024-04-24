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

	public String getSubjectName() {
		return subjectName;
	}
	public String getColor() {
		return color;
	}
	public List<DateDifftimeDto> getDiffTimeByDayList() {
		return diffTimeByDayList;
	}
/////
	//collection을 사용하려면 FULL생성자는 사용할 수 없다.
	//처리과정에서 오류발생 list안에 있는 필드를 먼저 채우고 채워진 리스트를 여기서 넣는 것이기 때문이다.
	//따라서 기본생성자와 setter가 있어야한다.
	
	
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
