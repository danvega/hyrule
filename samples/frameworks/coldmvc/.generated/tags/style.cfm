<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfoutput>
<cfif thisTag.executionMode eq "end">
	<cfif structKeyExists(attributes, "name")>
		#coldmvc.asset.renderCSS(argumentCollection=attributes)#
	<cfelse>
		<style type="text/css">
			#thisTag.generatedContent#
		</style>
		<cfset thisTag.generatedContent = "" />
	</cfif>
</cfif>
</cfoutput>