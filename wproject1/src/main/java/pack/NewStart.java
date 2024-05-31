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

@WebServlet("/NewStart")
public class NewStart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
			int no = Integer.parseInt(request.getParameter("no"));
			String name = request.getParameter("name");
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			
			HttpSession session = request.getSession(true);
			ArrayList<Student> glist = (ArrayList<Student>) session.getAttribute("list");
			
			// glist가 null일 경우 새로운 ArrayList로 초기화
			 if(glist == null) glist = new ArrayList<Student>();
			glist.add(new Student(no, name, kor, eng)); 
			
			session.setAttribute("list", glist);
	
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h3>성적표</h3>");
			
			out.println("<p><table width='80%'>");
			out.println("<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>총점</th></tr>");
			
			int Su = 0;
			int totalSum = 0;
			for(int i = 0; i < glist.size(); i++) {
				Student student = (Student)glist.get(i);
				int total = student.getTotal();
				out.println("<tr><td>" + student.getNo() + "</td>");
				out.println("<td>" + student.getName() + "</td>");
				out.println("<td>" + student.getKor() + "</td>");
				out.println("<td>" + student.getEng() + "</td>");
				out.println("<td>" + student.getTotal() + "</td></tr>");
				
				totalSum += total;
				Su++;
			}
			
			out.println("<tr><td colspan='5'>인원수 : " + Su + "명</td></tr>");
	
			//session.removeAttribute("list");
	
			out.println("</table>");
			out.println("<br><a href='ServletExam.html'>새로입력</a>");
			out.println("<a href='Delete'>세션삭제</a>");
			out.println("</body></html>");
			out.close();
		
	}
}
