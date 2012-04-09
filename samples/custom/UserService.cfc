component {

	public UserService function init(){
		return this;
	}

	public boolean function isValidUsername(String username){
		if( findNoCase("1234",arguments.username) == 0 ){
			return false;
		} else {
			return true;
		}
	}

}