package review.model;

public class Article {
	
	private int id;						// 회원번호
	private String title;               // 제목
	private String nick_name;    // 글쓴이	
	private String user_pw;
	private String content;		//   내용
	private String category;     // 카테고리
	private int hit;				//   조회수
	private String reg_date;		// 등록일자
	private String edit_date;		// 변경일자
	private String ip_address;	// 아이피 주소
	private String reported;		// 신고 유무
	private String tag;			//  해시태그
	private int member_id;
	
	//게시물의 좋아요 누적값
	private int like_count;
	private int total_like;
	// 페이지 구현을 위해서 추가된 값
		private int limit_start;
		private int list_count;
		
		//갤러리 구현
		private String imagePath;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getNick_name() {
			return nick_name;
		}

		public void setNick_name(String nick_name) {
			this.nick_name = nick_name;
		}

		public String getUser_pw() {
			return user_pw;
		}

		public void setUser_pw(String user_pw) {
			this.user_pw = user_pw;
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

		public int getHit() {
			return hit;
		}

		public void setHit(int hit) {
			this.hit = hit;
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

		public String getReported() {
			return reported;
		}

		public void setReported(String reported) {
			this.reported = reported;
		}

		public String getTag() {
			return tag;
		}

		public void setTag(String tag) {
			this.tag = tag;
		}

		public int getMember_id() {
			return member_id;
		}

		public void setMember_id(int member_id) {
			this.member_id = member_id;
		}

		public int getLike_count() {
			return like_count;
		}

		public void setLike_count(int like_count) {
			this.like_count = like_count;
		}

		public int getTotal_like() {
			return total_like;
		}

		public void setTotal_like(int total_like) {
			this.total_like = total_like;
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

		public String getImagePath() {
			return imagePath;
		}

		public void setImagePath(String imagePath) {
			this.imagePath = imagePath;
		}

		@Override
		public String toString() {
			return "Article [id=" + id + ", title=" + title + ", nick_name=" + nick_name + ", user_pw=" + user_pw
					+ ", content=" + content + ", category=" + category + ", hit=" + hit + ", reg_date=" + reg_date
					+ ", edit_date=" + edit_date + ", ip_address=" + ip_address + ", reported=" + reported + ", tag="
					+ tag + ", member_id=" + member_id + ", like_count=" + like_count + ", total_like=" + total_like
					+ ", limit_start=" + limit_start + ", list_count=" + list_count + ", imagePath=" + imagePath + "]";
		}

	
		
		
}
