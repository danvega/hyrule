<h3>Categories</h3>

<cfoutput>
	
	#getPlugin('messagebox').renderit()#
	
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
			<cfloop array="#rc.categories#" index="category">
			<tr>
				<td>#category.getId()#</td>	
				<td>#category.getName()#</td>	
				<td>#category.getSort()#</td>	
				<td>#arrayLen(category.getProducts())#</td>	
				<td><a href="#event.buildLink('category/edit')#?category_id=#category.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>
	
	<p align="right"><a href="#event.buildLink('category/edit')#"><button class="btn primary">Add New Category</button></a></p>
	
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
