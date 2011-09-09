<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.directory" default="views" pattern="(views|layouts)" />

	<cfif not structKeyExists(attributes, "module")>
		<cfset attributes.module = coldmvc.event.getModule() />
	</cfif>

	<!--- make sure the template exists --->
	<cfset __hidden__ = coldmvc.factory.get("templateManager").generate(attributes.module, attributes.directory, attributes.template) />

	<!--- remove any tag-specific attributes --->
	<cfset structDelete(attributes, "module") />
	<cfset structDelete(attributes, "directory") />
	<cfset structDelete(attributes, "template") />
	<cfset structDelete(variables, "caller") />
	<cfset structDelete(variables, "thisTag") />

	<!--- add all of the attributes to the partial --->
	<cfset structAppend(variables, attributes, true) />

	<!--- remove the attributes from the variables now that they're appended --->
	<cfset structDelete(variables, "attributes") />

	<cfinclude template="#__hidden__#" />
</cfif>