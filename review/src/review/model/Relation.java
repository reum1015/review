package review.model;

public class Relation {
	
	private int id;						// 회원번호
	private int send_id;
	private int get_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSend_id() {
		return send_id;
	}
	public void setSend_id(int send_id) {
		this.send_id = send_id;
	}
	public int getGet_id() {
		return get_id;
	}
	public void setGet_id(int get_id) {
		this.get_id = get_id;
	}
	@Override
	public String toString() {
		return "Relation [id=" + id + ", send_id=" + send_id + ", get_id=" + get_id + "]";
	}
	
	
	
	
	
	
}
