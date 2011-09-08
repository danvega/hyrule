component extends="AbstractConstraint" accessors="true" {

	property name="ssn" type="boolean";

	public SSNConstraint function init(){
		setClazz(this);
		setConstraintName("SSN");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isSimpleValue(arguments.constraintParameter) ){
			throw(
				type="SSN_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint ssn was not a simple type"
			);
		}
		
		setSSN(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){		
		if( isValid("social_security_number",value) ){
			return true;
		}
		return false;
	}

}
