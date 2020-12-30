
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import Mycon.Mysqlcon;
//import javax.servlet.annotation.WebServlet;  
// Import Database Connection Class file 

public class Adminpanelcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int agtbid=15000;
		String bn=request.getParameter("bname");
		 String fa=request.getParameter("froma");
		 String ta=request.getParameter("toa");
		 int tots=Integer.valueOf(request.getParameter("tots"));
		 int prc= Integer.valueOf(request.getParameter("prc"));
		 try { 
			  
	            // Initialize the database 
			 Connection con = Mysqlcon.initializeDatabase();
			 Statement stmt=con.createStatement();
			 ResultSet rset=stmt.executeQuery("select * from busbooking.bus");
			 while(rset.next())
			 {
				agtbid =Integer.parseInt(rset.getString(6));
			 }
			 agtbid++;
			 
	            // Create a SQL query to insert data into demo table 
	            // demo table consists of two columns, so two '?' is used 
	            PreparedStatement st = con 
	                   .prepareStatement("insert into bus values(?,?,?,?,?,?)"); 
	            // For the first parameter, 
	            // get the data using request object 
	            // Same for second parameter 
	            st.setString(1,bn ); 
	            st.setString(2,fa);
	            st.setString(3,ta);
	            st.setInt(4, tots);
	            st.setInt(5, prc);
	            st.setString(6, String.valueOf(agtbid));
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
	            out.println("<html><body><b>Successfully Inserted Bus Details"
	                        + "</b></body></html>"); 
	            response.sendRedirect("index.jsp");
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        } 
	    } 
	}
