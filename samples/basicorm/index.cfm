<html>
<head>
	<title>Basic ORM Example</title>
</head>

<body>

	<cfset hyrule = new hyrule.system.core.hyrule({validator="metadata"})>

	<cfset emp = entityNew("Employee")>
	<cfset emp.setFirstName("Dan")>
	<cfset emp.setLastName("Vega")>
	<cfset emp.setEmail("danvega@thegooglemail.com")>

	<cfset result = hyrule.validate(emp)>

	<cfdump var="#emp#">
	<cfdump var="#result.getErrors()#">
	<cfabort>

	<!--- add a first name, last name and valid email address and the user will be persisted --->
	<cfif NOT result.hasErrors()>
		<cfset entitySave(emp)>
		Employee Saved! Checked the database, it's there.
	</cfif>

	<cfdump var="#result.getErrors()#">

</body>
</html>
