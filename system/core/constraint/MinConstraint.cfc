component extends="AbstractConstraint" accessors="true" {

	property name="min" type="numeric";

	public MinConstraint function init(){
		setClazz(this);
		setConstraintName("MIN");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValidConstraintParameter(arguments.constraintParameter) ){
			throw(
				type="MIN_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint min was not of type number."
			);
		}

		setMin(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		if( isNumeric(value) || isValid("date",value) ){
			return value >= getMin();
		}  else {
			return len(value) >= getMin();
		}

		return false;
	}

	/**
	 * override setter to account for special variables
	 */
	public void function setMin(any min){
		if( !isSpecialVar(min) ){
			variables.min = arguments.min;
		} else {
			variables.min = getSpecialVar(min);
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
