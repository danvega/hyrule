/**
 * @output false
 * @accessors true
 */
component {

	property numeric userId;

	/**
	 * @NotEmpty
	 */
	property string firstname;

	/**
	 * @min 3
	 */
	property string lastname;

	/**
	 * @hyrule.samples.custom.userService.isValidUsername
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

	
}
