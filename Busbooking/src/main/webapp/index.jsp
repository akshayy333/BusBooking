<!doctype html>
<html lang="en">
<head>
<title>Menu Pages</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="<%=request.getContextPath()%>/images/style/general.css" rel="stylesheet" type="text/css" />
    

<style>
body {
	background-image:url(https://c4.wallpaperflare.com/wallpaper/998/555/686/shadow-buses-clouds-everlasting-summer-wallpaper-preview.jpg);
	 background-repeat: no-repeat;

  background-size: cover;
}
#admin {
	margin: 50px;
}

#agent {
	margin: 10px;
}

#exit {
	float: right;
	margin: 50px;
}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body >
 	<a id="admin" class="btn btn-primary" href="AdminLogin.jsp"
		role="button">Admin Login</a>
	<a id="agent" class="btn btn-primary" href="AgentLogin.jsp"
		role="button">Agent Login</a>
	<a id="exit" class="btn btn-danger" href="#" onclick="window.close();" role="button">Exit</a>

</body>
</html>