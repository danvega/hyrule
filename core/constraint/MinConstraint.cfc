component extends="AbstractConstraint" accessors="true" {

	property name="min" type="numeric";

	public MinConstraint function init(){
		setClazz(this);
		setConstraintName("MIN");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isNumeric(arguments.constraintParameter) ){
			throw(
				type="ConstrainedProperty.MIN_CONSTRAINT",
				message="Paramater for constraint min was not of type number."
			);
		}
		
		setMin(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		if( value >=  min ){
			return true;
		}
		return false;
	}

}
