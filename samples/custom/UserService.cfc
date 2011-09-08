component {

	public UserService function init(){
		return this;
	}

	public boolean function isValidUsername(String username){
		if(arguments.username == 'dvega'){
			return false;
		} else {
			return true;
		}
	}

}