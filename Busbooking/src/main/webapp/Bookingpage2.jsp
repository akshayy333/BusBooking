<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<%@page import="Mycon.Mysqlcon,java.sql.*"%>
<title>Booking Panel</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<style>
body {
	background-repeat: no-repeat;
	background-size: cover;
	background-image: url(https://c4.wallpaperflare.com/wallpaper/137/42/530/monsters-bus-chernobyl-pripyat-art-hd-wallpaper-preview.jpg); 
}

div.scroll {
	margin: 30px;
	margin-top: 15px;
	padding: 8px;
	background: rgba(0, 0, 0, 0.4);
	width: 96%;
	height: 50%;
	border: solid 2px black;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
	border-radius: 10px;
	font-size: normal;
	color:white;
}

.h2 {
	text-align: center;
	margin: 10px;
	font-size: 30px;
	font-family: "Times New Roman", Times, serif;
	color:white;
}

#busid {
	margin: 10px;
	margin-bottom: 30px;
	width: 80%;
}
#not{
margin: 10px;
	margin-bottom: 70px;
	width: 80%;
}
div.card {
	margin: 15px 30px;
	padding: 8px;
	width: auto;
	height: 50%;
	text-align: justify;
	border-radius: 10px;
	font-size: normal;
	border: solid 2px black;
	background: rgba(0, 0, 0, 0.4);
	color:white;
}

label {
	font-weight: bold;
	margin-left: 5px;
	margin-top: 5px;
	font-size: 20px;
}

#bidbtn {
	float: right;
	margin: 50px;
	margin-right: 120px;
}

#notbtn {
	float: right;
	margin-top: 50px;
	margin-right: 120px;
}

#lgbtn {
	float: right;
	margin: 10px;
	margin-right: 40px;
}
table{
padding-left:30px;
}
td{
font-weight:500;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
</head>
<body>

	<div>
		<label class="h2" style="margin-left: 41.5%;">BUS DETAILS</label><a
			href="<%=request.getContextPath()%>/Logout?page=Bookingpage2" id="lgbtn" class="btn btn-danger" type="button"
			>Logout</a>
	</div>
	<div class="scroll">
		<table class="table table-striped table-inverse table-responsive" style="color:white">
			<thead class="thead-inverse">
				<tr>
					<th>Bus Name</th>
					<th>From</th>
					<th>To</th>
					
					<th>Price</th>
					<th>Bus Id</th>
				</tr>
			</thead>
			<%
			try {
				Connection con = Mysqlcon.initializeDatabase();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from busbooking.bus");
				while (rs.next()) {
			%>
			<tbody>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					
					<td>Rs.<%=rs.getInt(5)%></td>
					<td><%=rs.getInt(6)%></td>
				</tr>
			</tbody>

			<%
			}
			%>
		</table>
		<%
		rs.close();
		stmt.close();
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>
	<h2 class="h2">BOOK TICKETS</h2>
	<div class="card">
		<div class="form-group">
			<form name="bg2form" action="Bookingcheck" onsubmit="return validateform()" method="get">
				<label for="busid">Enter Bus Id</label> <input name="bidbtn"
					id="bidbtn" class="btn btn-primary" type="submit" value="Search..">
				<input type="number" class="form-control" name="bid" id="busid"
					placeholder="Enter the Bus Id" />
			</form>
			<table class="table table-striped table-inverse table-responsive" style="color:white">
				<tbody>
					<tr>
						<td>BusName --> <%=request.getAttribute("BusName")%></td>
						<td>From --> <%=request.getAttribute("FromLoc")%></td>
						<td>To --> <%=request.getAttribute("ToLoc")%></td>
						<td>Available Tickets --> <%=request.getAttribute("Aseats")%></td>
					</tr>
				</tbody>
			</table>
			<form name="tickform" action="Ticketscheck" onsubmit="return validateform1()" method="get">
			<label for="not">No Of Tickets</label> <input name="notbtn"
				id="notbtn" class="btn btn-primary" type="submit" value="Submit">
			<input type="number" class="form-control" name="not" id="not"
				placeholder="Enter the No of Tickets to Book" />
				</form>
		</div>
	</div>
	<h2 class="h2">SHOW MY BOOKINGS</h2>
	<div class="scroll">
	<table class="table table-striped table-inverse table-responsive" style="color:white;">
			<thead class="thead-inverse">
				<tr>
					<th>Bus Name</th>
					<th>From</th>
					<th>To</th>
					<th>No of Tickets Booked</th>
					<th>Total Fare</th>
				</tr>
			</thead>
			<%String agentid=(String)request.getSession().getAttribute("aid");%>
			<%
			try {
				Connection con1 = Mysqlcon.initializeDatabase();
				Statement stmt1 = con1.createStatement();
				ResultSet rset = stmt1.executeQuery("select * from busbooking.bookings where AgentId="+agentid);
				while (rset.next()) {
			%>
			<tbody>
				<tr>
					<td><%=rset.getString(2)%></td>
					<td><%=rset.getString(3)%></td>
					<td><%=rset.getString(4)%></td>
					<td><%=rset.getString(5)%></td>
					<td>Rs.<%=rset.getString(6)%></td>
				</tr>
			</tbody>

			<%
			}
			%>
		</table>
		<%
		rset.close();
		stmt1.close();
		con1.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%></div>
	<script>
		function validateform() {
			var k = document.forms["bg2form"]["bid"].value;
			if (k == "") {
				alert("Enter the Bus Id to Search");
				return false;
			}

		}
		function validateform1() {
			var k = document.forms["tickform"]["not"].value;
			if (k == "") {
				alert("Enter the No of Tickets to Book");
				return false;
			}
		}
	</script>
</body>
</html>
