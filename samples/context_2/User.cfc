/**
 * @output false
 * @accessors true
 */
component {

	property numeric userId;

	/**
	 * @Required
	 *@context userSetup		 
	 */
	property string firstname;

	/**
	 * @min 3
	*@context userSetup		 
	 */
	property string lastname;

	/**
	* @max 3
	*@context userSetup	
	*/
	property string username;

	/**
	 * @Email
	 */
	property string email;

	/**
	 * @Range 1,11
	 *@context passwordChange
	 */
	property string password;

	/**
	 * @Range 1,11
	 *@context passwordChange	 
	 */
	property string confirmPassword;

	
}
