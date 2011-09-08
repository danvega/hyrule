import hyrule.samples.advancedorm.model.product.Product;

component {

	public ProductService function init(){
		return this;
	}

	public Product function get(any id){
		if(arguments.id == 0){
			return entityNew("Product");
		} else {
			return entityLoadByPK("Product",form.category_id);
		}
	}
		
	public array function list(){
		return entityLoad("Product");
	}

}