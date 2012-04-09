/**
 * RequiredConstraint
 *
 * @hint The Required Constraint will make the field required. If the user enters nothing for that field
 * the constraint will return false. We also sort all of the required rules to the top. If the required constraint
 * fails no other constraints will be checked. Say for example you had an email property with the following constraints
 *
 * this.constraints = {
 *  email = {required=true,isValid="email",unique=""}
 * };
 *
 * You would not want error messages for each of these constraints. If the user didn't enter anything than we know the
 * value is not a properly formed email address or a unique 1 that we want to persist.
 *
 *
 */
component extends="AbstractConstraint" accessors="true" {

	property name="required" type="boolean";

	public RequiredConstraint function init(){
		setClazz(this);
		setConstraintName("REQUIRED");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("boolean",arguments.constraintParameter) ){
			throw(
				type="REQUIRED_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint required was not of type boolean"
			);
		}

		setRequired(constraintParameter);
	}

	public boolean function processValidate(any target, any property, any value){
		if( isSimpleValue(arguments.value) ) {

			if( getRequired() ) {
				if(len(trim(value)) > 0){
					return true;
				} else {
					return false;
				}
			}

		}
		return false;
	}

}
