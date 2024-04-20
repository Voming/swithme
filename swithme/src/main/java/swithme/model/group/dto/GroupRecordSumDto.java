package swithme.model.group.dto;

public class GroupRecordSumDto {
	private Integer sumMin;
	private String memId;

	public GroupRecordSumDto(Integer sumMin, String memId) {
		super();
		this.sumMin = sumMin;
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "GroupRecordSumDto [sumMin=" + sumMin + ", memId=" + memId + "]";
	}

	public Integer getSumMin() {
		return sumMin;
	}

	public String getMemId() {
		return memId;
	}

}
