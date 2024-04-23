package swithme.model.group.dto;

import java.io.Serializable;

public class GroupRecordDaySumDto implements Serializable {

	private static final long serialVersionUID = -8767726672174988741L;
	// 그룹원 날짜별 공부량
	String memId;
	String d1;
	String d2;
	String d3;
	String d4;
	String d5;
	String d6;
	String d7;

	@Override
	public String toString() {
		return "GroupRecordDaySumDto [memId=" + memId + ", d1=" + d1 + ", d2=" + d2 + ", d3=" + d3 + ", d4=" + d4
				+ ", d5=" + d5 + ", d6=" + d6 + ", d7=" + d7 + "]";
	}

	public GroupRecordDaySumDto(String memId, String d1, String d2, String d3, String d4, String d5, String d6,
			String d7) {
		super();
		this.memId = memId;
		this.d1 = d1;
		this.d2 = d2;
		this.d3 = d3;
		this.d4 = d4;
		this.d5 = d5;
		this.d6 = d6;
		this.d7 = d7;
	}

	public String getMemId() {
		return memId;
	}

	public String getD1() {
		return d1;
	}

	public String getD2() {
		return d2;
	}

	public String getD3() {
		return d3;
	}

	public String getD4() {
		return d4;
	}

	public String getD5() {
		return d5;
	}

	public String getD6() {
		return d6;
	}

	public String getD7() {
		return d7;
	}

}
