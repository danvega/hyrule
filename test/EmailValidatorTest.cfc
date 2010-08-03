component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.EmailValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value="danvega@gmail.com"};
		var result = validator.isValid(prop);
		assertTrue(result);
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value="danvega@gmail"};
		var result = validator.isValid(prop);
		assertFalse(result);
	}
	
	public void function testBlankReturnsTrue(){
		var prop = {value=""};
		assertTrue(validator.isValid(prop));
	}
	
}