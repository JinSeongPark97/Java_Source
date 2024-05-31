package pack;

public class Student {
	private int no;
	private String name;
	private int kor;
	private int eng;	
	
	public Student(int no, String name, int kor, int eng) {
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		
	}
	
	public int getNo() {
		return no;
	}
	
	public String getName() {
		return name;
	}
	
	public int getKor() {
		return kor;
	}
	
	public int getEng() {
		return eng;
	}
	
	// 총점 구하는 메서드
	
	public int getTotal() {
		return kor + eng;
	}
	
}

