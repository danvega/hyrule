import hyrule.system.core.constraint.RangeConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		rangeConstraint = new RangeConstraint();
		user = new User();
	}
	
	public void function testStringRangeReturnsTrue(){
		rangeConstraint.setConstraintParameter("1,2");
		assertTrue(rangeConstraint.validate(user,"state","OH"));
	}	

	public void function testStringRangeReturnsFalse(){
		rangeConstraint.setConstraintParameter("1,2");
		assertFalse(rangeConstraint.validate(user,"state","OHIO"));
	}	
	
	public void function testNumericRangeReturnsTrue(){
		rangeConstraint.setConstraintParameter("1,5");
		assertTrue(rangeConstraint.validate(user,"age",3));
	}

	public void function testNumericRangeReturnsFalse(){
		rangeConstraint.setConstraintParameter("1,5");
		assertFalse(rangeConstraint.validate(user,"age",10));
	}

	public void function testDateRangeReturnsTrue(){
		rangeConstraint.setConstraintParameter("1/1/2011,1/28/2011");
		assertTrue(rangeConstraint.validate(user,"bday","1/15/2011"));
	}

	public void function testDateRangeReturnsFalse(){
		rangeConstraint.setConstraintParameter("1/1/2011,1/28/2011");
		assertFalse(rangeConstraint.validate(user,"bday","2/15/2011"));
	}
	
	/**
	 * @mxunit:expectedException RANGE_CONSTRAINT.NOT_SIMPLE_VALUE
	 */
	public void function testNonSimpleValueConstraintParameterThrowsError() {
		rangeConstraint.setConstraintParameter([]);
	}

	/**
	 * @mxunit:expectedException RANGE_CONSTRAINT.INVALID_LIST
	 */
	public void function testInvalidListConstraintParameterThrowsError() {
		rangeConstraint.setConstraintParameter(1);
	}

}