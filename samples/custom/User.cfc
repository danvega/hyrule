/**
 * @output false
 * @accessors true
 */
component {

	property numeric userId;

	/**
	 * @Required true
	 */
	property string firstname;

	/**
	 * @Required true
	 * @min 3
	 */
	property string lastname;

	/**
	 * @Required true
	 * @validator hyrule.samples.custom.userService.isValidUsername
	 */
	property string username;

	/**
	 * @Required true
	 * @IsValid email
	 */
	property string email;

	/**
	 * @Range 1,11
	 * @SameAs confirmPassword
	 */
	property string password;

	/**
	 * @Required true
	 */
	property string confirmPassword;


}
