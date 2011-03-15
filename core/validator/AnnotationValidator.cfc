import hyrule.core.result.ValidationResult;
import hyrule.core.constraint.ConstraintFactory;
import hyrule.core.message.ValidationMessage;

component accessors="true" implements="IValidator" {

	property name="constraintFactory";
	property name="validationMessage";

	public AnnotationValidator function init(ConstraintFactory cf,String rb){
		setConstraintFactory(cf);
		setValidationMessage(new ValidationMessage(arguments.rb));		
		return this;
	}
	
	public ValidationResult function validate(required any target, string context="*", ValidationResult result){
		var meta = getMetaData(target);
		var constraints = getConstraintFactory().getConstraints();
		var properties  = (isNull(meta.properties)) ? [] : meta.properties;
		
		for(var x=1; x<= arrayLen(properties); ++x) {	
			// we are only validating columns
			if( !structKeyExists(properties[x],"fieldtype") || properties[x].fieldtype == "column"){
				var name = properties[x].name;
				
				for(key in properties[x]){
					var type = meta.name & "." & name & "." & key; 
					
					if( structKeyExists(constraints,key) ){
						
						// if the key in this constraint does not contain a context then we always validate
						// if it does contain a context then we only validate this if the context matches
						// or the properties context exists but the validation context is *
						
						if( arguments.context == "*" ||
							!structkeyExists(properties[x],"context") || 
							(structKeyExists(properties[x],"context") && listFindNoCase(properties[x].context,arguments.context) )) {
							
							var obj = constraints[key];						
							// the value of the property
							var value = evaluate("target.get#properties[x].name#()");					
							// set the constraint property
							obj.setConstraintParameter(properties[x][key]);
	
							if( isNull(value) ){
								throw(
									type="AnnotationValidator",
									message="You are trying to validate a null property"
									detail="The prorperty #properties[x].name# is null. Please make sure you have populated the property."
									);
							}
							
							// validate it
							if( !obj.validate(target,properties[x].name,value) ){
								// set errors
								result.addError(meta.name,'property',properties[x].name,key,getValidationMessage().getMessage(type));
							}							
						}
					
					}							
				}
			}
		}
					
		return result;
	}
	
}