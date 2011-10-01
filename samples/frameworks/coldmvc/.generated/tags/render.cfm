<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">
	
	<!--- backwards compatibility --->
	<cfif structKeyExists(attributes, "name")>
		<cfset attributes.key = attributes.name />
	</cfif>
	
	<cfif not structKeyExists(attributes, "key")>
		<cfset attributes.key = "body" />
	</cfif>

	<cfset content = coldmvc.page.getContent(attributes.key) />

	<cfif structKeyExists(attributes, "result")>
		<cfset caller[attributes.result] = content />
	<cfelse>
		<cfset thisTag.generatedContent = content />
	</cfif>

</cfif>