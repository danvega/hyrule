import hyrule.core.result.ValidationResult;
import hyrule.core.constraint.ConstraintFactory;
import hyrule.core.message.ValidationMessage;

component implements="IValidator" accessors="true" {

	property name="constraintFactory";
	property name="validationMessage";

	public ConstraintsValidator function init(ConstraintFactory cf,String rb){
		setConstraintFactory(cf);
		setValidationMessage(new ValidationMessage(arguments.rb));
		return this;
	}

	public ValidationResult function validate(required any target, string context="*", ValidationResult result){
		var properties = target.constraints;
		var constraints = getConstraintFactory().getConstraints();
		var meta = getMetaData(target);
		
		// an array of properties with constraints
		for(var x=1; x<=arrayLen(properties); ++x){
			// loop each key in the collection
			for(var key in properties[x]){
				var type = meta.name & "." & properties[x].property & "." & key; 
				
				// if this key matches a key in the constraint factory then validate
				if( structKeyExists(constraints,key) ){
					
					// if the key in this constraint does not contain a context then we always validate
					// if it does contain a context then we only validate this if the context matches
					// or the properties context exists but the validation context is *
					
					if( arguments.context == "*" ||
						!structkeyExists(properties[x],"context") || 
						(structKeyExists(properties[x],"context") && listFindNoCase(properties[x].context,arguments.context) )) {

						var obj = constraints[key];
						// the value of the property
						var value = evaluate("target.get#properties[x].property#()");					
						// set the constraint property
						obj.setConstraintParameter(properties[x][key]);
						
						if( isNull(value) ){
							throw(
								type="ConstraintsValidator",
								message="You are trying to validate a null property"
								detail="The prorperty #properties[x].property# is null. Please make sure you have populated the property."
								);
						}
						
						// validate it
						if( !obj.validate(target,properties[x].property,value) ){
							// set errors
							result.addError(meta.name,'property',properties[x].property,key,getValidationMessage().getMessage(type));
						}
					}
					
				}
				// custom validator
				if( key == 'validator'){
					var validate = evaluate("target.#properties[x][key]#()");
					if( !validate ){						
						result.addError(meta.name,'property',properties[x].property,key,getValidationMessage().getMessage(type));
					}
				}
			}
		}
			
		return result;	
	}

}