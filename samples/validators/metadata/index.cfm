<cfset config = {validator="metadata"}>
<cfset hyrule = new hyrule.system.core.hyrule(config)>

<cfset person = new Person()>
<cfset person.setFirstName("")>
<cfset person.setLastName("")>
<cfset person.setAge("abc")>

<cfset result = hyrule.validate(person)>

<!--- look at the error messages, they should be different when you switch languages --->
<cfdump var="#result.getErrors()#">

