<cfset productService = new model.product.ProductService()>
<cfset products = productService.list()>

<h1>Products</h1>

<cfoutput>
<table border="1">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Categories</th>
		<th>Description</th>
	</tr>
	<cfloop array="#products#" index="product">
	<tr>
		<td>#product.getId()#</td>	
		<td>#product.getName()#</td>	
		<td>#product.getCategoryList()#</td>	
		<td>#product.getDescription()#</td>	
	</tr>
	</cfloop>
</table>
</cfoutput>

<p><a href="index.cfm">Home</a> | <a href="product.cfm">Add New Product</a></p>
