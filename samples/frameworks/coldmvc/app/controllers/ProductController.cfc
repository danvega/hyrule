/**
 * @accessors true
 * @action list
 * @extends coldmvc.Controller
 */
component {

	property validationService;
	property _Category;

	function list() {

		params.products = _Product.list();

	}

	function edit() {

		var id = getParam("id");
		var product = _Product.get(id);

		if (isPost()) {

			product.populate(params.product);

			var result = validationService.validate(product);

			if (result.hasErrors()) {

				params.errors = result.getErrorMessages();

			} else {

				product.save();
	 			flash.success = "Product Saved!";
	        	redirect({action="list"});
			}

		}

		params.product = product;
		params.categories = _Category.list({
			sort = "sort",
			order = "asc"
		});

	}

}