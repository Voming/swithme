package swithme.model.myrecord.dto;

public class RecordDto {
//	RECORD_ID         NOT NULL NUMBER       
//	RECORD_SUBJECT_ID NOT NULL NUMBER       
//	RECORD_MEM_ID     NOT NULL VARCHAR2(20) 
//	RECORD_START      NOT NULL TIMESTAMP(6) 
//	RECORD_END                 TIMESTAMP(6) 
	
	private Integer recordId;
	private Integer recordSubjectId;
	private String recordMemId;
	private String recordStart; //timestamp
	private String recordEnd;	//timestamp
	@Override
	public String toString() {
		return "RecordDto [recordId=" + recordId + ", recordSubjectId=" + recordSubjectId + ", recordMemId="
				+ recordMemId + ", recordStart=" + recordStart + ", recordEnd=" + recordEnd + "]";
	}
	public RecordDto(Integer recordId, Integer recordSubjectId, String recordMemId, String recordStart,
			String recordEnd) {
		super();
		this.recordId = recordId;
		this.recordSubjectId = recordSubjectId;
		this.recordMemId = recordMemId;
		this.recordStart = recordStart;
		this.recordEnd = recordEnd;
	}
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}
	public Integer getRecordSubjectId() {
		return recordSubjectId;
	}
	public void setRecordSubjectId(Integer recordSubjectId) {
		this.recordSubjectId = recordSubjectId;
	}
	public String getRecordMemId() {
		return recordMemId;
	}
	public void setRecordMemId(String recordMemId) {
		this.recordMemId = recordMemId;
	}
	public String getRecordStart() {
		return recordStart;
	}
	public void setRecordStart(String recordStart) {
		this.recordStart = recordStart;
	}
	public String getRecordEnd() {
		return recordEnd;
	}
	public void setRecordEnd(String recordEnd) {
		this.recordEnd = recordEnd;
	}
	
	
}
