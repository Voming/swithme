package swithme.model.group.dto;

public class GroupDto {
//	GROUP_ID	NUMBER
//	GROUP_NAME	CHAR(30 BYTE)
//	GROUP_OPEN	CHAR(1 BYTE)
//	GROUP_PWD	NUMBER
//	GROUP_EXPLAIN	VARCHAR2(4000 BYTE)
//	GROUP_IMG_PATH	VARCHAR2(1000 BYTE)
//	GROUP_IMG_NAME	VARCHAR2(200 BYTE)
	
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
