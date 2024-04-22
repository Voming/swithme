package swithme.model.group.dto;

public class GroupRecordSumDto {
	private String memId;
	private String sumMin;

	public GroupRecordSumDto(String memId, String sumMin) {
		super();
		this.memId = memId;
		this.sumMin = sumMin;
	}

	@Override
	public String toString() {
		return "GroupRecordSumDto [memId=" + memId + ", sumMin=" + sumMin + "]";
	}

	public String getMemId() {
		return memId;
	}

	public String getSumMin() {
		return sumMin;
	}

}
