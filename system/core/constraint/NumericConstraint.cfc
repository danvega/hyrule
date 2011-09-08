component extends="AbstractConstraint" accessors="true" {

	property name="number" type="boolean";

	public NumericConstraint function init(){
		setClazz(this);
		setConstraintName("NUMERIC");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){		
		setNumber(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		if(isValid("Numeric",value)){
			return true;
		}
		return false;
	}

}
