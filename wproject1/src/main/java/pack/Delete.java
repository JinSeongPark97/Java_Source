package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // 세션이 있으면 읽고 없으면 생성x
		if(session == null) return;
		
		ArrayList<Student> slist = (ArrayList<Student>)session.getAttribute("list");
		if(slist == null) return;
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<p><table>");
		out.println("<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>총점</th></tr>");
		out.println("</table>");
		
		session.removeAttribute("list");
		
		out.println("<br>");
		out.println("<br>[<a href='ServletExam.html'>성적 입력 창으로 돌아가기</a>]");
		out.println("</body></html>");
		out.close(); 
	}
	
	
			
}