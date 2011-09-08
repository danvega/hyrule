component extends="AbstractConstraint" accessors="true" {

	property min;
	property max;

	public RangeConstraint function init(){
		setClazz(this);
		setConstraintName("RANGE");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		var valid_types = "";
		
		// string|date|numeric
		if( !isSimpleValue(arguments.constraintParameter) ){
			throw(
				type="RANGE_CONSTRAINT.NOT_SIMPLE_VALUE",
				message="Paramater for constraint range was not of type simple value."
			);			
		}
		
		// make sure the range is 2 (1,5 || 05/05/2011,05/21/2011)
		if( listLen(arguments.constraintParameter) != 2 ){
			throw(
				type="RANGE_CONSTRAINT.INVALID_LIST",
				message="The constraint paramter you passed #arguments.constraintParameter# is not a list with 2 values."
			);
		}
		
		//set min and max
		setMin(listFirst(constraintParameter));
		setMax(listLast(constraintParameter));
	}
	
	public boolean function processValidate(any target, any property, any value){
		if( isValid("date",value) || isNumeric(value) ){
			if( value >= min && value <= max ){
				return true;
			}			
		} else {
			//testing string length
			if( len(value) >= min && len(value) <= max ){
				return true;
			}
		}		

		return false;
	}

}
