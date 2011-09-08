import hyrule.system.core.result.ValidationResult;

component accessors="true" extends="BaseValidator" implements="IValidator" {
		
	public ValidationResult function validate(required any target, string context="*"){
		var meta = getMetaData(target);
		var properties  = getProperties(meta);						
		var result = new ValidationResult(getValidationMessage());
		
		for(var x=1; x<= arrayLen(properties); ++x) {
				
			// we are only validating columns
			// we can't use !structKeyExists(properties[x],"fieldtype") || properties[x].fieldtype == "column")
			// for non orm objects there is no fieldtype key
			// not sure why... structKeyExists(meta,'persistent') && !structKeyExists(properties[x],"fieldtype"
			
			var name = properties[x].name;
						
			for(key in properties[x]){
				var type = meta.name & "." & name & "." & key; 
				
				// is this key a valid constraint, if so lets validate this
				if( listFindNoCase(getConstraintList(),key) ){
					
					// if the key in this constraint does not contain a context then we always validate
					// if it does contain a context then we only validate this if the context matches
					// or the properties context exists but the validation context is *										
					if( arguments.context == "*" || listFindNoCase(arguments.context,name) ) {
						
						var obj = getConstraints()[key];						
						// the value of the property
						var value = evaluate("target.get#properties[x].name#()");					
						// set the constraint property
						obj.setConstraintParameter(properties[x][key]);

						// a null property is an error by the developer not the user, throw an error
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
							result.addError(meta.name,'property',properties[x],key);
						}							
					}
				
				} else {
					
					/**
					 * custom validation methods will be fully qualified path names
					 * com.abc.company.methodNameHere
					 */ 
					if(find('.',key)){						
						var method = listLast(key,".");
						var clazz = replaceNoCase(key,'.' & method,"");
						var instance = createObject(clazz);
						
						if( !evaluate("instance.#method#('#evaluate("target.get#properties[x].name#()")#')") ){
							result.addError(meta.name,'property',properties[x],key);
						}						
					}
					
				}							
			}

		}
					
		return result;
	}
	
}