import hyrule.system.core.result.ValidationResult;

component accessors="true" extends="BaseValidator" implements="IValidator" {
		
	public ValidationResult function validate(required any target, string context="*"){
		var meta = getMetaData(target);
		var properties  = getProperties(meta);						
		var result = new ValidationResult(getValidationMessage());
		
		for(var x=1; x<= arrayLen(properties); ++x) {
			
			var name = properties[x].name;
						
			for(key in properties[x]){
				var type = meta.name & "." & name & "." & key; 
				
				// is this key a valid constraint, if so lets validate this
				if( listFindNoCase(getConstraintList(),key) ){
					
					// if the key in this constraint does not contain a context then we always validate
					// if it does contain a context then we only validate this if the context matches									
					if( arguments.context == "*" || listFindNoCase(arguments.context,name) ) {
						
						var obj = getConstraints()[key];						
						// the value of the property
						var value = evaluate("target.get#properties[x].name#()");					
						// set the constraint property
						obj.setConstraintParameter(properties[x][key]);

						if( isNull(value) ){
							// if the value is null the constraint check has failed, no need to validate the value
							result.addError(meta.name,'property',properties[x],key);
						} else {
							if( !obj.validate(target,properties[x].name,value) ){														
								result.addError(meta.name,'property',properties[x],key);
							}
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