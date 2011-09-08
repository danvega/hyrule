import hyrule.system.core.constraint.MinConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		minConstraint = new MinConstraint();
		user = new User();
	}
	
	public void function testMinNumberReturnsTrue(){
		minConstraint.setConstraintParameter(18);
		assertTrue(minConstraint.validate(user,"age",21));
	}
	
	public void function testMinNumberReturnsFalse(){
		minConstraint.setConstraintParameter(18);
		assertFalse(minConstraint.validate(user,"age",17));
	}

	public void function testMinDateReturnsTrue(){
		minConstraint.setConstraintParameter(now());
		assertTrue(minConstraint.validate(user,"someprop","10/10/2021"));
	}
	
	public void function testMinDateReturnsFalse(){
		minConstraint.setConstraintParameter(now());
		assertFalse(minConstraint.validate(user,"someprop","10/10/2001"));
	}
	
	public void function testMinSpecialVarNowReturnsTrue(){
		minConstraint.setConstraintParameter("$now");
		assertTrue(minConstraint.validate(user,"someprop","02/05/2015"));
	}	

	public void function testMinSpecialVarNowReturnsFalse(){
		minConstraint.setConstraintParameter("$now");
		assertFalse(minConstraint.validate(user,"someprop","02/10/2005"));
	}
	
	/**
	 * @mxunit:expectedException MIN_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		minConstraint.setConstraintParameter([]);
	}	
}