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
	* max 3
	*/
	property string username;

	/**
	 * @Range 6,10
	 */
	property string password;

	/**
	 * @Email
	 */
	property string email;

	/**
	 * @max $now
	 */
	property date dob;
	
	/**
	 * @size 1..2
	 */
	property array cats;
	
}
