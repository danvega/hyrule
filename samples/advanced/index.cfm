<html>
<head>
	<title>Advanced example</title>
</head>

<body>

	<cfset user = new User()>
	<cfset user.setFirstName("")>
	<cfset user.setLastName("a")>
	<cfset user.setUsername("myusername")>
	<cfset user.setPassword("myreallylongpassword")>
	<cfset user.setDOB("10/30/2011")>
	<cfset user.setEmail("thisIsNotAValidEmailAddress")>

	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<cfdump var="#result.getErrors()#">

</body>
</html>
