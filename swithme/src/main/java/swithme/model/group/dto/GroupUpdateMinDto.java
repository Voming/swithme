package swithme.model.group.dto;

public class GroupUpdateMinDto {
//	SGROUP_ID	NUMBER
//	SGROUP_NAME	VARCHAR2(30 BYTE)
//	SGROUP_OPEN	CHAR(1 BYTE)
//	SGROUP_PWD	NUMBER
//	SGROUP_EXPLAIN	VARCHAR2(4000 BYTE)
//	SGROUP_IMG_PATH	VARCHAR2(1000 BYTE)
//	SGROUP_IMG_NAME	VARCHAR2(200 BYTE)

	private Integer sgroupId;
	private String sgroupName;
	private String sgroupOpen;
	private String sgroupPwd;
	private String sgroupEx;

	@Override
	public String toString() {
		return "GroupUpdateMinDto [sgroupId=" + sgroupId + ", sgroupName=" + sgroupName + ", sgroupOpen=" + sgroupOpen
				+ ", sgroupPwd=" + sgroupPwd + ", sgroupEx=" + sgroupEx + "]";
	}

	public GroupUpdateMinDto(Integer sgroupId, String sgroupName, String sgroupOpen, String sgroupPwd,
			String sgroupEx) {
		super();
		this.sgroupId = sgroupId;
		this.sgroupName = sgroupName;
		this.sgroupOpen = sgroupOpen;
		this.sgroupPwd = sgroupPwd;
		this.sgroupEx = sgroupEx;
	}

	public Integer getSgroupId() {
		return sgroupId;
	}

	public String getSgroupName() {
		return sgroupName;
	}

	public String getSgroupOpen() {
		return sgroupOpen;
	}

	public String getSgroupPwd() {
		return sgroupPwd;
	}

	public String getSgroupEx() {
		return sgroupEx;
	}

}
