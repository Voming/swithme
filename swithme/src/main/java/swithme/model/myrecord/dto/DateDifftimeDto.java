package swithme.model.myrecord.dto;

public class DateDifftimeDto {
	private Integer difftime;
	private String onlyDate;
	@Override
	public String toString() {
		return "DiffTimeByDay [difftime=" + difftime + ", onlyDate=" + onlyDate + "]";
	}


	public Integer getDifftime() {
		return difftime;
	}

	public String getOnlyDate() {
		return onlyDate;
	}
	//////////////////

	public DateDifftimeDto() {
		super();
	}
	public void setDifftime(Integer difftime) {
		this.difftime = difftime;
	}
	public void setOnlyDate(String onlyDate) {
		this.onlyDate = onlyDate;
	}
}