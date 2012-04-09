/**
 * UniqueConstraint
 *
 * @hint I am used to determine if a value is unique in the database. I am only useful for persisted records and will always
 * return true for non persisted components
 */
component extends="AbstractConstraint" accessors="true" {

	property name="isunique" type="boolean";

	public UniqueConstraint function init(){
		setClazz(this);
		setConstraintName("UNIQUE");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="UNIQUE_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint unique was not of type boolean"
			);
		}

		setIsUnique(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		var unique = true;

		if( isSimpleValue(arguments.value) ) {
			if( getIsUnique() ) {
				var appSettings = application.getApplicationSettings();
				var entityName = getEntityName(target);
				var prop = getPropertyName(target,property);

				// is orm enabled && the target class we are looking at a mapped entity
				if( (structKeyExists(appSettings,"ormEnabled") && appSettings.ormEnabled) && len(entityName) ){
					var sql = "from " & entityName & " where " & prop & " = ?";
					unique = arrayLen(ormExecuteQuery(sql,[arguments.value])) == 0;
				}
			}
		}
		return unique;
	}

}