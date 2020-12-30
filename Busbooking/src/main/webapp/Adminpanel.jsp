<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
body {
	background-image:
		url(https://c1.wallpaperflare.com/preview/220/421/135/nature-objects-lazy-bus.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: fixed;
}

div.card {
	margin: 20px;
	margin-bottom: 70px;
	background: rgba(0, 0, 0, 0.4);
	color: white;
}

#logout {
	float: right;
	margin: 0px;
	margin-top: -40px;
}

#head {
	margin: 40px;
}

#btn {
	width: 90%;
	margin-left: 50px;
}
</style>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	
	<form name="bform" action="Adminpanelcheck" method="get"
		onsubmit="return validateform1()">
		<div id="head">
			<h2>ADMIN PANEL</h2>
			<button type="button" id="logout" class="btn btn-danger"
				href="<%=request.getContextPath()%>/Logout?page=Adminpanel">Logout</button>
		</div>
		<div class="card">
			<div class="card-body">
				<h3 class="card-title">Add BUS</h3>
				<div class="form-group">
					<label for="bus-name">Bus Name</label> <input name="bname"
						type="text" class="form-control" id="bus-name"
						aria-describedby="helpId" placeholder="bus name.." required>
					<label for="from">From</label> <input name="froma" type="text"
						class="form-control" id="from" aria-describedby="helpId"
						placeholder="From.."> <label for="to">To</label> <input
						name="toa" type="text" class="form-control" id="to"
						aria-describedby="helpId" placeholder="To.."> <label
						for="ts">Total Seat</label> <input name="tots" type="number"
						class="form-control" id="ts" aria-describedby="helpId"
						placeholder="Totalseat.."> <label for="price">Price</label>
					<input name="prc" type="number" class="form-control" id="price"
						aria-describedby="helpId" placeholder="Price.."> <br>
					<br>
					<button id=btn type="submit" class="btn btn-primary" onsubmit="">Submit</button>
				</div>

			</div>
		</div>
	</form>
	<form name="aform" action="Adminpanelagent" method="GET"
		onsubmit="return validateform2()">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Add Agent</h4>
				<div class="form-group">
					<label for="agent-name">Agent Name</label> <input name="aname"
						type="text" class="form-control" id="agent-name"
						aria-describedby="helpId" placeholder="Agent name.."> <label
						for="mobnum">Mobile no</label> <input name="mn" type="text"
						class="form-control" id="mobno" aria-describedby="helpId"
						placeholder="Mobile no.."> <label for="pswrd">Password</label>
					<input name="pswd" type="password" class="form-control" id="pswrd"
						aria-describedby="helpId" placeholder="Password.."> <br>
					<br>
					<button id=btn type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		function validateform1() {
			var a = document.forms["bform"]["bname"].value;
			var b = document.forms["bform"]["froma"].value;
			var c = document.forms["bform"]["toa"].value;
			var d = document.forms["bform"]["tots"].value;
			var e = document.forms["bform"]["prc"].value;
			if (a == "") {
				alert("Bus name must be filled out");
				return false;
			}
			if (b == "") {
				alert("From loaction must be filled out");
				return false;
			}
			if (c == "") {
				alert("To location must be filled out");
				return false;
			}
			if (d == "") {
				alert("Please Enter Total seats");
				return false;
			}
			if (e == "") {
				alert("Please enter the price of the bus");
				return false;
			}

		}
		function validateform2() {
			var a = document.forms["aform"]["aname"].value;
			var b = document.forms["aform"]["mn"].value;
			var c = document.forms["aform"]["pswd"].value;
			if (a == "") {
				alert("Agent name must be filled out");
				return false;
			}
			if (b == "") {
				alert("Mobile number must be filled out");
				return false;
			}
			if (c == "") {
				alert("Please Enter the password");
				return false;
			}
		}
	</script>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</body>
</html>