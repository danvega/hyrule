﻿<h3>Categories</h3>

<cfoutput>
	
	<cfif structKeyExists(params,"success")>
		<div class="alert-message success">
        	<a class="close" href="##">×</a>
       		<p>#success#</p>
      	</div>	
	</cfif>
		
	<table class="zebra-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Sort</th>
				<th>Product Count</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#categories#" index="category">
			<tr>
				<td>#category.getId()#</td>	
				<td>#category.getName()#</td>	
				<td>#category.getSort()#</td>	
				<td>#arrayLen(category.getProducts())#</td>
				<td><a href="#linkTo('/category/edit')#/#category.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>
	
	<p align="right"><a href="#linkTo('/category/edit')#"><button class="btn primary">Add New Category</button></a></p>

</cfoutput>