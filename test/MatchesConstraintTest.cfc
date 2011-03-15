component extends="mxunit.framework.TestCase" {

	public void function setup(){
		matchesConstraint = new hyrule.core.constraint.matchesConstraint();
		user = new model.user();
	}
	
	public void function testMatchesReturnsTrue(){
		matchesConstraint.setConstraintParameter("\d");
		assertTrue(matchesConstraint.validate(user,"age",32));
	}
	
	public void function testMatchesReturnsFalse(){
		matchesConstraint.setConstraintParameter("\d");
		assertFalse(matchesConstraint.validate(user,"age","abc"));		
	}
	
	/**
	 * We are passing 32 as a string but its still a number!
	 */
	public void function testDynamicLanguagesRockReturnsTrue(){
		matchesConstraint.setConstraintParameter("\d");
		assertTrue(matchesConstraint.validate(user,"age","32"));		
	}
		
	/**
	 * @mxunit:expectedException ConstrainedProperty.MATCHES_CONSTRAINT
	 */
	public void function testNonBooleanConstraintParameterThrowsError() {
		matchesConstraint.setConstraintParameter({});
	}
	
}