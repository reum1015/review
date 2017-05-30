package review.jsp.helper;

public class Util {

	private static Util current = null;
	
	public static Util getInstance(){
		
		if(current == null){
			current = new Util();
		}
		return current;
	}
	
	public static void freeInstance(){
		current = null;
	}
	
	private Util(){
		super();
	}
	//싱글톤 객체 생성 끝
	
	/**
	 *  범위를 갖는 랜덤값을 생성하여 리턴하는 매서드
	 * @param min - 범위 안에서 최소값
	 * @param max - 범위 안에서 최대값
	 * @return min ~ max 안에서의 랜덤값
	 */
	public int random(int min, int max){
		int num = (int)((Math.random() * (max-min+1)) + min);
		return num;
	}
	
	public String getRandomPassword(){
		//리턴할 문자열
		String password="";
		
		//A~Z, a~z, 0~9
		String word = "ABCDEFGHIJKLMNOPQRSTUVWYZabcdefghijklmnopqrstuvwyz1234567890";
		
		//글자 길이
		int word_len = word.length();
		
		for(int i = 0; i<8; i++){
			//랜덤한 위치에서 한글자를 추출한다.
			int random = random(0, word_len-1);
			String c = word.substring(random, random+1);
			
			//추출한 글자를 미리 준비한 변수에 추가한다.
			password += c;
		}
		
		return password;
	}
}
