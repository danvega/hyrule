<cfimport prefix="hyrule" taglib="/hyrule/system/tags"/>

<cfset categoryService = new model.category.CategoryService()>

<cfif structKeyExists(form,"submit")>
	
	<cfset category = categoryService.get(form.category_id)>
	<cfset category.setName(form.name)>
	<cfset category.setSort(form.sort)>
	
	<cfset result = application.hyrule.validate(category)>
	
	<cfif result.hasErrors()>
		<cfset errors = result.getErrors()>
	<cfelse>
		<!--- there are no errors, persist the data --->
		<cfset entitySave(category)>
		<cflocation url="categories.cfm" addtoken="false">
	</cfif>	
	
</cfif>

<cfparam name="url.id" default="0">
<cfparam name="errors" default="#arrayNew(1)#">

<cfif url.id NEQ 0>
	<cfset category = entityLoadByPk("Category",url.id)>
<cfelse>
	<cfset category = entityNew("Category")>
</cfif>

<!DOCTYPE html>
<html>
<head>
	<title>Add / Edit Category</title>
	<style>
		form {width:350px;}
		label {float:left;width:155px;}
		.errors {background:red;color:#fff;}
	</style>
</head>
<body>
	
	<h1>Add / Edit Category</h1>
	
	<!--- if the ValidationResult object exists display the errors --->
	<cfif isDefined("result")>
		<hyrule:Message result="#result#"/>
	</cfif>
	
	<cfoutput>
	<form method="post">
		<input type="hidden" name="category_id" value="#url.id#">
		<div>
			<label for="name">Name:</label>
			<input type="text" name="name" value="#category.getName()#">
		</div>
		<div>
			<label for="sort">Sort:</label>
			<input type="text" name="sort" value="#category.getSort()#">
		</div>
		<p align="right"><input type="submit" name="submit" value="Save"></p>
	</form>
	</cfoutput>
	
</body>
</html>