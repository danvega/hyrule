
	<h3>Edit User</h3>
	

	<cfif user.hasErrors()>
		<cfdump var="#user.getErrors()#">
	</cfif>	
	<cfdump var="#user#">

	<cfoutput>
	<c:form method="post" action="save">

		<c:hidden name="id" />

		<fieldset>
			<legend>General Information</legend>
			<div>
				<label for="firstname">First Name</label>
				<input type="text" name="firstname" value="#user.getFirstName()#">
			</div>
			<div>
				<label for="lastname">Last Name</label>
				<input type="text" name="lastname" value="#user.getLastName()#">
			</div>
			<div>
				<label for="email">Email Address</label>
				<input type="text" name="email" value="#user.getEmail()#">
			</div>			
		</fieldset>

		<fieldset>
			<legend>Account Information</legend>
			<div>
				<label for="username">Username</label>
				<input type="text" name="username" value="#user.getUsername()#">
			</div>
			<div>
				<label for="password">Password</label>
				<input type="password" name="password" value="">
			</div>		
			<div>
				<label for="passwordConfirm">Confirm Password</label>
				<input type="password" name="passwordConfirm" value="">
			</div>											
		</fieldset>
		
		<div align="right">
			<input type="submit" name="submit" value="Save User">
		</div>
		
	</form>
	</cfoutput>
	