package pack.board;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BoardDto {

	private String name,pass,mail,title,cont,bip,bdate;
	private int num,readcnt,gnum,onum,nested;
	
}
