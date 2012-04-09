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
	 */
	property string lastname;

	/**
	 * @Required true
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
	 *
	 */
	property string password;

	/**
	 * @Range 1,11
	 */
	property string confirmPassword;


}
