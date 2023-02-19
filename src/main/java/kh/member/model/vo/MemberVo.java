package kh.member.model.vo;

public class MemberVo {
	
	//	MEMBER
	//	NICKNAME          VARCHAR2(20) 
	//	PWD      NOT NULL VARCHAR2(20) 
	// 	PWDCHECK NOT NULL VARCHAR2(20)
	//	EMAIL    NOT NULL VARCHAR2(20)
		
	String nickname; // 닉네임
	String pwd; // 비밀번호
	String pwdcheck; // 비밀번호 확인
	String email; // 이메일
	
	@Override
	public String toString() {
		return "MemberVo [nickname=" + nickname + ", pwd=" + pwd + ", pwdcheck=" + pwdcheck + ", email=" + email + "]";
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getPwdcheck() {
		return pwdcheck;
	}

	public void setPwdcheck(String pwdcheck) {
		this.pwdcheck = pwdcheck;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

}
