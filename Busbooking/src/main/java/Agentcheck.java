

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Mycon.Mysqlcon;
public class Agentcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String dbpswd="";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uid=request.getParameter("uid");
			HttpSession session=request.getSession();
			session.setAttribute("aid", uid);
			String pswd=request.getParameter("pswd");
			 Connection con = Mysqlcon.initializeDatabase();
			 Statement stmt=con.createStatement();
			 ResultSet rset=stmt.executeQuery("Select * from busbooking.agent where AutoGenerateAgentId="+uid);
			 while(rset.next())
			 {
			 dbpswd=rset.getString(3);
			 }
			 if(pswd.equals(dbpswd))
			 {
				 dbpswd="";
				 PrintWriter out = response.getWriter(); 
		            out.println("<html><body><b>Successfully logged In"
		                        + "</b></body></html>"); 
		            response.sendRedirect("Booking.jsp");
			 }else
			 {
				 response.sendRedirect("AgentLogin.jsp");
			 }
		}
		catch(Exception e){
			 e.printStackTrace(); 
		}
	}

}
