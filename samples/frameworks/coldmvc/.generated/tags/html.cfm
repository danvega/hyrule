<cfset coldmvc.factory.get("viewHelperManager").addViewHelpers(variables) /><cfif thisTag.executionMode eq "start">

<cfparam name="attributes.lang" default="en" />

<cfoutput>
<!--[if lt IE 7]> <html class="no-js ie6" lang="#attributes.lang#"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="#attributes.lang#"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="#attributes.lang#"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="#attributes.lang#"> <!--<![endif]-->
</cfoutput>

<cfelse>

</html>

</cfif>