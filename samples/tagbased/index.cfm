<html>
<head>
	<title>Tag based example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("")>
	<cfset user.setLastName("")>

	<cfset result = application.hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
