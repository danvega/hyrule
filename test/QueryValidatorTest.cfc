component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.QueryValidator();
	}
	
	public void function isValidQueryReturnsTrue(){
		var q = queryNew("UserId,First,Last");
		var prop = {value=q};
		assertTrue(validator.isValid(prop));
	}

	public void function isValidQueryReturnsFalse(){
		var prop = {value="I_AM_NOT_A_QUERY"};
		assertFalse(validator.isValid(prop));
	}

}