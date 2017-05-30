package review.jsp.helper;

/**
 * 업로드 된 파일의 정보를 저장하기 위한 JavaBeans
 * - 이 클래스의 객체가 업로드 된 파일의 수 만큼 생성되어 List 형태로 보관된다.
 */
public class FileInfo {
	private String fieldName; 	 			// <input type="file">의 name속성
	private String orginName; 				// 원본 파일 이름
	private String fileDir; 				// 파일이 저장되어 있는 서버상의 경로
	private String fileName; 				// 서버상의 파일 이름
	private String contentType; 			// 파일의 형식
	private long fileSize; 					// 파일의 용량
	private int book_id;					// 작품 번호
	private int episode_id;					// 에피소드 번호
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getOrginName() {
		return orginName;
	}
	public void setOrginName(String orginName) {
		this.orginName = orginName;
	}
	public String getFileDir() {
		return fileDir;
	}
	public void setFileDir(String fileDir) {
		this.fileDir = fileDir;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getEpisode_id() {
		return episode_id;
	}
	public void setEpisode_id(int episode_id) {
		this.episode_id = episode_id;
	}
	@Override
	public String toString() {
		return "FileInfo [fieldName=" + fieldName + ", orginName=" + orginName + ", fileDir=" + fileDir + ", fileName="
				+ fileName + ", contentType=" + contentType + ", fileSize=" + fileSize + ", book_id=" + book_id
				+ ", episode_id=" + episode_id + "]";
	}
	
	
	
	
	
	

}