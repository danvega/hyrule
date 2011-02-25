component {

	public void function populate(Struct args=structNew()) {
		for(key in args) {
			if(structKeyExists(this,"set" & key)){
  				var method = this["set#key#"];
 				method(args[key]);
			}
		}
	}

}
