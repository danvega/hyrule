component extends="AbstractConstraint" accessors="true" {

	property name="sameas" type="string";

	public SameAsConstraint function init(){
		setClazz(this);
		setConstraintName("SAMEAS");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("string",arguments.constraintParameter) ){
			throw(
				type="SAMEAS_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint name was not of type string"
			);
		}

		setSameAs(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){

		var compareValue = evaluate("arguments.target.get#getSameAs()#()");

		if( !isNull(arguments.value) AND compare(value, compareValue) EQ 0 ){
			return true;
		}

		return false;
	}

}
