component accessors="true" {

	public CategoryService function init(){
		return this;
	}

	public array function list(){
		return entityLoad("Category");
	}

	public any function get(any id){
		if( isNumeric(arguments.id) && arguments.id != 0 ){
			return entityLoadByPK("Category",arguments.id);
		} else {
			return entityNew("Category");
		}
	}
	
	public void function save(any target){
		entitySave(target);
	}

	public array function loadById(String ids){
		var cats = [];
		
		for(var i=1; i<=listLen(arguments.ids); i++ ){
			arrayAppend(cats,entityLoadByPK("Category",listGetAt(ids,i)));
		}
		
		return cats;
	}	

}