

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String logout=request.getParameter("page");
		if(logout.equals("Adminpanel"))
		{
			response.sendRedirect("index.jsp");
		}else if(logout.equals("Booking"))
		{
			response.sendRedirect("AgentLogin.jsp");
		}else if(logout.equals("Bookingpage2"))
		{
			response.sendRedirect("AgentLogin.jsp");
		}else
		{
			response.sendRedirect("AgentLogin.jsp");
		}

	}

	

}
