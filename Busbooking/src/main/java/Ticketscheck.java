

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


public class Ticketscheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int availtick=0,Enttick=0,tickprc=0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession conses=request.getSession();
		try {
			String search = (String) request.getSession().getAttribute("bus_id");
			Enttick=Integer.valueOf(request.getParameter("not"));
			HttpSession s=request.getSession();
			s.setAttribute("enttick", Enttick);
			 Connection con = Mysqlcon.initializeDatabase();
			 Statement stmt=con.createStatement();
			 ResultSet rset=stmt.executeQuery("Select * from busbooking.bus where BusId="+search);
			 while(rset.next())
			 {
				 availtick=rset.getInt(4);
				 tickprc=rset.getInt(5);
				 request.setAttribute("BusName",rset.getString(1));
				 request.setAttribute("FromLoc",rset.getString(2));
				 request.setAttribute("ToLoc",rset.getString(3));
				 request.setAttribute("Aseats",rset.getInt(4));
				 conses.setAttribute("bus_name", rset.getString(1));
				 conses.setAttribute("fromlocation", rset.getString(2));
				 conses.setAttribute("tolocation", rset.getString(3));
				 
			 } 
			 if(Enttick<=availtick)
			 {
				 float totfare=Enttick*tickprc;
				 request.setAttribute("totalfare", totfare);
				 request.setAttribute("not", Enttick);
				 request.setAttribute("tktprice",tickprc);
				 conses.setAttribute("nooftickbook",Enttick);
				 conses.setAttribute("totalfare",totfare);
				 RequestDispatcher req=request.getRequestDispatcher("Bookingpage3.jsp");
				 req.forward(request, response);
			 }else
			 {
				 RequestDispatcher req=request.getRequestDispatcher("Bookingpage2.jsp");
				 req.forward(request, response);
			 }
			
		}
			
		catch(Exception e){
			 e.printStackTrace(); 
		}
	}

}
