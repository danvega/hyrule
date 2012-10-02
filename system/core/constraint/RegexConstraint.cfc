component extends="AbstractConstraint" accessors="true" {

	property name="pattern" type="string";

	public RegexConstraint function init(){
		setClazz(this);
		setConstraintName("REGEX");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( isNull(arguments.constraintParameter) ){
			throw(
				type="REGEX_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint pattern was not of type string"
			);
		}

		setPattern(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		// no point in performing regex on an empty string
		if( !len(arguments.value) || isValid("regex",arguments.value,getPattern()) ){
			return true;
		}
		return false;
	}
}
