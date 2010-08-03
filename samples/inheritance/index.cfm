<!---
<!--- creat the user object and set some properties --->
<cfset employee = new Employee()>
<cfset employee.setId(0)>
<cfset employee.setFirstName("")>
<cfset employee.setLastName("")>
--->

<cfset sEmployee = new SalaryEmployee()>
<cfset sEmployee.setId(0)>
<cfset sEmployee.setFirstName("")>
<cfset sEmployee.setLastName("")>
<cfset sEmployee.setSalary(0)>


<!--- create an instance of the hyrule framework --->
<cfset hyrule = new hyrule.Validator()>
<!--- validate the object by passing it to the validate method --->
<cfset result = hyrule.validate(sEmployee)>

<cfdump var="#result.getErrors()#">