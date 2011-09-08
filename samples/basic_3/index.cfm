<!--- shows off range --->

<cfset car = new Car()>
<cfset car.setMake("Infinity")> 
<cfset car.setModel("G3")>
<cfset car.setYear(2011)>
<cfset car.setColor("")>

<cfset result = application.hyrule.validate(car)>

<cfdump var="#result.getErrors()#">
