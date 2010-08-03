component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.VariableNameValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value="firstName"};
		assertTrue(validator.isValid(prop));
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value="._firstname"};
		assertFalse(validator.isValid(prop));
	}

	public void function testBlankReturnsTrue(){
		var prop = {value=""};
		assertTrue(validator.isValid(prop));
	}
	
}