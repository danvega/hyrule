<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.default" default="&nbsp;" />

	<cfset string = trim(attributes.value) />
	<cfset string = replace(string, chr(10), "<br />", "all") />
	<cfif string eq "">
		<cfset string = attributes.default />
	</cfif>

	<cfset thisTag.generatedContent = string />

</cfif>