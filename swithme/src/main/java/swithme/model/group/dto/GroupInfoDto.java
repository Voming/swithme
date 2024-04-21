package swithme.model.group.dto;

public class GroupInfoDto {
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
	private Integer sgroupPwd;
	private String sgroupEx;
	private String sgroupImgPath;
	private String sgroupImgName;
	private String sgroupMemId;

	@Override
	public String toString() {
		return "GroupInfoDto [sgroupId=" + sgroupId + ", sgroupName=" + sgroupName + ", sgroupOpen=" + sgroupOpen
				+ ", sgroupPwd=" + sgroupPwd + ", sgroupEx=" + sgroupEx + ", sgroupImgPath=" + sgroupImgPath
				+ ", sgroupImgName=" + sgroupImgName + ", sgroupMemId=" + sgroupMemId + "]";
	}

	public GroupInfoDto(Integer sgroupId, String sgroupName, String sgroupOpen, Integer sgroupPwd, String sgroupEx,
			String sgroupImgPath, String sgroupImgName, String sgroupMemId) {
		super();
		this.sgroupId = sgroupId;
		this.sgroupName = sgroupName;
		this.sgroupOpen = sgroupOpen;
		this.sgroupPwd = sgroupPwd;
		this.sgroupEx = sgroupEx;
		this.sgroupImgPath = sgroupImgPath;
		this.sgroupImgName = sgroupImgName;
		this.sgroupMemId = sgroupMemId;
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

	public Integer getSgroupPwd() {
		return sgroupPwd;
	}

	public String getSgroupEx() {
		return sgroupEx;
	}

	public String getSgroupImgPath() {
		return sgroupImgPath;
	}

	public String getSgroupImgName() {
		return sgroupImgName;
	}

	public String getSgroupMemId() {
		return sgroupMemId;
	}

}
