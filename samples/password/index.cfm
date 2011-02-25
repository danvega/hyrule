<html>
<head>
	<title>Basic example</title>
</head>

<body>

	<cfset user = new User()>
	<!--- the only requirement of low level password is that it can not be password --->
	<cfset user.setLowPassword("password")>
	<!--- medium must contain letters + numbers --->
	<cfset user.setMediumPassword("mypassword")>
	<!--- high must contain letters + numbers + special charcters --->
	<cfset user.setHighPassword("myS3cr3tpassword")>

	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
