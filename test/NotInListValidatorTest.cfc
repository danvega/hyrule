component extends="mxunit.framework.TestCase" {

	public void function setup(){
		validator = new hyrule.rules.NotInListValidator();
	}	

	public void function testNotInListReturnsTrue(){
		var prop = {value="ColdFusion",notInList="Apples,Oranges,Bananas"};
		var result = validator.isValid(prop);
		assertTrue(result);
	}

	public void function testNotInListReturnsFalse(){
		var prop = {value="Apples",notInlist="Apples,Oranges,Bananas"};
		var result = validator.isValid(prop);
		assertFalse(result);
	}

}