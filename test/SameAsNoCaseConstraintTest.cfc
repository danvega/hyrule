import hyrule.system.core.constraint.SameAsNoCaseConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		sameasNoCaseConstraint = new SameAsNoCaseConstraint();
		user = new User();
	}

	public void function testConstraintReturnsTrue(){
		sameasNoCaseConstraint.setConstraintParameter("confirmPassword");
		user.setConfirmPassword("ABC123");
		assertTrue(sameasNoCaseConstraint.validate(user,"password","abc123"));
	}

	public void function testConstraintReturnsFalse(){
		sameasNoCaseConstraint.setConstraintParameter("confirmPassword");
		user.setConfirmPassword("abc123");
		assertFalse(sameasNoCaseConstraint.validate(user,"password","ABC1234"));
	}

	/**
	 * @mxunit:expectedException SAMEASNOCASE_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		sameasNoCaseConstraint.setConstraintParameter([]);
	}
}