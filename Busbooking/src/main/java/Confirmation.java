

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mycon.Mysqlcon;


public class Confirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       int totseats=0,finalseats=0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String agentid =(String)request.getSession().getAttribute("aid");
		String a=(String) request.getSession().getAttribute("bus_name");
		String b=(String) request.getSession().getAttribute("fromlocation");
		String c=(String) request.getSession().getAttribute("tolocation");
		int d=(Integer) request.getSession().getAttribute("nooftickbook");
		float e=(Float)request.getSession().getAttribute("totalfare");
		String search = (String) request.getSession().getAttribute("bus_id");
		 Connection con = Mysqlcon.initializeDatabase();
		 java.sql.Statement stmt=con.createStatement();
		 ResultSet rset=stmt.executeQuery("select * from busbooking.bus where BusId="+search);
		 while(rset.next())
		 {
			 totseats=rset.getInt(4);
		 }
		 finalseats=totseats-((Integer)request.getSession().getAttribute("enttick"));
		 PreparedStatement st1=con.prepareStatement("UPDATE bus SET TotalSeats =? where BusId="+search);
		 st1.setInt(1, finalseats);
		 st1.executeUpdate();
		 st1.close();
		 PreparedStatement st = con 
                 .prepareStatement("insert into bookings values(?,?,?,?,?,?)"); 
          // For the first parameter, 
          // get the data using request object 
          // Same for second parameter 
          st.setString(1,agentid ); 
          st.setString(2,a);
          st.setString(3,b);
          st.setString(4, c);
          st.setInt(5, d);
          st.setFloat(6, e);
         // st.setString(6, request.getParameter("atogenbid"));
          // Execute the insert command using executeUpdate() 
          // to make changes in database 
          st.executeUpdate(); 

          // Close all the connections 
          st.close(); 
          con.close(); 
          
          // Get a writer pointer  
          // to display the successful result 
          PrintWriter out = response.getWriter(); 
          out.println("<html><body><b>Bus Booked Successfully"
                      + "</b></body></html>"); 
          
      } 
      catch (Exception e) { 
          e.printStackTrace(); 
      } 
	}

}
