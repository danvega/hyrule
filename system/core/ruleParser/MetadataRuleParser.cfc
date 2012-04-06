import hyrule.system.core.rule.ValidationRuleSet;
import hyrule.system.core.rule.ValidationRule;

component accessors="true" extends="BaseRuleParser" implements="IRuleParser" {

	public ValidationRuleSet function getValidationRuleSet(required any ruleContainer){
		var ruleset = new ValidationRuleSet();
		var meta = getMetaData(arguments.ruleContainer);
		
		addRulesFromPropertiesAndConstraints(arguments.ruleContainer,meta,ruleset);
		
		return 	ruleset;				 
	}
	
	
	private void function addRulesFromPropertiesAndConstraints(any ruleContainer,struct meta,ValidationRuleSet ruleset){
		if( isNull(arguments.meta.properties) )
			return;
		var ruleContainerConstraints = ISNULL(arguments.ruleContainer.constraints)? {} : arguments.ruleContainer.constraints;	
		addRulesFromProperties(arguments.meta.properties,arguments.ruleset);	
		addRulesFromConstraints(ruleContainerConstraints,arguments.meta.properties,arguments.ruleset);

		// check for inherited properties
		while( structKeyExists(arguments.meta,"extends") && structKeyExists(arguments.meta.extends,"properties")){
					arguments.meta = arguments.meta.extends;
						
					addRulesFromProperties(arguments.meta.properties,arguments.ruleset);
					addRulesFromConstraints(ruleContainerConstraints,arguments.meta.properties,arguments.ruleset);
		}
	}
	
	/**
	 * I look the the object properties and add constraints if I recognize a constraint name as an property attribute
	 */
	 
	private void function addRulesFromProperties(array properties,ValidationRuleSet ruleSet){
		for(var x=1; x<= arrayLen(arguments.properties); ++x){
			var property = arguments.properties[x];
			var propertyName = property.name;
			for(var attributeName in property){
				if(isValidConstraintName(attributeName)){
					var vr = new hyrule.system.core.rule.ValidationRule();
					vr.setConstraintName(attributeName);
					vr.setConstraintValue(property[attributeName]);
					vr.setPropertyName(propertyName);
					ruleSet.addValidationRule(vr);
				}
			}		 
		}			
	}
	
	/**
	 * I check for a "constraints" attributes in the object metadata and add those in as well.
	 */	
		 
	private void function addRulesFromConstraints(struct ruleContainerConstraints,array properties,ValidationRuleSet ruleSet){		
					
		var propertyNameList = "";
		var x=1;
		while(x <= arraylen(arguments.properties)){
			propertyNameList = ListAppend(propertyNameList,arguments.properties[x].name);
			x++;
		}
		
		for(var propertyName in arguments.ruleContainerConstraints){
			//if the property name given isn't found skip over it instead of erroring our
			if(!listFindNoCase(propertyNameList,propertyName))	continue;
			var propertyConstraints = ruleContainerConstraints[propertyName];
			
			for (propertyConstraintName in propertyConstraints){
				//if the constraint name isn't recognized skip over it instead of erroring our
				if(isValidConstraintName(propertyConstraintName)){
					var validationRule = new hyrule.system.core.rule.ValidationRule();
					validationRule.setConstraintName(propertyConstraintName);
					validationRule.setConstraintValue(propertyConstraints[propertyConstraintName]);
					validationRule.setPropertyName(propertyName);
					ruleSet.addValidationRule(validationRule);
				}				
			}
		}
	}

}