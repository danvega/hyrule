<cfparam name="attributes.result">
<cfparam name="attributes.className" default="errors">

<cfsetting enablecfoutputonly="true"/>
<cfif thisTag.executionMode eq "start">
	
	<cfif attributes.result.hasErrors()>
		<cfoutput>
		<ul class="#attributes.className#">
		<cfloop array="#attributes.result.getErrors()#" index="error">
			<li>#error.getMessage()#</li>
		</cfloop>
		</ul>
		</cfoutput>
	</cfif>	
			
</cfif>
<cfsetting enablecfoutputonly="false"/>