<cfimport prefix="hyrule" taglib="/hyrule/system/tags"/>

<cfset productService = new model.product.ProductService()>
<cfset categoryService = new model.category.categoryService()>

<cfif structKeyExists(form,"submit")>
	
	<cfset product = productService.get(form.product_id)>
	<cfset product.setName(form.name)>
	<cfset product.setDescription(form.description)>
	
	<!--- the load by id method accepts a list of ids and returns an array of objects --->
	<cfif structKeyExists(form,"categories")>
		<cfset product.setCategories( categoryService.loadById(form.categories) )>	
	</cfif>
	
	<cfset result = application.hyrule.validate(product)>
	
	<cfif result.hasErrors()>
		<cfset errors = result.getErrors()>
	<cfelse>
		<!--- there are no errors, persist the data --->
		<cfset entitySave(product)>
		<cflocation url="products.cfm" addtoken="false">
	</cfif>	
	
</cfif>

<cfparam name="url.id" default="0">
<cfparam name="errors" default="#arrayNew(1)#">

<cfif url.id NEQ 0>
	<cfset product = entityLoadByPk("Product",url.id)>
<cfelse>
	<cfset product = entityNew("Product")>
</cfif>

<!DOCTYPE html>
<html>
<head>
	<title>Add / Edit Product</title>
	<style>
		form {width:350px;}
		label {float:left;width:155px;}
	</style>
</head>
<body>
	
	<h1>Add / Edit Product</h1>
	
	<!--- if the ValidationResult object exists display the errors --->
	<cfif isDefined("result")>
		<hyrule:Message result="#result#"/>
	</cfif>
	
	<cfoutput>
	<form method="post">
		<input type="hidden" name="product_id" value="#url.id#">
		<div>
			<label for="name">Name:</label>
			<input type="text" name="name" value="#product.getName()#">
		</div>
		<div>
			<label for="categories">Categories</label>
			<select name="categories" multiple="true">
				<cfset categories = categoryService.list()>
				<cfloop array="#categories#" index="category">
					<option value="#category.getId()#">#category.getName()#</option>
				</cfloop>
			</select>
		<div>
			<label for="description">Description:</label>
			<textarea name="description">#product.getDescription()#</textarea>
		</div>
		<p align="right"><input type="submit" name="submit" value="Save"></p>
	</form>
	</cfoutput>
	
</body>
</html>