component extends="AbstractConstraint" accessors="true" {

	property name="max" type="numeric";

	public MaxConstraint function init(){
		setClazz(this);
		setConstraintName("MAX");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValidConstraintParameter(arguments.constraintParameter) ){
			throw(
				type="MAX_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint max was not a valid type."
			);
		}
		
		setMax(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){			
		if( value <=  max){
			return true;
		}
		return false;
	}
		
	/**
	 * override setter to account for special variables
	 */
	public void function setMax(any max){
		if( !isSpecialVar(max) ){
			variables.max = arguments.max;
		} else {
			variables.max = getSpecialVar(max);
		}
	}
	
	// PRIVATE METHODS
	private boolean function isValidConstraintParameter(any param){
		if( isSimpleValue(param) && (isNumeric(param) || isValid("date",param) || isSpecialVar(param)) ){
			return true;
		}
		return false;
	}
	
}
