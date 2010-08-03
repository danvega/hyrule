<html>
<head>
	<title>Basic example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("")>
	<cfset user.setLastName("")>
	
	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
