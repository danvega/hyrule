import hyrule.system.core.constraint.DiscreteConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		discreteConstraint = new DiscreteConstraint();
		user = new model.user();
	}

	public void function testEqualsReturnsTrue(){
		discreteConstraint.setConstraintParameter("eq:33");
		assertTrue(discreteConstraint.validate(user,"age","33"));
	}

	public void function testEqualsReturnsFalse(){
		discreteConstraint.setConstraintParameter("eq:33");
		assertFalse(discreteConstraint.validate(user,"age","22"));
	}

	public void function testNotEqualsReturnsTrue(){
		discreteConstraint.setConstraintParameter("neq:33");
		assertTrue(discreteConstraint.validate(user,"age","18"));
	}

	public void function testNotEqualsReturnsFalse(){
		discreteConstraint.setConstraintParameter("neq:33");
		assertFalse(discreteConstraint.validate(user,"age","33"));
	}

	public void function testLessThanReturnsTrue(){
		discreteConstraint.setConstraintParameter("lt:33");
		assertTrue(discreteConstraint.validate(user,"age","18"));
	}

	public void function testLessThanReturnsFalse(){
		discreteConstraint.setConstraintParameter("lt:33");
		assertFalse(discreteConstraint.validate(user,"age","60"));
	}

	public void function testLessThanEqualReturnsTrue(){
		discreteConstraint.setConstraintParameter("lte:33");
		assertTrue(discreteConstraint.validate(user,"age","33"));
	}

	public void function testLessThanEqualReturnsFalse(){
		discreteConstraint.setConstraintParameter("lte:33");
		assertFalse(discreteConstraint.validate(user,"age","34"));
	}

	public void function testGreaterThanReturnsTrue(){
		discreteConstraint.setConstraintParameter("gt:33");
		assertTrue(discreteConstraint.validate(user,"age","35"));
	}

	public void function testGreaterThanReturnsFalse(){
		discreteConstraint.setConstraintParameter("gt:33");
		assertFalse(discreteConstraint.validate(user,"age","33"));
	}

	public void function testGreaterThanEqualReturnsTrue(){
		discreteConstraint.setConstraintParameter("gte:33");
		assertTrue(discreteConstraint.validate(user,"age","33"));
	}

	public void function testGreaterThanEqualReturnsFalse(){
		discreteConstraint.setConstraintParameter("gte:33");
		assertFalse(discreteConstraint.validate(user,"age","32"));
	}

	/**
	 * @mxunit:expectedException DISCRETE_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		discreteConstraint.setConstraintParameter('equals 10');
	}
}