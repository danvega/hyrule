component persistent="true" {
	
	/**
	 * @fieldtype id
	 * @generator native
	 */
	property userid;

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
	 * @display Password
	 * @min 6
	 */
	property password;

	/**
	 * @display Confirm Password
	 * @min 6
	 * @isMatch {password}
	 * @persistent false
	 */	
	property passwordConfirm;

}
