package pack.board;

import java.time.LocalDate;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BoardFormBean {
	private String name,pass,mail,title,cont,bip,bdate;
	private int num,readcnt,gnum,onum,nested;
	
	public void setBdate() { // OverLoading
		LocalDate now = LocalDate.now(); // 등록 날짜
		int year = now.getYear();
		int month = now.getMonthValue();
		int day = now.getDayOfMonth();
		
		this.bdate = year + "-" + month + "-" + day;
		
	}
	
}
