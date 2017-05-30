package review.model;

public class Member {
	
	private int id;						// 회원번호
	private String member_level;
	private String nick_name;		// 닉네임
	private String name;				// 이름
	private String age;						
	private String email;				// 이메일
	private String user_pw;			// 패스워드
	private String gender;			// 성별
	private String reg_date;		// 가입일자
	private String edit_date;		// 변경일자	
	private String introduce;
	private String new_user_pw;  // 회원정보 수정시 신규비번 저장
	
	
	//갤러리 구현
	private String imagePath;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getMember_level() {
		return member_level;
	}


	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}


	public String getNick_name() {
		return nick_name;
	}


	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public String getEdit_date() {
		return edit_date;
	}


	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getNew_user_pw() {
		return new_user_pw;
	}


	public void setNew_user_pw(String new_user_pw) {
		this.new_user_pw = new_user_pw;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", member_level=" + member_level + ", nick_name=" + nick_name + ", name=" + name
				+ ", age=" + age + ", email=" + email + ", user_pw=" + user_pw + ", gender=" + gender + ", reg_date="
				+ reg_date + ", edit_date=" + edit_date + ", introduce=" + introduce + ", new_user_pw=" + new_user_pw
				+ ", imagePath=" + imagePath + "]";
	}
	

	
}