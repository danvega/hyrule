component accessors="true" {

	property String firstname;
	property String lastname;
	property String email;
	property String username;
	property String password;

	this.constraints = {
		firstname = {required=true,min=5},
		lastname = {required=true,min=3},
		email = {required=true,type="email",unique=true},
		username = {required=true,size="6..15",unique=true},
		password = {required=true}
	};

	public User function init(){
		return this;
	}

}