import hyrule.core.constraint.MaxConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		maxConstraint = new MaxConstraint();
		user = new User();
	}
	
	public void function testMaxReturnsTrue(){
		maxConstraint.setConstraintParameter(18);
		assertTrue(maxConstraint.validate(user,"age",17));
	}
	
	public void function testMaxReturnsFalse(){
		maxConstraint.setConstraintParameter(18);
		assertFalse(maxConstraint.validate(user,"age",21));
	}
	
	/**
	 * @mxunit:expectedException ConstrainedProperty.MAX_CONSTRAINT
	 */
	public void function testNonNumberConstraintParameterThrowsError() {
		maxConstraint.setConstraintParameter([]);
	}	
}