package swithme.model.member.dto;

public class MemberInfoDto {

	private String memId;
	private String memEmail;
	private String memPwd;
	
	
	@Override
	public String toString() {
		return "MemberInfoDto [memId=" + memId + ", memEmail=" + memEmail + ", memPwd=" + memPwd + "]";
	}

	public MemberInfoDto(String memId, String memEmail, String memPwd) {
		super();
		this.memId = memId;
		this.memEmail = memEmail;
		this.memPwd = memPwd;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public String getMemId() {
		return memId;
	}

	public String getMemEmail() {
		return memEmail;
	}
}
