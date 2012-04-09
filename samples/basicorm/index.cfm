<cfset hyrule = new hyrule.system.core.hyrule()>

<cfset emp = entityNew("Employee")>
<cfset emp.setFirstName("Dan")>
<cfset emp.setLastName("Vega")>
<cfset emp.setEmail("danvega@thegooglemail.com")>

<cfset result = hyrule.validate(emp)>

<cfdump var="#result.getErrors()#">
<cfabort>

<!--- if there are errors display them, else save the record --->
<cfif result.hasErrors()>
	<cfdump var="#result.getErrors()#">
<cfelse>
	<cfset entitySave(emp)>
	Employee Saved! Checked the database, it's there.
</cfif>

<!-- if you run this example a second time the unique constraint for email will fail --->
