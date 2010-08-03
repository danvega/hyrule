component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.BinaryValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value=toBinary(toBase64("HelloWorld"))};
		var result = validator.isValid(prop);
		assertTrue(result);
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value="HelloWorld"};
		var result = validator.isValid(prop);
		assertFalse(result);
	}
	
}