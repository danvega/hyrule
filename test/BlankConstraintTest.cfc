component extends="mxunit.framework.TestCase" {

	public void function setup(){
		blankConstraint = new hyrule.core.constraint.BlankConstraint();
		user = new model.user();
	}
	
	public void function testBlankFalseReturnsTrue(){
		blankConstraint.setConstraintParameter(false);
		assertTrue(blankConstraint.validate(user,"firstName","Dan"));
	}

	public void function testBlankFalseReturnsFalse(){
		blankConstraint.setConstraintParameter(false);
		assertFalse(blankConstraint.validate(user,"firstName",""));
	}

	public void function testBlankTrueReturnsTrue(){
		blankConstraint.setConstraintParameter(true);
		assertTrue(blankConstraint.validate(user,"firstname",""));
	}

	public void function testBlankTrueReturnsFalse(){
		blankConstraint.setConstraintParameter(true);
		assertFalse(blankConstraint.validate(user,"firstname","Dan"));
	}
	
	/**
	 * @mxunit:expectedException ConstrainedProperty.BLANK_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		blankConstraint.setConstraintParameter('str');
	}
}