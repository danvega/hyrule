<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfif not structKeyExists(attributes, "url")>
		<cfset attributes.url = coldmvc.asset.linkToImage("favicon.ico") />
	</cfif>

	<cfoutput>
	<link rel="shortcut icon" type="image/x-icon" href="#attributes.url#" />
	</cfoutput>

</cfif>