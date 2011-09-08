<cfparam name="url.product_id" default="0">

<h2>Add / Edit Product</h2>

<cfoutput>
	
	#getPlugin('messagebox').renderit()#
	
	<form method="post" action="#event.buildLink('product/save')#">
		<input type="hidden" name="product_id" value="#url.product_id#">
		<div class="clearfix">
			<label for="name">Name</label>
			<div class="input">
				<input class="xlarge" id="name" name="name" size="30" type="text" value="#rc.product.getName()#" tabindex="1">
			</div>
		</div>		
		<div class="clearfix">
			<label for="categories">Categories</label>
			<div class="input">
				<select name="categories" multiple="true" tabindex="2" style="height:100px;">
					<cfloop array="#rc.categories#" index="category">
						<option value="#category.getId()#" <cfif rc.product.hasCategory(category)>selected</cfif>>#category.getName()#</option>
					</cfloop>
				</select>
			</div>
		</div>		
		<div class="clearfix">
			<label for="description">Description</label>
			<div class="input">
				<textarea class="xxlarge" id="description" name="description" tabindex="3">#rc.product.getDescription()#</textarea>	
			</div>
		</div>	
		<div class="actions">
			<a href="#event.buildLink('product/list')#"><button type="reset" class="btn" tabindex="5">Cancel</button></a>&nbsp;
			<input type="submit" class="btn primary" value="Save Changes" tabindex="4">
		</div>
	</form>
	
</cfoutput>