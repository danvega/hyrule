component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.LowerCaseValidator();
	}
	
	public void function testLowerCaseReturnsTrue(){
		var prop = {value="coldfusion"};
		assertTrue(validator.isValid(prop));	
	}

	public void function testLowerCaseReturnsFalse(){
		var prop = {value="COLDFUSION"};
		assertFalse(validator.isValid(prop));
	}
	
	public void function testNotSimpleValueReturnsFalse(){
		var prop = {value=[]};
		assertFalse(validator.isValid(prop));		
	}

	public void function testBlankReturnsTrue(){
		var prop = {value=""};
		assertTrue(validator.isValid(prop));
	}
	
}