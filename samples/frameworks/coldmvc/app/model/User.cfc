component persistent="true" extends="coldmvc.Model" {

	property name="id";
	property name="firstname" display="First Name" notempty="true";
	property name="lastname" display="Last Name" notempty="true";
	property name="email" display="Email Address" email="true";
	property name="username" display="username" min="4";
	property name="password" display="First Name" range="6,30";
	property name="passwordConfirm" display="Confirm Password";
	property name="createdOn";
	property name="updatedOn";

	// before the save happens encrypt the password

}