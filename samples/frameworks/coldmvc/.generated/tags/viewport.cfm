<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.viewport" default="width=device-width, initial-scale=1.0" />

	<cfoutput>
	<meta name="viewport" content="#attributes.viewport#" />
	</cfoutput>

</cfif>