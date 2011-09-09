component persistent="true" extends="coldmvc.Model" {

	property name="id" column="product_id" fieldtype="id" generator="native";
	
	/**
	 * @blank false
	 */
	property name="name";
	
	/**
	 * @blank false
	 */
	property name="description" ormtype="text";

	/** 
	 * @size 1..-1
	 */
	property name="categories" fieldtype="many-to-many" cfc="hyrule.samples.frameworks.coldmvc.app.model.Category" linktable="product_categories" 
		 fkcolumn="product_id" inversejoincolumn="category_id" lazy="true" cascade="all" singularname="category";
	
	
	public Product function init(){
		setCategories([]);
		return this;
	}
	
	public string function getCategoryList(){
		var cats = "";
		
		for(var x=1; x<=arrayLen(getCategories()); ++x){
			cats = listAppend(cats,getCategories()[x].getName());
		}
		
		return cats;
	}
		 
}