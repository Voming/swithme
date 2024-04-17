package swithme.model.member.dto;

public class MemberInfoDto {

	private String memId;
	private String memEmail;
	
	
	@Override
	public String toString() {
		return "LoginInfoDto [memId=" + memId + ", memEmail=" + memEmail + "]";
	}

	public MemberInfoDto(String memId,  String memEmail) {
		super();
		this.memId = memId;
		this.memEmail = memEmail;
	}

	public String getMemId() {
		return memId;
	}

	public String getMemEmail() {
		return memEmail;
	}
}
