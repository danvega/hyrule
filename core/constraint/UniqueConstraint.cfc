component extends="AbstractConstraint" accessors="true" {

	property name="unique" type="boolean";

	public UniqueConstraint function init(){
		setClazz(this);
		setConstraintName("UNIQUE");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="ConstrainedProperty.UNIQUE_CONSTRAINT",
				message="Paramater for constraint unique was not of type boolean"
			);
		}
		
		setUnique(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){		
		var meta = getMetaData(target);
		var domain = listLast(meta.name,'.');
		var matches = ormExecuteQuery("from #domain# where #property# = :val",{val=value});
				
		if( getUnique() && arrayLen(matches) > 0){
				return false;
		}
		
		return true;
	}

}
