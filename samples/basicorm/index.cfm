<html>
<head>
	<title>Basic ORM Example</title>
</head>

<body>

	<cfset emp = entityNew("Employee")>
	<cfset emp.setFirstName("Dan")>
	<cfset emp.setLastName("Vega")>
	<cfset emp.setEmail("danvega@thegooglemail.com")>

	<cfset result = application.hyrule.validate(emp)>

	<!--- add a first name, last name and valid email address and the user will be persisted --->
	<cfif NOT result.hasErrors()>
		<cfset entitySave(emp)>
		Employee Saved! Checked the database, it's there.
	</cfif>

	<cfdump var="#result.getErrors()#">

</body>
</html>
