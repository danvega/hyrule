component persistent="true" {


	property name="id" column="category_id" fieldtype="id" generator="native";
	property name="name" required="true";
	property name="sort" ormtype="int" isvalid="integer";

	property name="products" fieldtype="many-to-many" cfc="hyrule.samples.frameworks.coldbox.model.product.Product" linktable="product_categories"
			 fkcolumn="category_id" inversejoincolumn="product_id" lazy="true" cascade="all" singularname="product" inverse="true";

}