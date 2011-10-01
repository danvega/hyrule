<cfoutput>
<h2>Add / Edit Product</h2>
<h:errors />
<c:form bind="product">
	<c:input name="name" />
	<c:select name="categories" multiple="true" />
	<c:textarea name="description" />
	<c:buttons>
		<c:reset name="cancel" url="#linkTo({action='list'})#" />
		<c:submit label="Save Changes" class="primary" />
	</c:buttons>
</c:form>
</cfoutput>