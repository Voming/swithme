package swithme.model.ranking.dto;

public class RankingDto {
	
	private String recordMemId;
	private Integer difftime;
	
	@Override
	public String toString() {
		return "RankingDto [recordMemId=" + recordMemId + ", difftime=" + difftime + "]";
	}
	
	public RankingDto(String recordMemId, Integer difftime) {
		super();
		this.recordMemId = recordMemId;
		this.difftime = difftime;
	}

	public String getRecordMemId() {
		return recordMemId;
	}
	public Integer getDifftime() {
		return difftime;
	}
}
