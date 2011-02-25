/**
 * @output false
 * @accessors true
 */
component {

	/**
	 * @display First Name
	 * @NotEmpty
	 */
	property firstname;

	/**
	 * @display Last Name
	 * @NotEmpty
	 */
	property lastname;

	/**
	 * @custom hyrule.samples.custom.isUniqueUsername
	 * @message That username already exists in our system. Please choose another username.
	 */
	property username;

}
