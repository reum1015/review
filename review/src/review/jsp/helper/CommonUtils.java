package review.jsp.helper;



public class CommonUtils {
	
	private static CommonUtils current = null;

	public static CommonUtils getInstance() {
		if (current == null) {
			current = new CommonUtils();
		}
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private CommonUtils() {
		super();
	}
	
	// ----------- 싱글톤 객체 생성 끝 ----------
	
	
	/**
	 * 영문 날짜, 장르 ---> 한글로 반환
	 * @param msg
	 * @return
	 */
	public String genreOrDayConverter(String msg){
		String result="";
		
		if(msg.equals("Romance")){
			result="로맨스";
		}else if(msg.equals("SF&Fantasy")){
			result="SF&판타지";
		}else if(msg.equals("Heroism")){
			result="무협";
		}else if(msg.equals("Mystery")){
			result="미스테리";
		}else if(msg.equals("Fusion")){
			result="퓨전";
		}else if(msg.equals("MON")){
			result = "월요일";
		}else if(msg.equals("TUE")){
			result = "화요일";
		}else if(msg.equals("WEN")){
			result = "수요일";
		}else if(msg.equals("THU")){
			result = "목요일";
		}else if(msg.equals("FRI")){
			result = "금요일";
		}else if(msg.equals("SAT")){
			result = "토요일";
		}else if(msg.equals("SUN")){
			result = "일요일";
		}
		return result;
	}
	
	/**
	 * 범위를 갖는 랜덤값을 생성하여 리턴하는 메서드
	 * @param min - 범위 안에서의 최소값
	 * @param max - 범위 안에서의 최대값
	 * @return min~max 안에서의 랜덤값
	 */
	public int random(int min, int max) {
		int num = (int) ((Math.random() * (max - min + 1)) + min);
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
