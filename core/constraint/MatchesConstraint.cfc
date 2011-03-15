component extends="AbstractConstraint" accessors="true" {

	property name="matches" type="string";

	public MatchesConstraint function init(){
		setClazz(this);
		setConstraintName("MATCHES");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("string",arguments.constraintParameter) ){
			throw(
				type="ConstrainedProperty.MATCHES_CONSTRAINT",
				message="Paramater for constraint matches was not of type string"
			);
		}
		
		setMatches(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		if( arrayLen(reMatchNoCase(getMatches(),value)) ){
			return true;
		}
		return false;
	}

}
