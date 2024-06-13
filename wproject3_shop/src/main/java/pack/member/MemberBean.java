package pack.member;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MemberBean {
	private String id,passwd,name,email,phone,zipcode,address,job;
	
}
