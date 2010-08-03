
	
	<h1>List Users</h1>
	
	<cfoutput>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Address</th>
				<th>Username</th>
				<th>Password</th>
				<th>Created On</th>
				<th>Updated On</th>	
			</tr>
		</thead>
		<tbody>
			<cfloop array="#users#" index="user">
			<tr>
				<td><a href="#linkto({action='edit',id=user.getId()})#">#user.getId()#</a></td>
				<td>#user.getFirstName()#</td>
				<td>#user.getLastName()#</td>
				<td>#user.getEmail()#</td>
				<td>#user.getUsername()#</td>
				<td>#user.getPassword()#</td>
				<td>#dateFormat(user.getCreatedOn(),"mm/dd/yyyy")#</td>
				<td>#dateFormat(user.getUpdatedOn(),"mm/dd/yyyy")#</td>				
			</tr>
			</cfloop>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8" align="right">
					<a href="#linkto({action='edit',id=0})#">Add User</a>
				</td>
			</tr>
		</tfoot>	
	</table>
	</cfoutput>
