import hyrule.system.core.constraint.requiredConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		requiredConstraintConstraint = new requiredConstraintConstraint();
		user = new model.user();
	}
	
	public void function testBlankFalseReturnsTrue(){
		requiredConstraint.setConstraintParameter(false);
		assertTrue(requiredConstraint.validate(user,"firstName","Dan"));
	}

	public void function testBlankFalseReturnsFalse(){
		requiredConstraint.setConstraintParameter(false);
		assertFalse(requiredConstraint.validate(user,"firstName",""));
	}

	public void function testBlankTrueReturnsTrue(){
		requiredConstraint.setConstraintParameter(true);
		assertTrue(requiredConstraint.validate(user,"firstname",""));
	}

	public void function testBlankTrueReturnsFalse(){
		requiredConstraint.setConstraintParameter(true);
		assertFalse(requiredConstraint.validate(user,"firstname","Dan"));
	}
	
	/**
	 * @mxunit:expectedException REQUIRED_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		requiredConstraint.setConstraintParameter('str');
	}
}