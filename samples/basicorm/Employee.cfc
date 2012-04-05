component persistent="true" {

	property name="userid" fieldtype="id" ormtype="int" generator="native";
	property String firstname;
	property String lastname;
	property String email;

	this.constraints = {
		firstname = {required=true},
		lastname = {required=true},
		email = {required=true,unique=true}	
	};

	public Employee function init(){
		return this;
	}

}
