component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.UUIDValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value=createUUID()};
		var result = validator.isValid(prop);
		assertTrue(result);
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value="NOT_A_GUID"};
		var result = validator.isValid(prop);
		assertFalse(result);
	}
	
	public void function testBlankReturnsTrue(){
		var prop = {value=""};
		assertTrue(validator.isValid(prop));
	}	
	
}