import hyrule.system.core.constraint.ValidatorConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validatorConstraint = new ValidatorConstraint();
		user = new User();
	}

	public void function testCustomValidatorReturnsTrue(){
		validatorConstraint.setConstraintParameter("hyrule.test.model.userService.isUsernameCool");
		assertTrue(validatorConstraint.validate(user,"username","jonnyflynn"));
	}

	public void function testCustomValidatorReturnsFalse(){
		validatorConstraint.setConstraintParameter("hyrule.test.model.userService.isUsernameCool");
		assertFalse(validatorConstraint.validate(user,"username","mrsmith"));
	}

	/**
	 * @mxunit:expectedException VALIDATOR_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		validatorConstraint.setConstraintParameter([]);
	}
}