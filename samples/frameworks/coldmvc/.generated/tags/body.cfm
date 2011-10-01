<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfset module = coldmvc.event.getModule() />
	<cfset controller = coldmvc.event.getController() />
	<cfset action = coldmvc.event.getAction() />

	<cfset classes = [
		"#module#",
		"#module#-#controller#",
		"#module#-#controller#-#action#"
	] />

	<cfif structKeyExists(attributes, "class")>
		<cfset arrayAppend(classes, attributes.class) />
	</cfif>

	<cfset classes = arrayToList(classes, " ") />

<cfoutput>
<cfsavecontent variable="thisTag.generatedContent">
<body class="#classes#">
	#thisTag.generatedContent#
	#coldmvc.page.renderHTMLBody()#
</body>
</cfsavecontent>
</cfoutput>

</cfif>