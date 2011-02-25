component persistent="true" {

	property name="userid" fieldtype="id" ormtype="int" generator="native";
	property name="firstname" type="string" display="First Name" notempty="true";
	property name="lastname" type="string" display="Last Name" notempty="true";
	property name="email" type="string" display="Email Address" email="true";

}
