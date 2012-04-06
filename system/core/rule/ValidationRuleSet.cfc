component accessors="true"  {

	property type="array" name="validationRules" setter="false" ;

	ValidationRuleSet function init(){
		variables.validationRules = [];
		return this;
	}
	
	void function addValidationRule(validationRule vr){
		ArrayAppend(variables.validationRules,arguments.vr);
	}
	
}