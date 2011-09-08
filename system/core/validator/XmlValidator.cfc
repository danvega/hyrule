import hyrule.system.core.result.ValidationResult;

component accessors="true" implements="IValidator" {
	
	public ValidationResult function validate(required any target, string context="*"){
		return new ValidationResult();
	}
	
}