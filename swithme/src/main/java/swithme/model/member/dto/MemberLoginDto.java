package swithme.model.member.dto;

public class MemberLoginDto {

	private String memId;
	private String memPwd;
	
	
	@Override
	public String toString() {
		return "MemberLoginDto [memId=" + memId + ", memPwd=" + memPwd + "]";
	}


	public MemberLoginDto(String memId, String memPwd) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
	}


	public String getMemId() {
		return memId;
	}


	public String getMemPwd() {
		return memPwd;
	}

}
