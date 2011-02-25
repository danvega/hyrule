/**
 * @output false
 * @accessors true
 */
component {

	/**
	 * @fieldtype id
	 * @sqltype integer
	 * @generator increment
	 */
	property numeric userId;

	/**
	 * @display First Name
	 * @NotEmpty
	 */
	property string firstname;

	/**
	 * @display Last Name
	 * @min 3
	 */
	property string lastname;

	/**
	* @display Username
	* @max 1
	*/
	property string username;

	/**
	 * @display Password
	 * @Range 6,10
	 */
	property string password;

	/**
	 * @display Email Address
	 * @Email
	 */
	property string email;

	/**
	 * @display Date Of Birth
	 * @past
	 */
	property date dob;
}
