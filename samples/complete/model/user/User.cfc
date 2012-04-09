/**
 * @output false
 * @accessors true
 * @extends hyrule.samples.complete.model.abstract.AbstractDomain
 */
component {

	/**
	 * @Required true
	 */
	property string firstName;

	/**
	 * @Required true
	 */
	property string lastName;

	/**
	 * @Required true
	 * @unique true
	 */
	property username;

	/**
	 * @Required true
     * @IsValid email
	 */
	property email;

	/**
	 * @min 6
	 */
	property password;

}
