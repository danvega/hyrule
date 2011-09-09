<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "start">

	<cfparam name="attributes.bind" default="" />

	<!--- aliases --->
	<cfif structKeyExists(attributes, "do")> <!--- ruby --->
		<cfset attributes.value = attributes.do />
	</cfif>
	<cfif structKeyExists(attributes, "var")> <!--- grails --->
		<cfset attributes.value = attributes.var />
	</cfif>

	<cfif attributes.bind neq "">

		<cfif not structKeyExists(attributes, "in")>
			<cfif coldmvc.params.has(attributes.bind)>
				<cfset attributes.in = coldmvc.params.get(attributes.bind) />
			</cfif>
		</cfif>

		<cfif not structKeyExists(attributes, "value")>
			<cfset attributes.value = coldmvc.string.singularize(attributes.bind) />
		</cfif>

	</cfif>

	<cfparam name="attributes.value" default="it" />
	<cfparam name="attributes.in" default="" />
	<cfparam name="attributes.start" default="1" />
	<cfparam name="attributes.delimeter" default="," />
	<cfparam name="attributes.class" default="" />

	<cfset attributes.length = coldmvc.data.count(attributes.in, attributes.delimeter) />

	<cfif not isNumeric(attributes.start)>
		<cfset attributes.start = 1 />
	</cfif>

	<cfif not structKeyExists(attributes, "end")>

		<cfif structKeyExists(attributes, "max")>

			<cfif not isNumeric(attributes.max)>
				<cfset attributes.max = 10 />
			</cfif>

			<cfset attributes.end = attributes.start + attributes.max - 1 />

		<cfelse>

			<cfset attributes.end = attributes.length />

		</cfif>

	</cfif>

	<cfif not isNumeric(attributes.end)>
		<cfset attributes.end = 10 />
	</cfif>

	<cfif attributes.start gt attributes.length>
		<cfset attributes.start = 1 />
	</cfif>

	<cfif attributes.end gt attributes.length>
		<cfset attributes.end = attributes.length />
	</cfif>

	<cfif attributes.bind neq "">
		<cfset coldmvc.bind.start(attributes.bind, attributes.start) />
	</cfif>

	<cfif attributes.length gt 0>

		<cfset result = coldmvc.loop.each(attributes) />

		<cfset structAppend(caller, result) />

	<cfelse>

		<cfif attributes.bind neq "">
			<cfset coldmvc.bind.stop(attributes.bind) />
		</cfif>

		<cfexit method="exittag" />

	</cfif>

	<cfset content = [] />

<cfelse>

	<cfset arrayAppend(content, thisTag.generatedContent) />

	<cfset thisTag.generatedContent = "" />

	<cfif attributes.bind neq "">
		<cfset coldmvc.bind.stop(attributes.bind) />
	</cfif>

	<cfset attributes.start++ />

	<cfif attributes.start lte attributes.end>

		<cfset result = coldmvc.loop.each(attributes) />

		<cfset structAppend(caller, result) />

		<cfif attributes.bind neq "">
			<cfset coldmvc.bind.start(attributes.bind, attributes.start) />
		</cfif>

		<cfexit method="loop" />

	</cfif>

	<cfset thisTag.generatedContent = arrayToList(content, "") />

</cfif>