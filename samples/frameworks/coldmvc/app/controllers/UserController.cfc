/**
 * @accessors true
 * @extends coldmvc.Controller
 */
component {

	public void function index(){
		redirect({action="list"});
	}

	public void function list() {
		//structKeyExists(params,"max") ? params.max : 10;
		params.users = _User.list();
	}
	
	public void function create(){
		params.user = _User.new();
		$.event.view("user/edit");
	}
	
	public void function read(){
		params.user = _User.get(params.id);
	}
	
	public void function edit(){
		params.id = structKeyExists(params,"id") ? params.id : 0; 		
		params.user = _User.get(params.id);
	}
	
	public void function save(){			
		var user = _User.get(params.id);		
		user.populate(params);
		user.setPasswordConfirm(params.passwordConfirm);
		
		if( user.validate() ){
			// before we save hash the password 
			user.setPassword(hash(params.password));

			tx = ormGetSession().beginTransaction();
			try {
				user.save();
				tx.commit();
			} catch(any e){
				tx.rollback();
				rethrow;
			}
			
			redirect({action="list"});
		} else {
			params.user = user;
			$.event.view("user/edit","user");
		}
			
	}
}