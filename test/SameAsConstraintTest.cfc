import hyrule.system.core.constraint.SameAsConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		sameasConstraint = new SameAsConstraint();
		user = new User();
	}

	public void function testConstraintReturnsTrue(){
		sameasConstraint.setConstraintParameter("confirmPassword");
		user.setConfirmPassword("abc123");
		assertTrue(sameasConstraint.validate(user,"password","abc123"));
	}

	// case matters, if case doesn't matter use sameAsNoCase
	public void function testConstraintReturnsFalse(){
		sameasConstraint.setConstraintParameter("confirmPassword");
		user.setConfirmPassword("abc123");
		assertFalse(sameasConstraint.validate(user,"password","ABC123"));
	}

	/**
	 * @mxunit:expectedException SAMEAS_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		sameasConstraint.setConstraintParameter([]);
	}
}