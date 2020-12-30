package kr.or.kh.member;

public class MemberDTO {
	private String id;
	private String pw;
	private String addr;
	public MemberDTO(String id, String pw, String addr, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.addr = addr;
		this.tel = tel;
	}
	private String tel;
	public MemberDTO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", addr=" + addr + ", tel=" + tel + "]";
	}
}
