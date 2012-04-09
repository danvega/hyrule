<cfparam name="url.rb" default="en_US">

Change Language
<select name="language" onchange="window.open(this.options[this.selectedIndex].value,'_top')">
	<option value="index.cfm?rb=en_us" <cfif url.rb EQ "en_us">selected</cfif>>English</option>
	<option value="index.cfm?rb=en_es" <cfif url.rb EQ "en_es">selected</cfif>>Spanish</option>
</select>

<br/><br/>

<!--- get a new instance with our configuration settings --->
<cfset hyrule = new hyrule.system.core.hyrule({rbpath="/hyrule/samples/rb/i18n"})>

<cfset person = new Person()>
<cfset person.setFirstName("")>
<cfset person.setLastName("")>
<cfset person.setAge(0)>

<cfset result = hyrule.validate(target=person,locale=url.rb)>

<!--- look at the error messages, they should be different when you switch languages --->
<cfdump var="#result.getErrors()#">

