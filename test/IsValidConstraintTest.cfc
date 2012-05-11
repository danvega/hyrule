import hyrule.system.core.constraint.IsValidConstraint;

component extends="mxunit.framework.TestCase" {

	public void function setup(){
		isValidConstraint = new IsValidConstraint();
		user = new model.user();
	}
	
	// if someone passes a blank value validation for any type should pass
	public void function testBlankReturnsTrue(){
		isValidConstraint.setConstraintParameter("email");
		assertTrue(isValidConstraint.validate(user,"email",""));
	}

	// IsValid any
	public void function testAnyReturnsTrue(){
		isValidConstraint.setConstraintParameter("any");
		assertTrue(isValidConstraint.validate(user,"username","dan"));
	}

	/*
	public void function testAnyReturnsFalse(){
		var q = queryNew("id,username");
		isValidConstraint.setConstraintParameter("any");
		assertFalse(isValidConstraint.validate(user,"list",q));
	}
	*/

	// IsValid Array
	public void function testArrayReturnsTrue(){
		isValidConstraint.setConstraintParameter("array");
		assertTrue(isvalidConstraint.validate(user,"pets",[]));
	}

	public void function testArrayReturnsFalse(){
		isValidConstraint.setConstraintParameter("array");
		assertFalse(isvalidConstraint.validate(user,"pets",{}));
	}

	// IsValid Binary
	public void function testBinaryReturnsTrue(){
		isValidConstraint.setConstraintParameter("binary");
		assertTrue(isvalidConstraint.validate(user,"name",toBinary(toBase64("dan"))));
	}

	public void function testBinaryReturnsFalse(){
		isValidConstraint.setConstraintParameter("binary");
		assertFalse(isvalidConstraint.validate(user,"name","dan"));
	}

	// IsValid Boolean
	public void function testBooleanReturnsTrue(){
		isValidConstraint.setConstraintParameter("boolean");
		assertTrue(isvalidConstraint.validate(user,"canvote",true));
	}

	public void function testBooleanReturnsFalse(){
		isValidConstraint.setConstraintParameter("boolean");
		assertFalse(isvalidConstraint.validate(user,"canvote","yeshecan"));
	}

	// IsValid Component
	public void function testComponentReturnsTrue(){
		isValidConstraint.setConstraintParameter("component");
		assertTrue(isvalidConstraint.validate(user,"user",user));
	}

	public void function testComponentReturnsFalse(){
		isValidConstraint.setConstraintParameter("component");
		assertFalse(isvalidConstraint.validate(user,"user","user"));
	}

	// IsValid CreditCard
	public void function testCreditCardReturnsTrue(){
		isValidConstraint.setConstraintParameter("creditcard");
		assertTrue(isvalidConstraint.validate(user,"card","4111111111111111"));
	}

	public void function testCreditCardReturnsFalse(){
		isValidConstraint.setConstraintParameter("creditcard");
		assertFalse(isvalidConstraint.validate(user,"card","4234"));
	}

	// IsValid Date
	public void function testDateReturnsTrue(){
		isValidConstraint.setConstraintParameter("date");
		assertTrue(isvalidConstraint.validate(user,"today",now()));
	}

	public void function testDateReturnsFalse(){
		isValidConstraint.setConstraintParameter("date");
		assertFalse(isvalidConstraint.validate(user,"today","now"));
	}

	// IsValid Email
	public void function testEmailReturnsTrue(){
		isValidConstraint.setConstraintParameter("email");
		assertTrue(isvalidConstraint.validate(user,"email","danvega@googlemail.com"));
	}

	public void function testEmailReturnsFalse(){
		isValidConstraint.setConstraintParameter("email");
		assertFalse(isvalidConstraint.validate(user,"email","danvega@googlemail"));
	}

	// IsValid EuroDate
	public void function testEuroDateReturnsTrue(){
		isValidConstraint.setConstraintParameter("eurodate");
		assertTrue(isvalidConstraint.validate(user,"dob","21 Aug 1978"));
	}

	public void function testEuroDateReturnsFalse(){
		isValidConstraint.setConstraintParameter("eurodate");
		assertFalse(isvalidConstraint.validate(user,"dob","33 years ago"));
	}

	// IsValid Float
	public void function testFloatReturnsTrue(){
		isValidConstraint.setConstraintParameter("float");
		assertTrue(isvalidConstraint.validate(user,"salary","10.00"));
	}

	public void function testFloatReturnsFalse(){
		isValidConstraint.setConstraintParameter("float");
		assertFalse(isvalidConstraint.validate(user,"salary","10 bucks"));
	}

	// IsValid GUID
	public void function testGUIDReturnsTrue(){
		isValidConstraint.setConstraintParameter("guid");
		assertTrue(isvalidConstraint.validate(user,"id","25892e17-80f6-415f-9c65-7395632f0223"));
	}

	public void function testGUIDReturnsFalse(){
		isValidConstraint.setConstraintParameter("guid");
		assertFalse(isvalidConstraint.validate(user,"id","1234-5678"));
	}

	// IsValid Integer
	public void function testIntegerReturnsTrue(){
		isValidConstraint.setConstraintParameter("integer");
		assertTrue(isvalidConstraint.validate(user,"age","33"));
	}

	public void function testIntegerReturnsFalse(){
		isValidConstraint.setConstraintParameter("integer");
		assertFalse(isvalidConstraint.validate(user,"age","Thirty Three"));
	}

	// Query
	public void function testQueryReturnsTrue(){
		var q = queryNew("id,username");
		isValidConstraint.setConstraintParameter("query");
		assertTrue(isvalidConstraint.validate(user,"list",q));
	}

	public void function testQueryReturnsFalse(){
		isValidConstraint.setConstraintParameter("query");
		assertFalse(isvalidConstraint.validate(user,"list","1,2,3"));
	}

	// IsValid SSN
	public void function testSSNReturnsTrue(){
		isValidConstraint.setConstraintParameter("ssn");
		assertTrue(isvalidConstraint.validate(user,"ssn","517-12-3456"));
	}

	public void function testSSNReturnsFalse(){
		isValidConstraint.setConstraintParameter("ssn");
		assertFalse(isvalidConstraint.validate(user,"ssn","517-12"));
	}

	// IsValid string
	public void function testStringReturnsTrue(){
		isValidConstraint.setConstraintParameter("string");
		assertTrue(isvalidConstraint.validate(user,"message","Hello World"));
	}

	public void function testStringReturnsFalse(){
		isValidConstraint.setConstraintParameter("string");
		assertFalse(isvalidConstraint.validate(user,"message",[]));
	}

	// IsValid struct
	public void function testStructReturnsTrue(){
		isValidConstraint.setConstraintParameter("struct");
		assertTrue(isvalidConstraint.validate(user,"details",{first="Dan",last="Vega"}));
	}

	public void function testStructReturnsFalse(){
		isValidConstraint.setConstraintParameter("string");
		assertFalse(isvalidConstraint.validate(user,"details",[]));
	}

	// IsValid telephone
	public void function testTelephoneReturnsTrue(){
		isValidConstraint.setConstraintParameter("telephone");
		assertTrue(isvalidConstraint.validate(user,"phone","216-555-1234"));
	}

	public void function testTelephoneReturnsFalse(){
		isValidConstraint.setConstraintParameter("telephone");
		assertFalse(isvalidConstraint.validate(user,"phone","123456"));
	}

	// IsValid url
	public void function testURLReturnsTrue(){
		isValidConstraint.setConstraintParameter("url");
		assertTrue(isvalidConstraint.validate(user,"website","http://www.danvega.org"));
	}

	public void function testURLReturnsFalse(){
		isValidConstraint.setConstraintParameter("url");
		assertFalse(isvalidConstraint.validate(user,"webpage","www.danvega"));
	}

	// IsValid uuid
	public void function testUUIDReturnsTrue(){
		isValidConstraint.setConstraintParameter("uuid");
		assertTrue(isvalidConstraint.validate(user,"id",createUUID()));
	}

	public void function testUUIDReturnsFalse(){
		isValidConstraint.setConstraintParameter("uuid");
		assertFalse(isvalidConstraint.validate(user,"id","12345"));
	}
	// IsValid usdate
	public void function testUSDateReturnsTrue(){
		isValidConstraint.setConstraintParameter("usdate");
		assertTrue(isvalidConstraint.validate(user,"dob","08/21/1978"));
	}

	public void function testUSDateReturnsFalse(){
		isValidConstraint.setConstraintParameter("usdate");
		assertFalse(isvalidConstraint.validate(user,"dob","33 years ago"));
	}

	// IsValid variableName
	public void function testVariablenNameReturnsTrue(){
		isValidConstraint.setConstraintParameter("variablename");
		assertTrue(isvalidConstraint.validate(user,"x","userName"));
	}

	public void function testVariableNameReturnsFalse(){
		isValidConstraint.setConstraintParameter("variableName");
		assertFalse(isvalidConstraint.validate(user,"x","%userName"));
	}

	// IsVaid zipcode
	public void function test5DigitZipReturnsTrue(){
		isValidConstraint.setConstraintParameter("zipcode");
		assertTrue(isvalidConstraint.validate(user,"zip","44107"));
	}

	public void function test9DigitZipReturnsTrue(){
		isValidConstraint.setConstraintParameter("zipcode");
		assertTrue(isvalidConstraint.validate(user,"zip","44107-1234"));
	}

	public void function testZipReturnsFalse(){
		isValidConstraint.setConstraintParameter("zipcode");
		assertFalse(isvalidConstraint.validate(user,"zip","1234"));
	}

	/**
	 * @mxunit:expectedException ISVALID_CONSTRAINT.INVALID_CONSTRAINT
	 */
	public void function testNonValidConstraintParameterThrowsError() {
		isValidConstraint.setConstraintParameter([]);
	}

}