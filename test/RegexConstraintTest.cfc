import hyrule.system.core.constraint.RegexConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		regexConstraint = new RegexConstraint();
		user = new model.user();
	}

	public void function testRegexReturnsTrue(){
		regexConstraint.setConstraintParameter("^[A-Za-z].*");
		assertTrue(regexConstraint.validate(user,"firstName","Dan"));
	}

	public void function testRegexReturnsFalse(){
		regexConstraint.setConstraintParameter("^[A-Za-z].*");
		assertFalse(regexConstraint.validate(user,"firstName",99));
	}

	/**
	 * @mxunit:expectedException REGEX_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonStringConstraintParameterThrowsError() {
		regexConstraint.setConstraintParameter();
	}
}