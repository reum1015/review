package review.model;

public class BookMark {

	private int id; 	// 북마크 번호
	private int member_id;   // 회원번호
	private int article_id;    // 회차번호
	private String nick_name;		// 닉네임
	private String title;               // 제목
	private String content;		//   내용
	private String category;     // 카테고리
	private String reg_date;		// 등록일자
	private String edit_date;		// 변경일자
	private String ip_address;	// 아이피 주소
	private String tag;			//  해시태그
	
	// 페이지 구현을 위해서 추가된 값
		private int limit_start;
		private int list_count;
	
	// 갤러리 구현을 위해서 추가된 값
	private boolean gallery;
	private String imagePath;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getLimit_start() {
		return limit_start;
	}
	public void setLimit_start(int limit_start) {
		this.limit_start = limit_start;
	}
	public int getList_count() {
		return list_count;
	}
	public void setList_count(int list_count) {
		this.list_count = list_count;
	}
	public boolean isGallery() {
		return gallery;
	}
	public void setGallery(boolean gallery) {
		this.gallery = gallery;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "BookMark [id=" + id + ", member_id=" + member_id + ", article_id=" + article_id + ", nick_name="
				+ nick_name + ", title=" + title + ", content=" + content + ", category=" + category + ", reg_date="
				+ reg_date + ", edit_date=" + edit_date + ", ip_address=" + ip_address + ", tag=" + tag
				+ ", limit_start=" + limit_start + ", list_count=" + list_count + ", gallery=" + gallery
				+ ", imagePath=" + imagePath + "]";
	}

	
	
}
