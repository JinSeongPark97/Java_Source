package pack.order;

import java.util.Hashtable;

public class CartMgr {
	private Hashtable<String, OrderBean>  hCart = new Hashtable<String, OrderBean>(); // key,value 형식
	
	// 장바구니 담기
	public void addCart(OrderBean obean) {
		
	}
	
	// 장바구니 목록
	public Hashtable<String, OrderBean> getCartList() {
		return hCart;
		
	}
	
	// 장바구니 수정
	public void updateCart(OrderBean obean) {
		
	}
	
	// 장바구니 삭제
	public void deleteCart(OrderBean obean) {
		
	}

}
