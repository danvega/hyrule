component accessors="true" extends="coldmvc.Controller" {

	property validationService;

	public void function list(){
		params.categories = _Category.list();
	}
	
	public void function edit(){
		param name="params.category_id" default="";
				
		if( !structKeyExists(params,"category") ){
	        params.category = _Category.get( params.category_id );			
		}
		
	}
	
	public void function save(){		
		var category = _Category.get( params.category_id );
		category.populate(params);
		
		var result = validationService.validate(category);

		if( !result.hasErrors() ){
			category.save();
 			flash.success = "Category Saved!";
        	redirect({action="list"});
		} else {
			// preserve some data on redirect
			flash.errors = result.getErrorMessages();
			flash.category = category;
			redirect({action="edit"});			
		}

	}

}