component accessors="true" {

	property String firstname;
	property String lastname;
	property String email;
	property String username;
	property String password;

	this.constraints = {
		firstname = {required=true,context="insert,update"},
		lastname = {required=true,context="insert,update"},
		email = {required=true,type="email",context="insert,update"},
		username = {required=true,size="6..15",context="insert,update"},
		password = {required=true,context="changePassword"}
	};

	public User function init(){
		return this;
	}

}