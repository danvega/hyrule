<cfimport prefix="c" taglib="/tags/" /><cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfoutput>
<cfif thisTag.executionMode eq "start">

	<cfif structKeyExists(attributes, "bind")>
		<cfset coldmvc.bind.start(attributes.bind) />
	</cfif>

	<cfoutput>
		#coldmvc.form.form(argumentCollection=attributes)#
	</cfoutput>

<cfelse>

	<!--- if a label was passed in, wrap the form in a fieldset --->
	<cfif structKeyExists(attributes, "label")>
		<cfsavecontent variable="thisTag.generatedContent">
			<c:fieldset label="#attributes.label#">
				#thisTag.generatedContent#
			</c:fieldset>
		</cfsavecontent>
	</cfif>

	</form>

	<cfif structKeyExists(attributes, "bind")>
		<cfset coldmvc.bind.stop(attributes.bind) />
	</cfif>

</cfif>
</cfoutput>