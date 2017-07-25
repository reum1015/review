package review.model;

public class Favorite {

	private int id;		// 
	private int member_id;   //회원 번호
	private int article_id;   // 책 번호

	private String title;               // 제목
	private String content;		//   내용
	private String category;     // 카테고리
		
	// 페이지 구현을 위해서 추가된값
	private int limitStart;
	private int listCount;
	
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
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
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
		return "Favorite [id=" + id + ", member_id=" + member_id + ", article_id=" + article_id + ", title=" + title
				+ ", content=" + content + ", category=" + category + ", limitStart=" + limitStart + ", listCount="
				+ listCount + ", gallery=" + gallery + ", imagePath=" + imagePath + "]";
	}
	
}
