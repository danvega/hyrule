<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.content" default="text/html; charset=utf-8" />

	<cfoutput>
	<meta http-equiv="content-type" content="#attributes.content#" />
	</cfoutput>

</cfif>