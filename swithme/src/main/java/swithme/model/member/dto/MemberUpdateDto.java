package swithme.model.member.dto;

public class MemberUpdateDto {

	private String memId;
	private String memPwd;
	private String memPwdNew;
	//private String memEmail;
	
	@Override
	public String toString() {
		return "MemberUpdateDto [memId=" + memId + ", memPwd=" + memPwd + ", memPwdNew=" + memPwdNew + ","+ 
	 "]";
	}
	
	public MemberUpdateDto(String memId, String memPwd, String memPwdNew) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memPwdNew = memPwdNew;
		//this.memEmail = memEmail;
	}
	
	public String getMemId() {
		return memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public String getMemPwdNew() {
		return memPwdNew;
	}
//	public String getMemEmail() {
//		return memEmail;
//	}
	

	
	
}
