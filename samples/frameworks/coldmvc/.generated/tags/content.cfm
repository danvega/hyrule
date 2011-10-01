<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">
	
	<!--- backwards compatibility --->
	<cfif structKeyExists(attributes, "name")>
		<cfset attributes.key = attributes.name />
	</cfif>

	<cfif not structKeyExists(attributes, "value")>
		<cfset attributes.value = thisTag.generatedContent />
	</cfif>

	<cfset thisTag.generatedContent = "" />

	<cfset coldmvc.page.setContent(attributes.key, attributes.value) />

</cfif>
