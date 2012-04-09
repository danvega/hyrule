<cfoutput>
<h3>Categories</h3>
<h:success />
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
		<c:each in="#categories#" do="category">
			<tr>
				<td>#category.id()#</td>
				<td>#escape(category.name())#</td>
				<td>#escape(category.sort())#</td>
				<td>#arrayLen(category.products())#</td>
				<td><a href="#linkTo({action='edit', id=category})#">Edit</a></td>
			</tr>
		</c:each>
	</tbody>
</table>
<p align="right">
	<c:button url="#linkTo({action='edit'})#" label="Add New Category" class="primary" />
</p>
</cfoutput>