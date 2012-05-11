<cfscript>
	
	user = new User();
	user.setFirstName("Dan");
	user.setLastName("Vega");
	user.setEmail("jsmith@aol.com");
	user.setUsername("cfadd");
	user.setPassword(hash("password"));
	
	hyrule = new hyrule.system.core.hyrule();
	result = hyrule.validate(user,"insert");
	
	writeDump(result.getErrors());
	
	// hyrule.validate(user,"username,password");
	// hyrule.validate(user,"insert");
</cfscript>
