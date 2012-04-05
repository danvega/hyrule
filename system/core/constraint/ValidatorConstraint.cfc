/** 
 * ValidatorConstraint
 * 
 * @hint I am used when you want to define your own custom validator. Your method must return a boolean or I will throw an error.
 *
 */
component extends="AbstractConstraint" accessors="true" {
	
	/**
	 * I am the validator to use. I will be the full path to the component and method. For example, If you had a method
	 * named isUniqueEmail in your user service component the validator attribute might look like this. You have the path
	 * to the component along with the method name youwish to call.
	 * 
	 * this.constraints = {
	 * 		email = {validator="com.abc.service.UserService.isUniqueEmail"}	
	 * }
	 */
	property name="validator";

	public SizeConstraint function init(){
		setClazz(this);
		setConstraintName("VALIDATOR");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
 
		if( !isValid("string",arguments.constraintParameter) || find(".",constraintParameter) == 0 ) {
			throw(
				type="VALIDATOR_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint validator was not a string or was not in the full dot notation path."
			);
		}
		
		setValidator(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){
		var method = listLast(getValidator(),".");
		var clazz = replaceNoCase(getValidator(),'.' & method,"");
		var instance = createObject(clazz);
		var result = evaluate("instance.#method#('#evaluate("target.get#property.name#()")#')");

		if( !isValid("boolean",result) ){
			throw();
		} else {
			return result;
		}

		return valid;
	}

}
