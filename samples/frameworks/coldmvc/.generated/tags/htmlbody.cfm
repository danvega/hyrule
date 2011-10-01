<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">
	<cfset coldmvc.page.addHTMLBody(thisTag.generatedContent) />
	<cfset thisTag.generatedContent = "" />
</cfif>