<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "start">
	<cfoutput>
	#coldmvc.form.fieldset(argumentCollection=attributes)#
	</cfoutput>
<cfelse>
	</fieldset>
</cfif>