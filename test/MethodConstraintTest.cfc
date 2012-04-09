import hyrule.system.core.constraint.MethodConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		methodConstraint = new MethodConstraint();
		user = new User();
	}

	public void function testMethodReturnsTrue(){
		methodConstraint.setConstraintParameter("isUsernameCool");
		user.setUsername("jonnyflynn");
		assertTrue(methodConstraint.validate(user,"username","jonnyflynn"));
	}

	public void function testMethodReturnsFalse(){
		methodConstraint.setConstraintParameter("isUsernameCool");
		user.setUsername("mrsmith");
		assertFalse(methodConstraint.validate(user,"username","mrsmith"));
	}

	/**
	 * @mxunit:expectedException METHOD_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		methodConstraint.setConstraintParameter([]);
	}
}