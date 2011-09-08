component extends="AbstractConstraint" accessors="true" {

	property name="email" type="boolean";

	public EmailConstraint function init(){
		setClazz(this);
		setConstraintName("EMAIL");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="EMAIL_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint email was not of type boolean"
			);
		}
		
		setEmail(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		if( isSimpleValue(arguments.value) ) {
			if( getEmail() ) {
				if(isValid("email",value)){
					return true;
				}
			} else {
				if(!isValid("email",value)){
					return true;
				}
			}
		}
		return false;
	}

}