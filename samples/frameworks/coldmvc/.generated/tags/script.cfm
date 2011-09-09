<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfoutput>
<cfparam name="attributes.condition" default="" />

<cfif thisTag.executionMode eq "end">
	<cfif structKeyExists(attributes, "name")>
		#coldmvc.asset.renderJS(argumentCollection=attributes)#
	<cfelse>
		<cfif attributes.condition neq "">
			<script type="text/javascript">
				<!--
				<!--[if #attributes.condition#]>
					#thisTag.generatedContent#<![endif]
				-->
				//-->
			</script>
		<cfelse>
			<script type="text/javascript">
				<!--
				#thisTag.generatedContent#
				//-->
			</script>
		</cfif>
		<cfset thisTag.generatedContent = "" />
	</cfif>
</cfif>
</cfoutput>