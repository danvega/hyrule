/**
 * @output false
 * @accessors true
 */
component {

	property numeric userId;

	/**
	 * @method isNameFullName
	 */
	property string firstname;

	property string lastname;

	/**
	 * @validator hyrule.samples.custom.userService.isValidUsername
	 */
	property string username;

	/**
	 * @Email
	 */
	property string email;

	/**
	 * @Range 1,11
	 * @Matches confirmPassword
	 */
	property string password;

	/**
	 * @Range 1,11
	 */
	property string confirmPassword;
	
	//if we got a first name we need a last and vice versa
	boolean function isNameFullName(){
		return ( isNULL(getFirstName()) && isNULL(getLastName()) ) || ( !isNULL(getFirstName()) && !isNULL(getLastName()) );
	}

	
}
