<cfset car = new Car()>
<cfset result = application.hyrule.validate(car)>

<cfdump var="#result.getErrors()#">
