component persistent="true" {

	property name="id" column="product_id" fieldtype="id" generator="native";
	property name="name" required="true";
	property name="description" ormtype="text" required="true";

	/**
	 * @size 1..-1
	 */
	property name="categories" fieldtype="many-to-many" cfc="hyrule.samples.frameworks.fw1.model.Category" linktable="product_categories"
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