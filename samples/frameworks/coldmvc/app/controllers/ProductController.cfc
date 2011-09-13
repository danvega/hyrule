component accessors="true" extends="coldmvc.Controller" {

	property validationService;
	property _Category;

	public void function list(){
		params.products = _Product.list();
	}
	
	public void function edit(){
		param name="params.product_id" default="";
				
		if( !structKeyExists(params,"product") ){
	        params.product = _Product.get( params.product_id );			
		}
		
		params.categories = _Category.list();
	}
	
	public void function save(){		
		var product = _Product.get( params.product_id );
		product.populate(params);
		
		var result = validationService.validate(product);

		if( !result.hasErrors() ){
			product.save();
 			flash.success = "Product Saved!";
        	redirect({action="list"});
		} else {
			// preserve some data on redirect
			flash.errors = result.getErrorMessages();
			flash.product = product;
			redirect({action="edit"});			
		}

	}

}