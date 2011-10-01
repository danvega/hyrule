<cfoutput>
<h2>Products</h2>
<h:success />
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
		<c:each in="#products#" do="product">
			<tr>
				<td>#product.id()#</td>
				<td>#escape(product.name())#</td>
				<td>#escape(product.categoryList())#</td>
				<td>#escape(product.description())#</td>
				<td><a href="#linkTo({action='edit', id=product})#">Edit</a></td>
			</tr>
		</c:each>
	</tbody>
</table>
<p align="right">
	<c:button url="#linkTo({action='edit'})#" label="Add New Product" class="primary" />
</p>
</cfoutput>