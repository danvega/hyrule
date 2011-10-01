/**
 * @accessors true
 * @action list
 * @extends coldmvc.Controller
 */
component {

	property validationService;

	function list() {

		params.categories = _Category.list();

	}

	function edit() {

		var id = getParam("id");
		var category = _Category.get(id);

		if (isPost()) {

			category.populate(params.category);

			var result = validationService.validate(category);

			if (result.hasErrors()) {

				params.errors = result.getErrorMessages();

			} else {

				category.save();
	 			flash.success = "Category Saved!";
	        	redirect({action="list"});
			}

		}

		params.category = category;

	}

}