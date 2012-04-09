<cfset user = new User()>
<cfset user.setFirstName("")>
<cfset user.setLastName("")>
<cfset user.setEmail("danv")>

<cfset result = application.hyrule.validate(user)>

<cfdump var="#result.getErrors()#">