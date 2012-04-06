<html>
<head>
	<title>Advanced example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("Dan")>
	
	<cfset result = application.hyrule.validate(user,"firstName")>

	<cfdump var="#result.getErrors()#">

</body>
</html>
