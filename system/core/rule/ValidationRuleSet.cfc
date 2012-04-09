component accessors="true"  {

	property type="array" name="validationRules" setter="false" ;

	ValidationRuleSet function init(){
		variables.validationRules = [];
		return this;
	}
	
	void function addValidationRule(validationRule vr){
		//put the required attributes first so they get validated first
		if(arguments.vr.getConstraintName() == 'Required')
			ArrayPrepend(variables.validationRules,arguments.vr);
		else
			ArrayAppend(variables.validationRules,arguments.vr);
	}
	
}