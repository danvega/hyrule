import hyrule.samples.realworld.model.user.UserService;

component implements="hyrule.rules.IValidator" {

	public boolean function isValid(Struct prop){
		var valid = true;
		var userService = new UserService();

		// database lookup to see if its valid. returns true if username is found
		if(userService.getByUsername(arguments.prop.value)){
			valid = false;
		}

		return valid;
	}

	public string function getMessage(Struct prop,String message) {
		return "That username already exists in our system. Please choose another username.";
	}

}