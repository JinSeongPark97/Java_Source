package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletEx6Cookie
 */
@WebServlet("/ServletEx6Cookie")
public class ServletEx6Cookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><meta charset=\"UTF-8\"></head><body>");
		
		
		// 쿠키가 있는 경우 로그인한 상태를 알리고 없다면 로그인 화면을 출현
		String id = null; 
		String pwd = null;
		try {
			Cookie[] cookies = request.getCookies(); // 모든 서버가 만든 클라이언트의 모든 쿠키 읽기 
			for(int i = 0; i < cookies.length; i++) {
				// 쿠키는 KeyName:Value 형태로 구성되어 있음.
				String name = cookies[i].getName();
				System.out.println("name : " + name);
				
				if(name.equalsIgnoreCase("id")) {
					// 쿠키값 디코딩(암호 해제)
					id = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
				
				if(name.equalsIgnoreCase("pwd")) {
					// 쿠키값 디코딩(암호 해제)
					pwd = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(id != null && pwd != null) {	// id, pwd가  있는 경우
			out.println(id + "님 쿠키를 통해 로그인 한 상태입니다.");
			out.println("</body></html>");
			out.close();
			return;
		}
		
		// id, pwd가 없는 경우 -> 로그인 화면으로 이동
		out.println("<h2>로그인</h2>");
		out.println("<form method='post'>"); // 로그인 방식이 post로 넘어가 doPost() 메소드가 실행.
		out.println("id : <input type='text' name='id'><br>");
		out.println("pwd : <input type='text' name='pwd'><br>");
		out.println("<input type='submit' value='로그인'>");
		out.println("</form>");
		out.println("</body></html>");
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8"); // 오리지널 방법
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		// System.out.println(id + " " + pwd);
			
		// id는 aaa pwd 111인 경우에 대해
		if(id.equals("aaa")&& pwd.equals("111")) {
			// 이곳에서 쿠키를 생성
			try {
				id = URLEncoder.encode(id, "utf-8"); // 암호화
				Cookie idCookie = new Cookie("id", id);
				idCookie.setMaxAge(60 * 60 * 24 * 365); // 쿠키 유효기간 : 60초, 60분, 24시간, 365일
				
				pwd = URLEncoder.encode(pwd, "utf-8"); // 암호화
				Cookie pwdCookie = new Cookie("pwd", id);
				pwdCookie.setMaxAge(60 * 60 * 24 * 365);
				
				response.addCookie(idCookie); // 내보내기
				response.addCookie(pwdCookie); // 클라이언트 컴에 쿠키를 저장
				
			} catch (Exception e) {
				
			}
			out.println("로그인 성공");
		}else {
			out.println("로그인 실패");
		}
		
		out.println("</body></html>");
		out.close();
	}

}
