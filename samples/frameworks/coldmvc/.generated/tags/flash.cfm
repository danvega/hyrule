<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfoutput>
<cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.key" default="message" />
	<cfparam name="attributes.id" default="" />
	<cfparam name="attributes.class" default="flash" />

	<cfif structKeyExists(params, attributes.key)>
		<div<cfif attributes.id neq ""> id="#attributes.id#"</cfif><cfif attributes.class neq ""> class="#attributes.class#"</cfif>>
			#params[attributes.key]#
		</div>
	</cfif>

</cfif>
</cfoutput>