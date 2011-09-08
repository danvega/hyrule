<cfset sEmployee = new SalaryEmployee()>
<cfset sEmployee.setId(0)>
<cfset sEmployee.setFirstName("")>
<cfset sEmployee.setLastName("")>
<cfset sEmployee.setSalary(0)>

<!--- validate the object by passing it to the validate method --->
<cfset result = application.hyrule.validate(sEmployee)>

<cfdump var="#result.getErrors()#">