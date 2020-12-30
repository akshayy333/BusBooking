<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: italic;
	background-image: url(https://c4.wallpaperflare.com/wallpaper/781/382/359/setra-coach-buses-selective-coloring-wallpaper-preview.jpg);
	background-size: cover;
	background-repeat: no repeat;
}

.login-box {
	width: 320px;
	height: 400px;
	background: rgba(0, 0, 0, 0.4);
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: whitesmoke;
	box-sizing: border-box;
	padding: 70px 30px;
	background-position: center;
}

.avatar {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px);
	padding: 0;
}

.header {
	text-align: center;
	font-size: 20px;
	padding: 0;
	margin-top: 10px;
	font-size: bold;
}

.login-box p {
	margin: 0;
	padding: 0;
	font-weight: bold;
	font-size: 18px;
}

.login-box input {
	width: 100%;
	margin: 10px;
	text-decoration-color: whitesmoke;
}

.login-box input[type="password"], [type="text"] {
	color: white;
	background: transparent;
	border: none;
	border-bottom: 1px solid #fff;
	outline: none;
	height: 40px;
	font-size: 16px;
}

.btn {
	border: none;
	outline: none;
	height: 40px;
	background-color: aquamarine;
	font-size: 18px;
	border-radius: 20px;
}

.btn:hover {
	cursor: pointer;
	background: #39dc79;
	color: black;
}

.login-box a {
	margin-top: 10px;
	text-decoration: none;
	font-size: 14px;
	color: white;
}

.login-box a:hover {
	color: #39dc79;
}
</style>
<script>
	function validateform() {
		var k = document.forms["sform"]["uid"].value;
		var p = document.forms["sform"]["pswd"].value;
		if (k == "") {
			alert("User name must be filled out");
			return false;
		}
		if (p == "") {
			alert("Please Enter your Password");
			return false;
		}
	}
</script>
</head>
<body>
	<form name="sform" action="AdminCheck" method="post"
		onsubmit="return validateform()">
		<div class="header">
			<h1 style="color:black">
				ADMIN<br />LOGIN
			</h1>
		</div>
		<div class="login-box">
			<img class="avatar" src='https://upload.wikimedia.org/wikipedia/commons/f/f4/User_Avatar_2.png'/>
			<p>Username</p>
			<input type="text" placeholder="username" name="uid" value="" />
			<p>Password</p>
			<input type="password" placeholder="password" name="pswd" value="" />
			<p>
				<input class="btn" type="submit" value="Login" />
			</p>
			<!-- <p>
    <a href="">Forget Password</a></p> -->
		</div>
	</form>
</body>
</html>
