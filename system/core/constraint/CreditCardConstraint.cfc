component extends="AbstractConstraint" accessors="true" {

	property name="creditCard" type="boolean";

	public CreditCardConstraint function init(){
		setClazz(this);
		setConstraintName("CREDITCARD");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="CREDIT_CARD_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint email was not of type boolean"
			);
		}
		
		setCreditCard(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		if( getCreditCard()){
			if(isValid("creditcard",value)){
				return true;
			}
		} else {
			if( !isValid("creditcard",value) ){
				return true;
			}
		}
		return false;
	}

}
