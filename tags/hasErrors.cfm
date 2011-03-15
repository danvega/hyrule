<cfparam name="attributes.bean">
<cfparam name="attributes.context" default="*">

<cfsetting enablecfoutputonly="true"/>
<cfif thisTag.executionMode eq "start">
	
	<cfset hyrule = new hyrule.core.hyrule()>
	<cfset result = hyrule.validate(attributes.bean,attributes.context)>
	
	<cfif result.hasErrors()>
		<cfset errors = result.getErrors()>
	</cfif>
			
</cfif>
<cfsetting enablecfoutputonly="false"/>