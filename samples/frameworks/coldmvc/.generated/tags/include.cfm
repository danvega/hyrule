<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.directory" default="views" pattern="(views|layouts)" />

	<cfif not structKeyExists(attributes, "module")>
		<cfset attributes.module = coldmvc.event.getModule() />
	</cfif>

	<!--- make sure the template exists --->
	<cfset attributes.template = coldmvc.factory.get("templateManager").generate(attributes.module, attributes.directory, attributes.template) />

	<!--- transfer the caller to the attributes to preserve it --->
	<cfset attributes.caller = caller />

	<!--- create a less accessible variable --->
	<cfset __hidden__ = attributes />

	<!--- remove any tag-specific variables --->
	<cfset structDelete(variables, "caller") />
	<cfset structDelete(variables, "thisTag") />
	<cfset structDelete(variables, "attributes") />

	<!--- tranfer the caller to the local variables --->
	<cfset structAppend(variables, __hidden__.caller, true) />

	<cfinclude template="#__hidden__.template#" />

	<!--- recreate the caller scope --->
	<cfset caller = __hidden__.caller />

	<!--- remove the hidden scope --->
	<cfset structDelete(variables, "__hidden__") />

	<!--- copy the variables scope --->
	<cfset vars = duplicate(variables) />

	<!--- remove the caller scope (prevent infinite references --->
	<cfset structDelete(vars, "caller") />

	<!--- add any variables declared inside the include back into the caller --->
	<cfset structAppend(caller, vars, true) />

</cfif>