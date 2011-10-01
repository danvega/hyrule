<h2>Category Editor</h2>
<h:errors />
<c:form bind="category">
	<c:input name="name" />
	<c:number name="sort" />
	<c:buttons>
		<c:reset name="cancel" url="#linkTo({action='list'})#" />
		<c:submit label="Save Changes" class="primary" />
	</c:buttons>
</c:form>