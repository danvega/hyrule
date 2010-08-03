<cfset customer = new Customer()>
<cfset customer.setAge(17)>

<cfset hyrule = new hyrule.Validator()>
<cfset result = hyrule.validate(customer)>

<cfdump var="#result.getErrors()#">