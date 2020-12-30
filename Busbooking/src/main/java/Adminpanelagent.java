

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mycon.Mysqlcon;


public class Adminpanelagent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int agtaid=1713000;
			String an=request.getParameter("aname");
			String mn=request.getParameter("mn");
			 String pswd=request.getParameter("pswd");
			 try { 
				  
		            // Initialize the database 
				 Connection con = Mysqlcon.initializeDatabase();
				 Statement stmt=con.createStatement();
				 ResultSet rset=stmt.executeQuery("select * from busbooking.agent");
				 while(rset.next())
				 {
					agtaid =rset.getInt(4);
				 }
				 agtaid++;
		            // Create a SQL query to insert data into demo table 
		            // demo table consists of two columns, so two '?' is used 
		            PreparedStatement st = con 
		                   .prepareStatement("insert into agent values(?,?,?,?)"); 
		            // For the first parameter, 
		            // get the data using request object 
		            // Same for second parameter 
		            st.setString(1,an ); 
		            st.setString(2, mn);
		            st.setString(3,pswd);
		            st.setInt(4, agtaid);
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
		            out.println("<html><body><b>Successfully Inserted Agent Details"
		                        + "</b></body></html>"); 
		            response.sendRedirect("index.jsp");
		        } 
		        catch (Exception e) { 
		            e.printStackTrace(); 
		        } 
			}
	
}
