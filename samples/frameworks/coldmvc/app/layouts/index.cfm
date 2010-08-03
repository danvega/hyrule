<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>User Manager</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		#renderCSS("style.css")#
	</head>
	<body>
		<h1>User Manager</h1>
		<hr>
		<div id="content">
			#render()#
		</div>
	</body>
</html>
</cfoutput>