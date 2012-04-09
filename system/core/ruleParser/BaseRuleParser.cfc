import hyrule.system.core.constraint.ConstraintFactory;

component accessors="true" {

	property name="constraintFactory";

	public struct function getConstraints(){		
		return getConstraintFactory().getConstraints();
	}
	
	public string function getConstraintList(){
		return getConstraintFactory().getConstraintList();
	}
	
	public boolean function isValidConstraintName(required string name){
		//valid contrainst name is either a name from our factory or is one of our "special names" that we treat differently
		var list = getConstraintList();
		list = listappend(list,"validator");
		return listFindNoCase(list,arguments.name);
	}
	
	

}