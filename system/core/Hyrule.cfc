import hyrule.system.core.result.ValidationResult;
import hyrule.system.core.result.ValidationMessage;
import hyrule.system.core.constraint.ConstraintFactory;
import hyrule.system.core.ruleParser.RuleParserFactory;
import hyrule.system.core.i18n.i18n;
import hyrule.system.core.Settings;

component accessors="true" {
	
	/**
	 * rule parsor factory that loads a collection of IRuleParsors
	 */	
	property name="ruleParserFactory" type="RuleParserFactory";

	/**
	 * Internationalization Utility
	 */
	property name="i18n" type="i18n";
	
	/**
	 * Hyrule Settings Bean
	 */	
	property name="settingsBean";
	
	/**
	 * factory object for contrainsts
	 */	
	property name="constraintFactory" type="ConstraintFactory";	
	
	/**
	 * Hyrule construct handles configuration and creation of factories
	 */	
	public Hyrule function init(Struct config={}){		
		setSettingsBean( new Settings(config) );				
		setRuleParserFactory( new RuleParserFactory(getSettingsBean()) );	
		setConstraintFactory( new ConstraintFactory() );	
		seti18n( new i18n(getSettingsBean()) );
		return this;
	}
	
	/**
	 * Main purpose of the hyrule framework is to validate an object. The rule parsing is 
	 * delegated to the appropriate parser which is created by our parser factory
	 */
	public ValidationResult function validate(required any target, string context="*",string locale=""){
		// determine our resource bundle properties file
		var rb = getI18N().getResourceBundle(arguments.locale);
		// set the rb	
		getSettingsBean().setRB(rb);
		
		var ruleParser = getRuleParserFactory().getRuleParser();
		var ruleSet = ruleParser.getValidationRuleSet(target);
		return validateAgainstRuleSet(target,context,ruleSet);
	}
	
	private ValidationResult function validateAgainstRuleSet(required any target,required string context, required any ruleSet){
		var result = new ValidationResult(new ValidationMessage( getSettingsBean()));
		var meta = getMetaData(arguments.target);
		var targetname = meta.Name;
		//get a struct of properties keyed off name for fast lookup in error creation later
		
		var properties = {};
		do
		{
			for (var x = 1; x <=arraylen(meta.properties); x++)
				properties[meta.properties[x].name] = meta.properties[x];			
			meta = structKeyExists(meta,"extends") ? meta.extends : {}; 
		}
		while(structKeyExists(meta,"properties"));

		for (var validationRule in arguments.ruleSet.getValidationRules()){
			var type = targetName & "." & validationRule.getPropertyName() & "." & validationRule.getConstraintName();
			
			// if a context is requested and we do not find the property name in the context then skip this contstraint
			if( arguments.context != "*" 
				&& !listFindNoCase(arguments.context,validationRule.getPropertyName())
				&& !listFindNoCase(arguments.context,validationRule.getContext()) ) continue;
			
			var propertyValue = evaluate("arguments.target.get#validationRule.getPropertyName()#()");
			propertyValue = isNULL(propertyValue)? '' : propertyValue;
			
			var constraint = getConstraintFactory().getConstraint(validationRule.getConstraintName());
			constraint.setConstraintParameter(validationRule.getConstraintValue());
			rulePassed = constraint.validate(arguments.target,validationRule.getPropertyName(),propertyValue);								
					
			if(!rulePassed){
				//make sure the constraint is set as an attribute on the property 
				//(validation messaging assumes all constraints exist there
				properties[validationRule.getPropertyName()][validationRule.getConstraintName()] = validationRule.getConstraintValue();
				result.addError(targetName,'property',properties[validationRule.getPropertyName()],validationRule.getConstraintName());							
			}	
		}
		return result;
	}
	
		
}