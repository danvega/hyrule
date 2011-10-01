<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfoutput>
<cfif thisTag.executionMode eq "start">
	<#coldmvc.form.getOption('buttons', 'tag')# class="#coldmvc.form.getOption('buttons', 'class')#">
<cfelse>
	</#coldmvc.form.getOption('buttons', 'tag')#>
</cfif>
</cfoutput>