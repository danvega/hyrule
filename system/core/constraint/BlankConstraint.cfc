component extends="AbstractConstraint" accessors="true" {

	property name="blank" type="boolean";

	public BlankConstraint function init(){
		setClazz(this);
		setConstraintName("BLANK");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="BLANK_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint blank was not of type boolean"
			);
		}
		
		setBlank(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){		
		if( isSimpleValue(arguments.value) ) {
			if( !getBlank()) {
				if(len(trim(value)) > 0){
					return true;
				}
			} else {
				// blank was true
				if(!len(trim(value))){
					return true;
				} 
			}
		}
		return false;
	}

}
