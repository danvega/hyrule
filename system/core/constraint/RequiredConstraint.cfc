component extends="AbstractConstraint" accessors="true" {

	property name="required" type="boolean";

	public RequiredConstraint function init(){
		setClazz(this);
		setConstraintName("REQUIRED");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="REQUIRED_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint required was not of type boolean"
			);
		}
		
		setRequired(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){		
		if( isSimpleValue(arguments.value) ) {
			
			if( getRequired() ) {
				if(len(trim(value)) > 0){
					return true;
				} else {
					return false;
				}
			}

		}
		return false;
	}

}
