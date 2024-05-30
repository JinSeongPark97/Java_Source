package pack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pack.other.ServletEx2Other;

@WebServlet("/ServletEx2")
public class ServletEx2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletEx2Other other;

	public void init(ServletConfig config) throws ServletException {  
		// 서버는 init() 메소드를 호출해서 Servlet 초기화를 담당함.
		other = new ServletEx2Other("손흥민");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // Mime type과 문자 코드를 적어준다. 
		PrintWriter out = response.getWriter(); // response가 PrintWriter 객체를 만들어줌, 클라이언트로 전송
		out.println("<html><body>");
		out.println("<h1>서블릿 문서</h1>");
		
		// 지역변수 출력
		int a = 10, b = 20;
		out.println("a:" + a + ", b:" + b);
		
		// 현재 클래스의 메소드 호출
		int tot = calcData(a,b);
		out.println("<br>두 수의 합은 " + tot);
		out.println("<hr>");
		
		// 클래스 호출
		//ServletEx2Other other = new ServletEx2Other("홍길동");
		String ir = other.getIrum(); 
		out.println("이름은 " + ir);
		
		out.println("</body></html>");
		out.close();
	}
	
	private int calcData(int a, int b) {
		int imsi = a + b;
		return imsi;
	}

}
