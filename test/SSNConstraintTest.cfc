import hyrule.system.core.constraint.SSNConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		ssnConstraint = new SSNConstraint();
		user = new model.user();
	}
	
	public void function testValidSSNReturnsTrue(){
		ssnConstraint.setConstraintParameter(true);
		assertTrue(ssnConstraint.validate(user,"ssn","517-43-0924"));
	}
	
	public void function testInValidSSNReturnsFalse(){
		ssnConstraint.setConstraintParameter(true);
		assertFalse(ssnConstraint.validate(user,"ssn","0924"));
	}
	
	/**
	 * @mxunit:expectedException SSN_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonSimpleTypeConstraintParameterThrowsError() {
		ssnConstraint.setConstraintParameter([]);
	}
}