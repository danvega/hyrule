import hyrule.system.core.result.ValidationResult;
import hyrule.system.core.result.ValidationMessage;
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
		var result = new ValidationResult(new ValidationMessage( getSettingsBean() ));
		var meta = getMetaData(arguments.target);
		var targetname = meta.Name;
		var properties = {};

		do
		{
			for (var x = 1; x <=arraylen(meta.properties); x++) {
				meta.properties[x]["FAILED"] = false;
				properties[meta.properties[x].name] = meta.properties[x];
			}

			meta = structKeyExists(meta,"extends") ? meta.extends : {};
		}
		while(structKeyExists(meta,"properties"));

		// validationRules array needs to be sorted so all required rules come first
		var sortedRules = _sort(arguments.ruleset.getValidationRules());

		for(var validationRule in sortedRules){

			// if this property already failed no need to go on
			if( !properties[validationRule.getPropertyName()]["FAILED"] ) {
				var type = targetName & "." & validationRule.getPropertyName() & "." & validationRule.getConstraintName();

				// if a context is requested and we do not find the property name in the context then skip this contstraint
				if( arguments.context != "*"
					&& !listFindNoCase(arguments.context,validationRule.getPropertyName())
					&& !listFindNoCase(arguments.context,validationRule.getContext())) continue;

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

					// set failed = true for this property
					properties[validationRule.getPropertyName()]["FAILED"] = true;
				}
			}
		}
		return result;
	}

	/**
	 * @hint I will sort an array of rules. We want all of the required rules first and the rest
	 */
	private Array function _sort(Array rules){
		var result = duplicate(arguments.rules);
		var size = arrayLen(result);

		/// iterate over the rules
		for(var x = 1; x <= size; x++){
			// inner loop compares rule
			for(var i=1; i <= size - x; i++){
				var thisConstraint = result[i].getConstraintName();
				var nextConstraint = result[i+1].getConstraintName();

				if( nextConstraint == 'REQUIRED'){
					temp = duplicate(result[i]);
					result[i] = duplicate(result[i + 1]);
					result[i + 1] = temp;
				}
			}
		}

		return result;
	}

}