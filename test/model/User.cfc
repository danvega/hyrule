component accessors="true" {

	property username;
	property password;
	property confirmPassword;

	public User function init(){
		return this;
	}

	/**
	 * I am called using the methodConstraint
	 *
	 * this.constraints = {
	 * 	username = {method=isUsernameCool}
	 * };
	 */
	public Boolean function isUsernameCool(){
		return (getUsername() == "jonnyflynn");
	}
}