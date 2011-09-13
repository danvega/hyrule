<h2>Products</h2>

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
				<th>Categories</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#products#" index="product">
			<tr>
				<td>#product.getId()#</td>	
				<td>#product.getName()#</td>	
				<td>#product.getCategoryList()#</td>	
				<td>#product.getDescription()#</td>	
				<td><a href="#linkTo('/product/edit')#/#product.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>

	<p align="right"><a href="#linkTo('/product/edit')#"><button class="btn primary">Add New Product</button></a></p>
	
</cfoutput>