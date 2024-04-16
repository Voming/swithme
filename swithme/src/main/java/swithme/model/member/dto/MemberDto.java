package swithme.model.member.dto;

public class MemberDto {

	private String memId;
	private String memPwd;
	private String memEmail;
	
	@Override
	public String toString() {
		return "MemberDto [memId=" + memId + ", memPwd=" + memPwd + ", memEmail=" + memEmail + "]";
	}

	
	
	public MemberDto(String memId, String memPwd, String memEmail) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memEmail = memEmail;
	}



	public String getMemId() {
		return memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public String getMemEmail() {
		return memEmail;
	}
	
	

	
	
}
