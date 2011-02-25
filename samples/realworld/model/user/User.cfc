/**
 * @output false
 * @accessors true
 */
component {

	/**
	 * @display First Name
	 * @NotEmpty
	 */
	property string firstname;

	/**
	 * @display Last Name
	 * @NotEmpty
	 */
	property string lastname;

	/**
	 * @display Username
	 * @NotEmpty
	 * @custom hyrule.samples.realworld.model.validator.isUniqueUsername
	 */
	property username;

	/**
	 * @display Email Address
     * @Email
	 */
	property email;

	/**
	 * @display Password
	 * @min 6
	 */
	property password;

}
