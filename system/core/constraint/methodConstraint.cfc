/**
 * methodConstraint
 *
 * @hint I am used when you want to call a method on the target to use
 *
 */
component extends="AbstractConstraint" accessors="true" {

	/**
	 * I am the method on the target object to use. I
	 *
	 * this.constraints = {
	 * 		email = {method="isNameFullName"}
	 * }
	 */
	property name="method";

	public methodConstraint function init(){
		setClazz(this);
		setConstraintName("METHOD");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){

		if( !isValid("string",arguments.constraintParameter)) {
			throw(
				type="METHOD_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint validator was not a string."
			);
		}

		setMethod(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		var result = evaluate("arguments.target.#getMethod()#()");

		if( !isValid("boolean",result) ){
			throw();
		} else {
			return result;
		}
	}
	
	//override the base function to inform the validator we don't auto pass the constrainst on NULL values
	public boolean function passOnNULL(){
		return false;
	}		

}
