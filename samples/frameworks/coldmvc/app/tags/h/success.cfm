<cfif thisTag.executionMode eq "end">

	<cfif structKeyExists(attributes, "success")>
		<cfset success = attributes.success />
	<cfelseif structKeyExists(params, "success")>
		<cfset success = params.success />
	<cfelse>
		<cfset success = "" />
	</cfif>

	<cfoutput>
	<cfif success neq "">
		<div class="alert-message success">
	    	<a class="close" href="##">×</a>
	   		<p>#escape(params.success)#</p>
	  	</div>
	</cfif>
	</cfoutput>

</cfif>