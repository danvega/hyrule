/**
 * IsValidConstraint
 * 
 * @hint The IsValidConstraint usses ColdFusion's built in funciton isValid to test whether a value meets a validation or 
 * data type rule. You can define this constraint using the isvalid property on property constraints or the type constraint
 * when defining a constraints structure in the components this scope. We support all of the data types that isValid does
 * except range and regex. We have a stand alone constraints for each of those types.
 *
 * 
 */ 
component extends="AbstractConstraint" accessors="true" {
	
	/**
	 *  The valid format for the data; one of the following. 
	 *
	 *	any: any simple value. Returns false for complex values, such as query objects;; equivalent to the IsSimpleValue function.
	 *  array: an ColdFusion array; equivalent to the IsArray function.
	 *	binary: a binary value;; equivalent to the IsBinary function.
	 *	boolean: a Boolean value: yes, no, true, false, or a number; equivalent to the IsBoolean function.
	 *	component: a ColdFusion component (CFC).
	 *	creditcard: a 13-16 digit number conforming to the mod10 algorithm.
	 *	date or time: any date-time value, including dates or times;; equivalent to the IsDate function..
	 *	email: a valid email address.
	 *	eurodate: any date-time value, including US date formats and time values,
	 *	float or numeric: a numeric value; equivalent to the IsNumeric function.
	 *	guid: a Universally Unique Identifier of the form "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" where 'X' is a hexadecimal number.
	 *	integer: an integer.
	 *	query: a query object; equivalent to the IsQuery function.
     *	ssn or social_security_number: A U.S. social security number.
	 *	string: a string value, including single characters and numbers
	 *	struct: a structure; equivalent to the IsStruct function.
	 *	telephone: a standard US telephone number.
	 *	URL: an http, https, ftp, file, mailto, or news URL,
	 *	UUID: a ColdFusion Universally Unique Identifier, formatted 'XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXX', where 'X' is a hexadecimal number. See CreateUUID.
     *	USdate: a U.S. date of the format mm/dd/yy, with 1-2 digit days and months, 1-4 digit years.
 	 *	variableName: a string formatted according to ColdFusion variable naming conventions.
	 *	zipcode: U.S., 5- or 9-digit format ZIP codes.
	 */
	property String type;

	public IsValidConstraint function init(){
		setClazz(this);
		setConstraintName("ISVALID");
		return this;
	}

	public void function setConstraintParameter(any constraintParameter){
		if( !isValid("string",arguments.constraintParameter) ){
			throw(
				type="ISVALID_CONSTRAINT.INVALID_CONSTRAINT",
				message="Paramater for constraint type was not of type string"
			);
		} else {
			// make sure it is a valid type
			var validTypes = "any,array,binary,boolean,component,creditcard,date,email,eurodate,float,guid,integer,query,ssn,string,struct,telephone,url,uuid,usdate,variablename,zipcode,maxlength";

			if( !ListContainsNoCase(validTypes,arguments.constraintParameter) ){
				throw(
					type="ISVALID_CONSTRAINT.INVALID_TYPE",
					message="Paramater for constraint isvalid was not a valid type. Valid types are: " & validTypes
				);				
			}

		}
		
		setType(constraintParameter);
	}
	
	public boolean function processValidate(any target, any property, any value){
		return IIf( len( trim( arguments.value ) ) gt 0, "isValid(getType(),value)", DE("TRUE") ); // only validate if value exists else return true
	}

}