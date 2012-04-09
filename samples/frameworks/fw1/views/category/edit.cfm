<cfparam name="url.category_id" default="">

<h2>Category Editor</h2>

<cfoutput>

	<cfif structKeyExists(rc,"errors")>
		<div class="alert alert-error">
			<a class="close" href="##">×</a>
			<ul>
				<cfloop array="#rc.errors#" index="error">
					<li>#error#</li>
				</cfloop>
			</ul>
		</div>
	</cfif>

	<form method="post" action="#buildURL('category.save')#">
		<input type="hidden" name="category_id" value="#url.category_id#">
		<div class="clearfix">
			<label for="name">Name</label>
			<div class="input">
				<input class="xlarge" id="name" name="name" size="30" type="text" value="#rc.category.getName()#" tabindex="1">
			</div>
		</div>
		<div class="clearfix">
			<label for="sort">Sort</label>
			<div class="input">
				<input class="xlarge" id="sort" name="sort" size="30" type="text" value="#rc.category.getSort()#" tabindex="2">
			</div>
		</div>
		<div class="actions">
			<a href="#buildURL('category.list')#"><button type="reset" class="btn" tabindex="4">Cancel</button></a>&nbsp;
			<input type="submit" class="btn primary" value="Save Changes" tabindex="3">
		</div>
	</form>

</cfoutput>

