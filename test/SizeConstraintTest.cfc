/**
 * A valid constraint parameter looks like this 1..10
 * Valid tests on size are Numeric Range,String Length,Array Length,Struct Key Count 
 */
component extends="mxunit.framework.TestCase" {

	public void function setup(){
		sizeConstraint = new hyrule.core.constraint.sizeConstraint();
		user = new model.user();
	}
	
	// NUMERIC TESTS
	public void function testNumericSizeInRangeReturnsTrue(){
		sizeConstraint.setConstraintParameter("18..30");
		assertTrue(sizeConstraint.validate(user,"age",21));
	}
	
	public void function testNumericSizeInRangeReturnsFalse(){
		sizeConstraint.setConstraintParameter("18..30");
		assertFalse(sizeConstraint.validate(user,"age",45));
	}
	
	/**
	 * We want to make sure that if parameter equals min or max 
	 * that it still validates true because we test if n >= or n <=
	 */
	public void function testNumericSizeEqualsMinOrMaxReturnsTrue(){
		sizeConstraint.setConstraintParameter("18..30");
		assertTrue(sizeConstraint.validate(user,"age",18));		
	}
	
	// STRING TESTS
	public void function testStringSizeInRangeReturnsTrue(){
		sizeConstraint.setConstraintParameter("1..10");
		assertTrue(sizeConstraint.validate(user,"name","dan"));
	}
	
	public void function testStringSizeInRangeReturnsFalse(){
		sizeConstraint.setConstraintParameter("1..10");
		assertFalse(sizeConstraint.validate(user,"name","abcdefghijklmnopqrstuvwxyz"));
	}
	
	public void function testStringSizeEqualsMinOrMaxReturnsTrue(){
		sizeConstraint.setConstraintParameter("3..10");
		assertTrue(sizeConstraint.validate(user,"name","dan"));		
	}
	
	// ARRAY TESTS		
	public void function testArraySizeInRangeReturnsTrue(){
		sizeConstraint.setConstraintParameter("1..5");
		assertTrue(sizeConstraint.validate(user,"age",["one","two","three"]));
	}
	
	public void function testArraySizeInRangeReturnsFalse(){
		sizeConstraint.setConstraintParameter("1..3");
		assertFalse(sizeConstraint.validate(user,"age",["one","two","three","four"]));
	}	

	public void function testArraySizeEqualsMinOrMaxReturnsTrue(){
		sizeConstraint.setConstraintParameter("1..2");
		assertTrue(sizeConstraint.validate(user,"age",["one","two"]));
	}	
		
	/**
	 * We are expecting a string in the format of (\d+..\d+)
	 * 
	 * @mxunit:expectedException ConstrainedProperty.SIZE_CONSTRAINT
	 */
	public void function testNonSizeConstraintParameterThrowsError() {
		sizeConstraint.setConstraintParameter('1-10');
	}
	
}