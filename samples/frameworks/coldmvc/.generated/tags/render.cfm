<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfif not structKeyExists(attributes, "name")>
		<cfset attributes.name = "body" />
	</cfif>

	<cfset content = coldmvc.page.getContent(attributes.name) />

	<cfif structKeyExists(attributes, "result")>
		<cfset caller[attributes.result] = content />
	<cfelse>
		<cfset thisTag.generatedContent = content />
	</cfif>

</cfif>