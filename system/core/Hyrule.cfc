import hyrule.system.core.result.ValidationResult;
import hyrule.system.core.result.ValidationMessageProvider;
import hyrule.system.core.constraint.ConstraintFactory;
import hyrule.system.core.ruleParser.RuleParserFactory;
import hyrule.system.core.i18n.i18n;
import hyrule.system.core.Settings;

component accessors="true" {

	/**
	 * @hint rule parsor factory that loads a collection of IRuleParsors
	 */
	property name="ruleParserFactory" type="RuleParserFactory";

	/**
	 * @hint Internationalization Utility
	 */
	property name="i18n" type="i18n";

	/**
	 * @hint Hyrule Settings Bean
	 */
	property name="settingsBean";

	/**
	 * @hint factory object for contrainsts
	 */
	property name="constraintFactory" type="ConstraintFactory";

	/**
	 * @hint Hyrule construct handles configuration and creation of factories
	 */
	public Hyrule function init(Struct config={}){
		setSettingsBean( new Settings(config) );
		setRuleParserFactory( new RuleParserFactory(getSettingsBean()) );
		setConstraintFactory( new ConstraintFactory() );
		seti18n( new i18n(getSettingsBean()) );
		return this;
	}

	/**
	 * @hint Main purpose of the hyrule framework is to validate an object. The rule parsing is
	 * delegated to the appropriate parser which is created by our parser factory
	 */
	public ValidationResult function validate(required any target, string context="*",string locale="",string stopOnFirstFail){
		// determine our resource bundle properties file
		var rb = getI18N().getResourceBundle(arguments.locale);
		// set the rb
		getSettingsBean().setRB(rb);

		if(StructKeyExists(arguments,"stopOnFirstFail") && !listFindNoCase("none,object,property",arguments.stopOnFirstFail))
			throw('value for stopOnFirstFail not recognized.  Valid values are none, object, and property');
			
		local.stopOnFirstFail = StructKeyExists(arguments,"stopOnFirstFail") ? arguments.stopOnFirstFail : getSettingsBean().getStopOnFirstFail();
		
		var ruleParser = getRuleParserFactory().getRuleParser();
		var ruleSet = ruleParser.getValidationRuleSet(target);
		return validateAgainstRuleSet(target,context,ruleSet,local.stopOnFirstFail);
	}

	private ValidationResult function validateAgainstRuleSet(required any target,required string context, required any ruleSet,required string stopOnFirstFail){
		var result = new ValidationResult(new ValidationMessageProvider( getSettingsBean() ));
		var meta = getMetaData(arguments.target);
		var properties = {};

		//build a map of properties by name for fast lookup later
		do
		{
			for (var x = 1; x <=arraylen(meta.properties); x++){
				properties[meta.properties[x].name] = meta.properties[x];
				properties[meta.properties[x].name].className = meta.Name;
			}
			meta = structKeyExists(meta,"extends") ? meta.extends : {};
		}
		while(structKeyExists(meta,"properties"));

		for(var validationRule in arguments.ruleset.getValidationRules()){

			// if this property already failed and we are stopping at first property failure skip this iteration 
			if(result.propertyHasError(validationRule.getPropertyName()) && arguments.stopOnFirstFail == 'property') continue; 

			// if a context is requested and we do not find the property name in the context then skip this contstraint
			if( arguments.context != "*"
				&& !listFindNoCase(arguments.context,validationRule.getPropertyName())
				&& !listFindNoCase(arguments.context,validationRule.getContext())) continue;

			var propertyValue = evaluate("arguments.target.get#validationRule.getPropertyName()#()");
			var constraint = getConstraintFactory().getConstraint(validationRule.getConstraintName());
			
			//if the propert value is NULL...ask the constrainst if we should autopass the check
			
			if(isNULL(propertyValue)  && constraint.passOnNULL()) continue;
			
			constraint.setConstraintParameter(validationRule.getConstraintValue());
			if(isNULL(propertyValue))
				rulePassed = constraint.validate(arguments.target,validationRule.getPropertyName());
			else
				rulePassed = constraint.validate(arguments.target,validationRule.getPropertyName(),propertyValue);

			if(!rulePassed){
				//make sure the constraint is set as an attribute on the property
				//(validation messaging assumes all constraints exist there
				properties[validationRule.getPropertyName()][validationRule.getConstraintName()] = validationRule.getConstraintValue();
				result.addError(properties[validationRule.getPropertyName()].className,'property',properties[validationRule.getPropertyName()],validationRule.getConstraintName());
				
				//break out of the loop and stop validation if we are stopping on first object validation failure
				if(arguments.stopOnFirstFail == 'object') break;
			}
		}
		return result;
	}
}