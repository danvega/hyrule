import hyrule.system.core.constraint.RequiredConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		requiredConstraint = new RequiredConstraint();
		user = new model.user();
	}

	public void function testRequiredPasses(){
		requiredConstraint.setConstraintParameter(true);
		assertTrue(requiredConstraint.validate(user,"firstName","Dan"));
	}

	public void function testRequiredFailes(){
		requiredConstraint.setConstraintParameter(true);
		assertFalse(requiredConstraint.validate(user,"firstName",""));
	}

	/**
	 * @mxunit:expectedException REQUIRED_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		requiredConstraint.setConstraintParameter('str');
	}
}