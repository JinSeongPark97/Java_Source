package kr.mvc.model;

import java.util.ArrayList;

import kr.mvc.controller.UserForm;

// Controller 클래스의 요청을 DB 연동 처리 담당
// 여러 개의 DAO 클래스 관리가 목적
public class UserManager {
	// 싱글톤
	private static UserManager manager = new UserManager();
	
	public static UserManager instance() {	// instance(메소드)
		return manager;
	}
	
	private UserDaoModel getUserDaoModel() {
		return new UserDaoModel();
	}
	
	// 로그인 성공/실패 판별
	public boolean login(String user_id, String user_password) {
		UserDto dto = getUserDaoModel().findUser(user_id);
		if(dto == null) return false;
		
		if(dto.getPassword().equals(user_password)) {
			return true;
		}else {
			return false;
		}
	}
	
	// 전체 자료 반환
	public ArrayList<UserDto> getUserAll() {
		return getUserDaoModel().getUserDataAll();
	}
	// 데이터 추가
	public int insert(UserForm userForm) {		
		return getUserDaoModel().insertData(userForm); // UserDaoModel 클래스의 insert 메소드와 연결
	}
	
	// 하나의 데이터 받기
	public UserDto findUser(String userid) {
		return getUserDaoModel().findUser(userid); // UserDaoModel 클래스의 findUser 메소드와 연결
	}
}
