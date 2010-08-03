<html>
<head>
	<title>Basic ORM Example</title>
</head>

<body>

	<cfset user = entityNew("User")>
	<cfset user.setFirstName("Dan")>
	<cfset user.setLastName("Vega")>
	<cfset user.setEmail("danvega@gmasil.com")>

	<cfset hyrule = new hyrule.Validator()>
	<cfset result = hyrule.validate(user)>

	<!--- add a first name, last name and valid email address and the user will be persisted --->
	<cfif NOT result.hasErrors()>
		<cfset entitySave(user)>
		User Saved! Checked the database, it's there.
	</cfif>

	<cfdump var="#result.getErrors()#">

</body>
</html>
