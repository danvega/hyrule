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
		
		writeDump(validationService);
		writeDump(params);
		abort;
		
		//var category = _Category.get( params.category_id );
		//category.populate()
		
	}

}