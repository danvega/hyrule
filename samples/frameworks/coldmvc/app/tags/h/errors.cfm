<cfif thisTag.executionMode eq "end">

	<cfif structKeyExists(attributes, "errors")>
		<cfset errors = attributes.errors />
	<cfelseif structKeyExists(params, "errors")>
		<cfset errors = params.errors />
	<cfelse>
		<cfset errors = [] />
	</cfif>

	<cfoutput>
	<cfif isArray(errors) and arrayLen(errors) gt 0>
		<div class="alert-message block-message error">
			<a class="close" href="##">x</a>
			<ul>
				<c:each in="#errors#" do="error">
					<li>#error#</li>
				</c:each>
			</ul>
		</div>
	</cfif>
	</cfoutput>

</cfif>