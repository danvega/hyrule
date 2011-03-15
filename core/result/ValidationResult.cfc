import hyrule.core.error.ValidationError;

component accessors="true" {

	property name="errors" type="array";

	public validationResult function init(){
		setErrors([]);
		return this;
	}
	
	public boolean function hasErrors() {
		return (arrayLen(getErrors()) > 0); 
	}
	
	public array function getErrors(){
		return variables.errors;
	}
	
	public void function addError(required String class,required String level,required String property,required String type,required String message){
		var error = new ValidationError();
		
		error.setClass(arguments.class);
		error.setLevel(arguments.level);
		error.setProperty(arguments.property);
		error.setType(arguments.type);
		error.setMessage(arguments.message);
		
		arrayAppend(variables.errors,error);
	}

}
