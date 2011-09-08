<cfset car = new Car()>
<cfset car.setMake("")> 
<cfset car.setModel("")>
<cfset car.setYear(0)>
<cfset car.setColor("")>

<cfset result = application.hyrule.validate(car)>

<cfdump var="#result.getErrors()#">
