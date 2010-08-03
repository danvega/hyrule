<html>
<head>
	<title>Match Example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("Dan")>
	<cfset user.setLastName("Vega")>
	<cfset user.setPassword("password")>
	<cfset user.setPasswordConfirm("mypassword")>
	
	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
