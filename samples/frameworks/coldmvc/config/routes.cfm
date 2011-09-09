<cfset add("/category/edit/:category_id",{
	defaults = {
		controller = "category",
		action = "edit"
	}
})>

<cfset add("/product/edit/:product_id",{
	defaults = {
		controller = "product",
		action = "edit"
	}
})>
