package swithme.model.group.dto;


public class GroupMylistDto {
//	SGROUP_ID	NUMBER
//	SGROUP_NAME	VARCHAR2(30 BYTE)
//	SGROUP_OPEN	CHAR(1 BYTE)
//	SGROUP_PWD	NUMBER
//	SGROUP_EXPLAIN	VARCHAR2(4000 BYTE)
//	SGROUP_IMG_PATH	VARCHAR2(1000 BYTE)
//	SGROUP_IMG_NAME	VARCHAR2(200 BYTE)

	private Integer groupId;
	private String groupName;
	private String groupImgPath;
	private String groupImgName;

	public GroupMylistDto(Integer groupId, String groupName, String groupImgPath, String groupImgName) {
		super();
		this.groupId = groupId;
		this.groupName = groupName;
		this.groupImgPath = groupImgPath;
		this.groupImgName = groupImgName;
	}

	@Override
	public String toString() {
		return "GroupInfoDto [groupId=" + groupId + ", groupName=" + groupName + ", groupImgPath=" + groupImgPath
				+ ", groupImgName=" + groupImgName + "]";
	}

	public Integer getGroupId() {
		return groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public String getGroupImgPath() {
		return groupImgPath;
	}

	public String getGroupImgName() {
		return groupImgName;
	}

}
