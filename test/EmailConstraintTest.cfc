component extends="mxunit.framework.TestCase" {

	public void function setup(){
		emailConstraint = new hyrule.core.constraint.emailConstraint();
		user = new model.user();
	}
	
	public void function testEmailTrueReturnsTrue(){
		emailConstraint.setConstraintParameter(true);
		assertTrue(emailConstraint.validate(user,"email","youremail@gmail.com"));
	}
	
	public void function testEmailTrueReturnsFalse(){
		emailConstraint.setConstraintParameter(true);
		assertFalse(emailConstraint.validate(user,"email","youremail"));
	}
	
	/**
	 * I make sure that an empty string or whitespace fails
	 */
	public void function testBlankEmailReturnsFalse(){
		emailConstraint.setConstraintParameter(true);
		assertFalse(emailConstraint.validate(user,"email"," "));
	}
	
	public void function testEmailFalseReturnsTrue(){
		emailConstraint.setConstraintParameter(false);
		assertTrue(emailConstraint.validate(user,"email","youremail"));		
	}
	
	public void function testEmailFalseReturnsFalse(){
		emailConstraint.setConstraintParameter(false);
		assertFalse(emailConstraint.validate(user,"email","youremail@gmail.com"));		
	}
		
	/**
	 * @mxunit:expectedException ConstrainedProperty.EMAIL_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		emailConstraint.setConstraintParameter('str');
	}
	
}