component accessors="true" {

	public ProductService function init(){
		return this;
	}

	public array function list(){
		return entityLoad("Product");
	}

	public any function get(any id){
		if( isNumeric(arguments.id) && arguments.id != 0 ){
			return entityLoadByPK("Product",arguments.id);
		} else {
			return entityNew("Product");
		}
	}
	
	public void function save(any target){
		entitySave(target);
	}	

}