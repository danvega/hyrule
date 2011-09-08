/**
 * @output false
 * @accessors true
 * @extends hyrule.samples.complete.model.abstract.AbstractDomain
 */
component {

	/**
	 * @blank false
	 */
	property string firstName;

	/**
	 * @blank false
	 */
	property string lastName;

	/**
	 * @blank false
	 * @hyrule.samples.complete.model.user.userService.isUniqueUsername
	 */
	property username;

	/**
     * @Email
	 */
	property email;

	/**
	 * @min 6
	 */
	property password;

}
