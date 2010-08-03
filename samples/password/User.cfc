component accessors="true" {

	// passowrd (min,max,level)
	// default level is low

	/**
	 * @Password 6,20,low
	 */
	property lowPassword;

	/**
	 * @Password 6,20,medium
	 */
	property mediumPassword;

	/**
	 * @Password 6,20,high
	 * @message This password is high level and there for must contain letters, numbers & special characters.
	 */
	property highPassword;

}
