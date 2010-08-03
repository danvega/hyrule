<html>
<head>
	<title>Basic example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setArrivalDate("08/21/2008")>

	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
