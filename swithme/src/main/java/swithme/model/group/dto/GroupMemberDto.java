package swithme.model.group.dto;

public class GroupMemberDto {
//	SGROUP_ID	NUMBER
//	SGROUP_MEM_ID	VARCHAR2(20 BYTE)
	private Integer groupId;
	private String groupMemId;

	public GroupMemberDto(Integer groupId, String groupMemId) {
		super();
		this.groupId = groupId;
		this.groupMemId = groupMemId;
	}

	@Override
	public String toString() {
		return "GroupMemberDto [groupId=" + groupId + ", groupMemId=" + groupMemId + "]";
	}

	public Integer getGroupId() {
		return groupId;
	}

	public String getGroupMemId() {
		return groupMemId;
	}
	
	

}
