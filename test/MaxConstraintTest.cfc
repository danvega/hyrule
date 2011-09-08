import hyrule.system.core.constraint.MaxConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		maxConstraint = new MaxConstraint();
		user = new User();
	}
	
	public void function testMaxNumberReturnsTrue(){
		maxConstraint.setConstraintParameter(18);
		assertTrue(maxConstraint.validate(user,"age",17));
	}
	
	public void function testMaxNumberReturnsFalse(){
		maxConstraint.setConstraintParameter(18);
		assertFalse(maxConstraint.validate(user,"age",21));
	}

	public void function testMaxDateReturnsTrue(){
		maxConstraint.setConstraintParameter(now());
		assertTrue(maxConstraint.validate(user,"dob","10/10/2001"));
	}
	
	public void function testMaxDateReturnsFalse(){
		maxConstraint.setConstraintParameter(now());
		assertFalse(maxConstraint.validate(user,"age","10/10/2021"));
	}
	
	public void function testMaxSpecialVarNowReturnsTrue(){
		maxConstraint.setConstraintParameter("$now");
		assertTrue(maxConstraint.validate(user,"age","02/05/2005"));
	}	

	public void function testMaxSpecialVarNowReturnsFalse(){
		maxConstraint.setConstraintParameter("$now");
		assertFalse(maxConstraint.validate(user,"age","02/10/2025"));
	}
	
	/**
	 * @mxunit:expectedException MAX_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		maxConstraint.setConstraintParameter([]);
	}	
}