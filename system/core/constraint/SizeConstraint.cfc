component extends="AbstractConstraint" accessors="true" {

	property name="size";

	public SizeConstraint function init(){
		setClazz(this);
		setConstraintName("SIZE");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("string",arguments.constraintParameter) || !isValid("Regex",arguments.constraintParameter,"\d+\.\.(\-?\d)+")){
			throw(
				type="SIZE_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint size was not in the form of n..n where n is a valid number."
			);
		}
		
		setSize(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){				
		var min = listFirst(getSize(),'..');
		var max = listLast(getSize(),'..');
		
		if( isSimpleValue(value)){
			if( isNumeric(value) && (value >= min && value <= max) ){
				return true;
			} else {
				if( len(value) >= min && len(value) <= max ) {
					return true;
				}				
			}
		} else {
			// collection, array, obj
			if(max == -1){
				// there is no max
				if( isArray(value) && arrayLen(value) >= min){
					return true;
				}
				if( isStruct(value) && structCount(value) >= min){
					return true;
				}					
			} else {
				if( isArray(value) && ( arrayLen(value) >= min && arrayLen(value) <= max )){
					return true;
				}
				if( isStruct(value) && ( structCount(value) >= min && structCount(value) <= max ) ){
					return true;
				}				
			}	
				
		}
		
		return false;
	}

}
