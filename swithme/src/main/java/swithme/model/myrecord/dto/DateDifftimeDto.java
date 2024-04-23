package swithme.model.myrecord.dto;


public class DateDifftimeDto {
	private String difftime;
	private String onlyDate;
	@Override
	public String toString() {
		return "DiffTimeByDay [difftime=" + difftime + ", onlyDate=" + onlyDate + "]";
	}
	public DateDifftimeDto(String difftime, String onlyDate) {
		super();
		this.difftime = difftime;
		this.onlyDate = onlyDate;
	}

	public String getDifftime() {
		return difftime;
	}

	public String getOnlyDate() {
		return onlyDate;
	}
	//////////////////

	public DateDifftimeDto() {
		super();
	}
	public void setDifftime(String difftime) {
		this.difftime = difftime;
	}
	public void setOnlyDate(String onlyDate) {
		this.onlyDate = onlyDate;
	}
}
