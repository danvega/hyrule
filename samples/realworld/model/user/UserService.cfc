component {

	public boolean function getByUsername(String username){
		var q = queryNew("id,username");
		//this is just a mock object, an actual database call would go here.
		if(arguments.username == "danvega"){
			queryAddRow(q,1);
			querySetCell(q,"id",1,1);
			querySetCell(q,"username","danvega",1);
		}
		return q.recordCount == 1;
	}

	public void function save(User user){
		// save the user
	}

}