package swithme.model.myrecord.dto;

public class RecordTimeDto {
	private Integer recordSubjectId;
	private String recordMemId;
	private String recordStart;
	public RecordTimeDto(Integer recordSubjectId, String recordMemId, String recordStart) {
		super();
		this.recordSubjectId = recordSubjectId;
		this.recordMemId = recordMemId;
		this.recordStart = recordStart;
	}
	@Override
	public String toString() {
		return "RecordTimeDto [recordSubjectId=" + recordSubjectId + ", recordMemId=" + recordMemId + ", recordStart="
				+ recordStart + "]";
	}
	public Integer getRecordSubjectId() {
		return recordSubjectId;
	}
	public String getRecordMemId() {
		return recordMemId;
	}
	public String getRecordStart() {
		return recordStart;
	}
}
