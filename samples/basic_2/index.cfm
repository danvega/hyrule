<!--- show how 3 rules for 1 property works --->
<!--- default min max but min and max are shown, thats ok we have range rule now --->

<cfset car = new Car()>
<cfset car.setMake("Infinity")> 
<cfset car.setModel("G3")>
<cfset car.setYear(2011)>
<cfset car.setColor("")>

<cfset result = application.hyrule.validate(car)>

<cfdump var="#result.getErrors()#">
