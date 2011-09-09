<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfif structKeyExists(attributes, "value")>

		<cfif structKeyExists(attributes, "type")>
			<cfset coldmvc.page.addTitle(attributes.value, attributes.type) />
		<cfelse>
			<cfset coldmvc.page.addTitle(attributes.value) />
		</cfif>

	<cfelse>

		<cfset title = coldmvc.page.generateTitle() />

		<cfif structKeyExists(attributes, "result")>
			<cfset caller[attributes.result] = title />
		<cfelse>
			<cfset thisTag.generatedContent = "<title>#htmlEditFormat(title)#</title>" />
		</cfif>

	</cfif>

</cfif>