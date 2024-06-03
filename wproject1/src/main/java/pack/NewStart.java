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
			ArrayList<Student> slist = (ArrayList<Student>) session.getAttribute("list"); // 세션이름을 리스트로 지명
			
			
			 if(slist == null) slist = new ArrayList<Student>();
			 
			 // 번호 중복 체크
		      for(Student students : slist) {
		         if (students.getNo() == no) {
		                response.sendRedirect("ServletExam.html"); // 점수 입력창으로 돌아가기      
		                //return; 
		           }
		      }
			 
			slist.add(new Student(no, name, kor, eng));
			session.setAttribute("list", slist);
	
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h3>성적표</h3>");
			
			out.println("<p><table width='80%'>");
			out.println("<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>총점</th></tr>");
			
			int Su = 0;
			int totalSum = 0;
			for(int i = 0; i < slist.size(); i++) {
				Student student = (Student)slist.get(i);
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
