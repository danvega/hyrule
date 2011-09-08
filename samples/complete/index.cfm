<cfif structKeyExists(form,"submit")>

	<cfset user = new model.user.User()>
	<cfset user.populate(form)>

	<cfset result = application.hyrule.validate(user)>
	
	<cfif result.hasErrors()>
		<cfset errors = result.getErrors()>
	<cfelse>
		<!--- save this user --->
		<cfset userService = new model.user.UserService()> 
		<cfset userService.save(user)>
		<cfset success = true>
		<!--- send back to our user list --->
	</cfif>

</cfif>

<cfparam name="form.firstname" default="">
<cfparam name="form.lastname" default="">
<cfparam name="form.email" default="">
<cfparam name="form.username" default="">

<cfparam name="success" default="false">
<cfparam name="errors" default="#arrayNew(1)#">

<html>
<head>
	<title>Real World Example</title>
	<style>
	#errors {width:500px;padding:5px;background:#FBE3E4;color:#8A1F11;}
	</style>
</head>
<body>

	<h2>Add New User</h2>

	<cfif arrayLen(errors)>
		<div id="errors">
			<ul>
				<cfloop array="#errors#" index="error">
					<li><cfoutput>#error.getMessage()#</cfoutput></li>
				</cfloop>
			</ul>
		</div>
	</cfif>

	<cfif success>
		<p>The user was saved!</p>
	<cfelse>
	<cfoutput>
	<form method="post">
	<p>
		<label for="firstname">First Name</label><br/>
		<input type="text" name="firstname" value="#form.firstname#">
	</p>
	<p>
		<label for="lastname">Last Name</label><br/>
		<input type="text" name="lastname" value="#form.lastname#">
	</p>
	<p>
		<label for="email">Email Address</label><br/>
		<input type="text" name="email" value="#form.email#">
	</p>
	<p>
		<label for="username">Username</label><br/>
		<input type="text" name="username" value="#form.username#">
	</p>
	<p>
		<label for="password">Password</label><br/>
		<input type="password" name="password">
	</p>
	<p>
		<input type="submit" name="submit" value="Add User">
	</p>
	</cfoutput>
	</form>
	</cfif>


</body>
</html>
