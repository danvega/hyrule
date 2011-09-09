<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfset debugManager = coldmvc.factory.get("debugManager") />
	<cfset appVersion = debugManager.getAppVersion() />

	<cfif appVersion neq "">
		<cfset thisTag.generatedContent = "<!-- ColdMVC Version: #debugManager.getFrameworkVersion()# - App Version: #appVersion# -->" />
	<cfelse>
		<cfset thisTag.generatedContent = "<!-- ColdMVC Version: #debugManager.getFrameworkVersion()# -->" />
	</cfif>

</cfif>