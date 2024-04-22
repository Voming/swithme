package swithme.model.group.dto;

public class GroupMylistDto {
//	SGROUP_ID	NUMBER
//	SGROUP_NAME	VARCHAR2(30 BYTE)
//	SGROUP_OPEN	CHAR(1 BYTE)
//	SGROUP_PWD	NUMBER
//	SGROUP_EXPLAIN	VARCHAR2(4000 BYTE)
//	SGROUP_IMG_PATH	VARCHAR2(1000 BYTE)
//	SGROUP_IMG_NAME	VARCHAR2(200 BYTE)

	private Integer sgroupId;
	private String sgroupName;
	private String sgroupImgPath;
	private String sgroupImgName;

	@Override
	public String toString() {
		return "GroupMylistDto [sgroupId=" + sgroupId + ", sgroupName=" + sgroupName + ", sgroupImgPath="
				+ sgroupImgPath + ", sgroupImgName=" + sgroupImgName + "]";
	}

	public GroupMylistDto(Integer sgroupId, String sgroupName, String sgroupImgPath, String sgroupImgName) {
		super();
		this.sgroupId = sgroupId;
		this.sgroupName = sgroupName;
		this.sgroupImgPath = sgroupImgPath;
		this.sgroupImgName = sgroupImgName;
	}

	public Integer getSgroupId() {
		return sgroupId;
	}

	public String getSgroupName() {
		return sgroupName;
	}

	public String getSgroupImgPath() {
		return sgroupImgPath;
	}

	public String getSgroupImgName() {
		return sgroupImgName;
	}

}
