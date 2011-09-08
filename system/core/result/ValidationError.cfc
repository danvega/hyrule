component accessors="true" {

	/**
	 *	The fully qualified class of the error
	 */
	property class;

	/**
	 *	The level of the validation (property)
	 */
	property level;
	
	/**
	 *	The property (variable) that is being validated
	 */	
	property property;

	/**
	 *	The type of validation that was performed
	 */	
	property type;

	/**
	 *	The error message to be displayed to the user
	 */	
	property message;
	
	public validationError function init(){
		return this;
	}

}
