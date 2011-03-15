import hyrule.core.validator.AnnotationValidator;
import hyrule.core.validator.ConstraintsValidator;
import hyrule.core.result.ValidationResult;
import hyrule.core.constraint.ConstraintFactory;

component accessors="true" {

	/**
	 * Validator for validating beans using annotion based rules
	 */
	property name="annotationValidator" type="hyrule.core.validator.AnnotationValidator" ;
	
	/**
	 * Validator for validating beans using this.constraints
	 */
	property name="constraintsValidator" type="hyrule.core.validator.ConstraintsValidator";
	
	public Hyrule function init(String resourceBundle="default"){
		var constraintFactory = new ConstraintFactory();
		setConstraintsValidator(new ConstraintsValidator(constraintFactory,arguments.resourceBundle));
		setAnnotationValidator(new AnnotationValidator(constraintFactory,arguments.resourceBundle));
		return this;
	}
	
	public ValidationResult function validate(required any target, string context="*"){
		var validator = getValidatorType(target);
		var result = new ValidationResult(); 
		return validator.validate(target,context,result);
	}

	// PRIVATE METHODS
	private any function getValidatorType(any target){
		if( isNull(arguments.target.constraints) ){
			return variables.annotationValidator;	
		} else {
			return constraintsValidator;
		}
	}
}