component extends="AbstractConstraint" accessors="true" {

	property name="inList";

	public InListConstraint function init(){
		setClazz(this);
		setConstraintName("InList");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("string",arguments.constraintParameter) ){
			throw(
				type="ConstrainedProperty.INLIST_CONSTRAINT",
				message="Paramater for constraint in list was not of type string"
			);
		}
		
		setInList(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){		
		if( listFindNoCase(getInList(),value) ) {
			return true;
		}
		return false;
	}

}
