package swithme.model.myrecord.dto;

public class RecordCalendarDto {
	//	SUBJECT_NAME
	//	RECORD_START
	//	RECORD_END 
//캘린더에 연동할 record정보
	private String subjectName;
	private String recordStart;
	private String recordEnd;
	private String subjectColor;
	@Override
	public String toString() {
		return "RecordCalendarDto [subjectName=" + subjectName + ", recordStart=" + recordStart + ", recordEnd="
				+ recordEnd + ", subjectColor=" + subjectColor + "]";
	}
	public RecordCalendarDto(String subjectName, String recordStart, String recordEnd, String subjectColor) {
		super();
		this.subjectName = subjectName;
		this.recordStart = recordStart;
		this.recordEnd = recordEnd;
		this.subjectColor = subjectColor;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getRecordStart() {
		return recordStart;
	}
	public String getRecordEnd() {
		return recordEnd;
	}
	public String getSubjectColor() {
		return subjectColor;
	}
}
