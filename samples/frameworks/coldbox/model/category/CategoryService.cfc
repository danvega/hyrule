import hyrule.samples.frameworks.coldbox.model.category.Category;

component extends="coldbox.system.orm.hibernate.VirtualEntityService" {
	
	public CategoryService function init(){
		super.init(entityName="Category");
		return this;
	}

	public array function loadById(String ids){
		var cats = [];
		
		for(var i=1; i<=listLen(arguments.ids); i++ ){
			arrayAppend(cats,entityLoadByPK("Category",listGetAt(ids,i)));
		}
		
		return cats;
	}		

}