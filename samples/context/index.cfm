<cfset user = new User()>
<cfset user.setPassword("mylongpass")>
<cfset user.setConfirmPassword("abc")>

<cfset result = application.hyrule.validate(user,"password,confirmPassword")>

<cfdump var="#result.getErrors()#">
