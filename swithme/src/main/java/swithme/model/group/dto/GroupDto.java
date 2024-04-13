package swithme.model.group.dto;

public class GroupDto {
//	SGROUP_ID	NUMBER
//	SGROUP_NAME	VARCHAR2(30 BYTE)
//	SGROUP_OPEN	CHAR(1 BYTE)
//	SGROUP_PWD	NUMBER
//	SGROUP_EXPLAIN	VARCHAR2(4000 BYTE)
//	SGROUP_IMG_PATH	VARCHAR2(1000 BYTE)
//	SGROUP_IMG_NAME	VARCHAR2(200 BYTE)
	
	private Integer groupId;
	private String groupName;
	private String groupOpen;
	private Integer groupPwd;
	private String groupEx;
	private String groupImgPath;
	private String groupImgName;
	
	public GroupDto(Integer groupId, String groupName, String groupOpen, Integer groupPwd, String groupEx,
			String groupImgPath, String groupImgName) {
		super();
		this.groupId = groupId;
		this.groupName = groupName;
		this.groupOpen = groupOpen;
		this.groupPwd = groupPwd;
		this.groupEx = groupEx;
		this.groupImgPath = groupImgPath;
		this.groupImgName = groupImgName;
	}

	@Override
	public String toString() {
		return "GroupDto [groupId=" + groupId + ", groupName=" + groupName + ", groupOpen=" + groupOpen + ", groupPwd="
				+ groupPwd + ", groupEx=" + groupEx + ", groupImgPath=" + groupImgPath + ", groupImgName="
				+ groupImgName + "]";
	}

	public Integer getGroupId() {
		return groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public String getGroupOpen() {
		return groupOpen;
	}

	public Integer getGroupPwd() {
		return groupPwd;
	}

	public String getGroupEx() {
		return groupEx;
	}

	public String getGroupImgPath() {
		return groupImgPath;
	}

	public String getGroupImgName() {
		return groupImgName;
	}
}
