import hyrule.samples.advancedorm.model.category.Category;

component {

	public CategoryService function init(){
		return this;
	}
	
	public array function list(){
		return entityLoad("Category");
	}
	
	public Category function get(any id){
		if(arguments.id == 0){
			return entityNew("Category");
		} else {
			return entityLoadByPK("Category",form.category_id);
		}
	}
	
	public array function loadById(String ids){
		var cats = [];
		
		for(var i=1; i<=listLen(arguments.ids); i++ ){
			arrayAppend(cats,entityLoadByPK("Category",listGetAt(ids,i)));
		}
		
		return cats;
	}
		
	public numeric function count(){
		return arrayLen(list());
	}

}