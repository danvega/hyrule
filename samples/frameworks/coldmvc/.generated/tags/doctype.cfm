<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.name" default="HTML" />

	<cfswitch expression="#attributes.name#">

		<cfcase value="HTML 4.01 Strict">
			<cfset result = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">' />
		</cfcase>

		<cfcase value="HTML 4.01 Transitional">
			<cfset result = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">' />
		</cfcase>

		<cfcase value="HTML 4.01 Frameset">
			<cfset result = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">' />
		</cfcase>

		<cfcase value="XHTML 1.0 Strict">
			<cfset result = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">' />
		</cfcase>

		<cfcase value="XHTML 1.0 Transitional">
			<cfset result = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' />
		</cfcase>

		<cfcase value="XHTML 1.0 Frameset">
			<cfset result = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">' />
		</cfcase>

		<cfcase value="XHTML 1.1">
			<cfset result = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">' />
		</cfcase>

		<cfcase value="HTML">
			<cfset result = '<!DOCTYPE html>' />
		</cfcase>

		<cfdefaultcase>
			<cfset result = '<!DOCTYPE #attributes.name#>' />
		</cfdefaultcase>

	</cfswitch>

	<cfset thisTag.generatedContent = result />

</cfif>