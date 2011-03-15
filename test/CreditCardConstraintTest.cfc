component extends="mxunit.framework.TestCase" {

	public void function setup(){
		creditCardConstraint = new hyrule.core.constraint.CreditCardConstraint();
		user = new model.user();
	}
	
	public void function testCreditCardTrueReturnsTrue(){
		creditCardConstraint.setConstraintParameter(true);
		assertTrue(creditCardConstraint.validate(user,"creditcard","4111111111111111"));
	}

	public void function testCreditCardTrueReturnsFalse(){
		creditCardConstraint.setConstraintParameter(true);
		assertFalse(creditCardConstraint.validate(user,"creditcard","1234567890"));
	}

	public void function testCreditCardFalseReturnsTrue(){
		creditCardConstraint.setConstraintParameter(false);
		assertTrue(creditCardConstraint.validate(user,"creditcard","1234567890"));
	}

	public void function testCreditCardFalseReturnsFalse(){
		creditCardConstraint.setConstraintParameter(false);
		assertFalse(creditCardConstraint.validate(user,"creditcard","4111111111111111"));
	}
		
		
	/**
	 * @param creditCard (boolean)
	 * @mxunit:expectedException ConstrainedProperty.CREDIT_CARD_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		creditCardConstraint.setConstraintParameter('str');
	}
	
}