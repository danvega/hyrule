import hyrule.system.core.result.ValidationError;
import hyrule.system.core.result.ValidationMessage;

component accessors="true" {

	/**
	 * The array that contains all errors and provide a getter/setter
	 */
	property name="errors" type="array" setter="false";

	/**
	 * The array that contains all errors and provide a getter/setter
	 */
	property name="validationMessage";


	/**
	 * Constructor initializes our errors array
	 * return ValidationResult
	 */ 
	public validationResult function init(ValidationMessage message){
		variables.errors = [];
		setValidationMessage(arguments.message);
		variables.propertyErrorCache = {};
		return this;
	}
	
	/**
	 * I will determine if this result object containts any errors
	 * return boolean
	 */
	public boolean function hasErrors() {
		return (arrayLen(getErrors()) > 0); 
	}
	
	public boolean function propertyHasError(required string propertyName){
		return StructKeyExists(variables.propertyErrorCache,arguments.propertyName);
	}
	
	/** 
	 * I provide a way to add a new error to the errors array
	 *
	 * param (string) class
	 * param (string) level
	 * param (string) property
	 * param (string) type
	 *
	 */
	public void function addError(required String class,required String level,required Struct property,required String type){
		var error = new ValidationError();
						
		error.setClass(arguments.class);
		error.setLevel(arguments.level);
		error.setProperty(arguments.property.name);
		error.setType(arguments.type);
		error.setMessage(getValidationMessage().getMessage(class & "." & arguments.property.name & "." & type,arguments.property));
		arrayAppend(variables.errors,error);
		variables.propertyErrorCache[arguments.property.name] = true;
	}
	
	/**
	 * I provide a way to just get an array of error messages. When you call getErrors() you get an array
	 * of error objects. I built this method as an easy way to just get the messages.
	 */
	public array function getErrorMessages(){
		var messages = [];
		
		for( var i=1; i <= arrayLen(getErrors()); i++ ){
			arrayAppend(messages,getErrors()[i].getMessage());	
		}
		
		return messages;
	}

}
