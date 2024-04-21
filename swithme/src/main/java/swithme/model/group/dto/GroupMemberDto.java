package swithme.model.group.dto;

public class GroupMemberDto {
//	SGROUP_ID	NUMBER
//	SGROUP_MEM_ID	VARCHAR2(20 BYTE)
	private Integer sgroupId;
	private String sgroupMemId;
	@Override
	public String toString() {
		return "GroupMemberDto [sgroupId=" + sgroupId + ", sgroupMemId=" + sgroupMemId + "]";
	}
	public GroupMemberDto(Integer sgroupId, String sgroupMemId) {
		super();
		this.sgroupId = sgroupId;
		this.sgroupMemId = sgroupMemId;
	}
	public Integer getSgroupId() {
		return sgroupId;
	}
	public String getSgroupMemId() {
		return sgroupMemId;
	}


}
