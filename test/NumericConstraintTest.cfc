import hyrule.system.core.constraint.NumericConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		numericConstraint = new NumericConstraint();
		user = new model.user();
	}
	
	public void function testValidNumberReturnsTrue(){
		numericConstraint.setConstraintParameter(true);
		assertTrue(numericConstraint.validate(user,"age","33"));
	}

	public void function testInValidNumberReturnsFalse(){
		numericConstraint.setConstraintParameter(true);
		assertFalse(numericConstraint.validate(user,"age","abc"));
	}
	
}