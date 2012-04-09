component persistent="true" {

	property name="userid" fieldtype="id" ormtype="int" generator="native";
	property name="firstname" type="string";
	property name="lastname" type="string";
	property name="email" type="string";

	this.constraints = {
		firstname = {required=true},
		lastname = {required=true},
		email = {required=true,unique=true}
	};

	public Employee function init(){
		return this;
	}

}
