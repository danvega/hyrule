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
	 * @message You better provide a last name dude!
	 */
	property string lastname;

}
