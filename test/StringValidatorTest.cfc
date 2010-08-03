component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.StringValidator();
	}

	public void function testIsValidReturnsTrue(){
		var prop = {value="Hello"};
		assertTrue(validator.isValid(prop));
	}

	public void function testIsValidReturnsFalse(){
		var prop = {value=[]};
		assertFalse(validator.isValid(prop));
	}

}