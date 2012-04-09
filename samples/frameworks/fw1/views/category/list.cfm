<h3>Categories</h3>

<cfoutput>

	<cfif structKeyExists(rc,"success")>
		<div class="alert alert-success">
        	<a class="close" href="##">×</a>
       		<p>#rc.success#</p>
      	</div>
	</cfif>

	<table class="table table-striped table-bordered table-condensed">
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
			<cfloop array="#rc.categories#" index="category">
			<tr>
				<td>#category.getId()#</td>
				<td>#category.getName()#</td>
				<td>#category.getSort()#</td>
				<td>#arrayLen(category.getProducts())#</td>
				<td><a href="#buildURL('category.edit')#&category_id=#category.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>

	<p align="right"><a href="#buildURL('category.edit')#"><button class="btn primary">Add New Category</button></a></p>

</cfoutput>
