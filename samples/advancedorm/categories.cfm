<cfset categoryService = new model.category.CategoryService()>
<cfset categories = categoryService.list()>

<h1>Categories</h1>

<cfoutput>
<table border="1">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Sort</th>
		<th>Product Count</th>
		<th>Actions</th>
	</tr>
	<cfloop array="#categories#" index="category">
	<tr>
		<td>#category.getId()#</td>	
		<td>#category.getName()#</td>	
		<td>#category.getSort()#</td>	
		<td>#arrayLen(category.getProducts())#</td>	
		<td><a href="category.cfm?id=#category.getid()#">Edit</a></td>
	</tr>
	</cfloop>
</table>
</cfoutput>

<p><a href="index.cfm">Home</a> | <a href="category.cfm">Add New Category</a></p>
