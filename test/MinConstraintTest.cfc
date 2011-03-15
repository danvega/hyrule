import hyrule.core.constraint.MinConstraint;
import hyrule.test.model.User;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		minConstraint = new MinConstraint();
		user = new User();
	}
	
	public void function testMinReturnsTrue(){
		minConstraint.setConstraintParameter(18);
		assertTrue(minConstraint.validate(user,"age",21));
	}
	
	public void function testMinReturnsFalse(){
		minConstraint.setConstraintParameter(18);
		assertFalse(minConstraint.validate(user,"age",17));
	}
	
	/**
	 * @mxunit:expectedException ConstrainedProperty.MIN_CONSTRAINT
	 */
	public void function testNonNumberConstraintParameterThrowsError() {
		minConstraint.setConstraintParameter([]);
	}	
}