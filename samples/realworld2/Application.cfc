component  {

	this.name = hash(getDirectoryFromPath(getCurrentTemplatePath()));

	public boolean function onApplicationStart(){
		application.userService = new model.user.UserService();
		application.hyrule = new hyrule.Validator();
		return true;
	}

	public boolean function onRequestStart(String thepage){
		if(structKeyExists(url,"reload")){
			onApplicationStart();
		}
		return true;
	}

}