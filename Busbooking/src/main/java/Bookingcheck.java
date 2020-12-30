

import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Mycon.Mysqlcon;


public class Bookingcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
//      
   String bnc=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String search=request.getParameter("bid");
			HttpSession session = request.getSession();
			session.setAttribute("bus_id", search);
			 Connection con = Mysqlcon.initializeDatabase();
			 Statement stmt=con.createStatement();
			 ResultSet rset=stmt.executeQuery("Select * from busbooking.bus where BusId="+search);
			 while(rset.next())
			 {
				 bnc=rset.getString(1);
				 request.setAttribute("BusName",rset.getString(1));
				 request.setAttribute("FromLoc",rset.getString(2));
				 request.setAttribute("ToLoc",rset.getString(3));
				 request.setAttribute("Aseats",rset.getInt(4));
			 }
			 if(bnc==null)
			 {
				 RequestDispatcher req=request.getRequestDispatcher("Booking.jsp");
				 req.forward(request, response);
				 
			 }else
			 {
				 RequestDispatcher req=request.getRequestDispatcher("Bookingpage2.jsp");
				 req.forward(request, response);
				 bnc=null;
			 }
			
		}
			
		catch(Exception e){
			 e.printStackTrace(); 
		}
	}
		
	}

