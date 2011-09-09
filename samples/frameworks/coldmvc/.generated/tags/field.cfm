<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">
	<cfset thisTag.generatedContent = coldmvc.form.field(field=thisTag.generatedContent, argumentCollection=attributes) />
</cfif>