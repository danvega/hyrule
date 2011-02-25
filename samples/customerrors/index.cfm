<html>
<head>
	<title>Basic example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("")>
	<cfset user.setLastName("")>

	<!--- do not include resources/ --->
	<!--- can be CustomErrorMessages.properties || CustomErrorMessages --->
	<cfset hyrule = new hyrule.Validator("CustomErrorMessages.properties")>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
