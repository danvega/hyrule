component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.BooleanValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value=true};
		var result = validator.isValid(prop);
		assertTrue(result);
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value="HelloWorld"};
		var result = validator.isValid(prop);
		assertFalse(result);
	}
	
}