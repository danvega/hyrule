<html>
<head>
	<title>Advanced example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setPassword("myreallylongpassword")>
	<cfset user.setConfirmPassword("abc")>
	
	<cfset result = application.hyrule.validate(user,"password,confirmPassword")>

	<cfdump var="#result.getErrors()#">

</body>
</html>
