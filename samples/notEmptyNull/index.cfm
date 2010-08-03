<html>
<head>
	<title>Basic example</title>
</head>

<body>

	<cfset user = new User()>
	
	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
