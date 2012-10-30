component extends="AbstractConstraint" accessors="true" {

	property name="expression";

	public DiscreteConstraint function init(){
		setClazz(this);
		setConstraintName("DISCRETE");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("regex",arguments.constraintParameter,"^(eq|neq|lt|lte|gt|gte)(\:)(\d.*)") ){
			throw(
				type="DISCRETE_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint discrete must follow the format 'operation:value', like eq:4, gt:4."
			);
		}

		setExpression(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		var operator = listFirst(getExpression(),":");
		var expressionValue = listLast(getExpression(),":");
		var valid = false;

		switch(operator){
			case "eq" : {
				valid = (arguments.value == expressionValue);
				break;
			}
			case "neq" : {
				valid = (arguments.value != expressionValue);
				break;
			}
			case "lt" : {
				valid = (arguments.value < expressionValue);
				break;
			}
			case "lte" : {
				valid = (arguments.value <= expressionValue);
				break;
			}
			case "gt" : {
				valid = (arguments.value > expressionValue);
				break;
			}
			case "gte" : {
				valid = (arguments.value >= expressionValue);
				break;
			}

		}

		return valid;
	}

}
