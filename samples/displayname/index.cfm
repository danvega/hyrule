<cfset user = new User()>
<cfset result = application.hyrule.validate(user)>
<cfdump var="#result.getErrors()#">