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

	public void function testMinStringReturnsTrue(){
		minConstraint.setConstraintParameter(5);
		assertTrue(minConstraint.validate(user,"name","Daniel"));
	}

	public void function testMinStringReturnsFalse(){
		minConstraint.setConstraintParameter(5);
		assertFalse(minConstraint.validate(user,"name","Dan"));
	}

	public void function testMinDateReturnsTrue(){
		minConstraint.setConstraintParameter(now());
		assertTrue(minConstraint.validate(user,"dob","10/10/2013"));
	}

	public void function testMinDateReturnsFalse(){
		minConstraint.setConstraintParameter(now());
		assertFalse(minConstraint.validate(user,"age","10/10/2011"));
	}

	public void function testMinSpecialVarNowReturnsTrue(){
		minConstraint.setConstraintParameter("$now");
		assertTrue(minConstraint.validate(user,"age","02/05/2013"));
	}

	public void function testMinSpecialVarNowReturnsFalse(){
		minConstraint.setConstraintParameter("$now");
		assertFalse(minConstraint.validate(user,"age","02/10/2010"));
	}

	/**
	 * @mxunit:expectedException MIN_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		minConstraint.setConstraintParameter([]);
	}
}