<cfcomponent output="false" accessors="true">

	<cfproperty name="firstname" required="true">
	<cfproperty name="lastname" required="true">
	<cfproperty name="email" required="true" isvalid="email">

</cfcomponent>