component extends="AbstractConstraint" accessors="true" {

	property name="max" type="numeric";

	public MaxConstraint function init(){
		setClazz(this);
		setConstraintName("MAX");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isNumeric(arguments.constraintParameter) ){
			throw(
				type="ConstrainedProperty.MAX_CONSTRAINT",
				message="Paramater for constraint max was not of type number."
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

}
