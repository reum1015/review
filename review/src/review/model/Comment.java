package review.model;

public class Comment {
	
	private int id;						// 덧글 번호
	private String nick_name;    // 글쓴이			
	private String content;		//   내용
	private int hit;				//   조회수
	private String reg_date;		// 등록일자
	private String edit_date;		// 변경일자
	private String ip_address;	// 아이피 주소
	private String reported;		// 신고 유무
	private String tag;		//  해시태그
	private int member_id;
	private int article_id;
	
	// 페이지 구현을 위해서 추가된 값
		private int limit_start;
		private int list_count;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getNick_name() {
			return nick_name;
		}
		public void setNick_name(String nick_name) {
			this.nick_name = nick_name;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
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
		public int getArticle_id() {
			return article_id;
		}
		public void setArticle_id(int article_id) {
			this.article_id = article_id;
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
		@Override
		public String toString() {
			return "Comment [id=" + id + ", nick_name=" + nick_name + ", content=" + content + ", hit=" + hit
					+ ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", ip_address=" + ip_address
					+ ", reported=" + reported + ", tag=" + tag + ", member_id=" + member_id + ", article_id="
					+ article_id + ", limit_start=" + limit_start + ", list_count=" + list_count + "]";
		}
		
		
		
		
		
		
}
