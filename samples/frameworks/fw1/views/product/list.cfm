<h2>Products</h2>

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
				<th>Categories</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#rc.products#" index="product">
			<tr>
				<td>#product.getId()#</td>
				<td>#product.getName()#</td>
				<td>#product.getCategoryList()#</td>
				<td>#product.getDescription()#</td>
				<td><a href="#buildURL('product.edit')#&product_id=#product.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>

	<p align="right"><a href="#buildURL('product.edit')#"><button class="btn primary">Add New Product</button></a></p>

	<!--- table sorter --->
	<script type="text/javascript">
	$(function() {
		/*
		 * sortList:
		 * An array of instructions for per-column sorting and direction in the format: [[columnIndex, sortDirection], ... ]
		 * where columnIndex is a zero-based index for your columns left-to-right and sortDirection is 0 for Ascending and 1
		 * for Descending. A valid argument that sorts ascending first by column 1 and then column 2 looks like: [[0,0],[1,0]]
		 */
		$(".zebra-striped").tablesorter({ sortList: [[1,0]] });
	});
	</script>

</cfoutput>