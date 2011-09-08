component mappedsuperclass="true" {
	
	public any function init(){
		return this;
	}

	public void function preInsert(){
	}
	
	public void function preUpdate(){
	}
	
	/**
	 * @hint I am a shortcut for entitySave
	 */		
	public void function save(boolean flush=false){
		entitySave(this);
		if( flush ){
			ormFlush();
		}
	}

	/**
	 * @hint I am a shortcut for entityDelete
	 */	
	public void function delete(boolean flush=false){
		entityDelete(this);
		if( flush ){
			ormFlush();
		}
	}
	
	/**
	 * returns an array of properties that make up the identifier
	 */
	public array function getIdentifierColumnNames() {
		return ORMGetSessionFactory().getClassMetadata( getClassName() ).getIdentifierColumnNames() ;
	}

	/**
	 * returns the name of the Entity
	 */
	public string function getEntityName(){
		return ORMGetSessionFactory().getClassMetadata( getClassName() ).getEntityName();
	}
	
	/**
	 * returns an array of persisted properties
	 */
	public array function getPersistedProperties(){
		return ORMGetSessionFactory().getAllClassMetadata()[ getClassName() ].getPropertyNames();
	}
	
	
	/**
	 * returns the subclass class name of this object
	 */
	public string function getClassName(){
		return ListLast( GetMetaData( this ).fullname, "." );
	}
	
	/**
	 * @hint Populates the object with values from the argument
	 */
	public any function populate(required any data, any propList=arrayNew(1)){
	  local.mdp = getMetaData(this).properties;
	  
	  for (local.i=1;i LTE ArrayLen(mdp);i=i+1) {                     
	     if (!arraylen(arguments.propList) || arraycontains(arguments.propList,mdp[i].name)){
	        if (!structkeyexists(mdp[i],"fieldType") || mdp[i].fieldType == "column") {
	           if (structkeyexists(arguments.data,mdp[i].name)) {
	              local.varValue = arguments.data[mdp[i].name];
	              if ((!structkeyexists(mdp[i],"notNull") || !mdp[i].notNull) && !len(varValue)){
	                 _setPropertyNull(mdp[i].name);
	              }
	              else {
	                 if(!structkeyexists(mdp[i],"cleanseInput")){
	                    mdp[i].cleanseInput = false;
	                 }
	                 if(mdp[i].cleanseInput){
	                    varValue = _cleanse(varValue);
	                 }
	                 _setProperty(mdp[i].name,varValue);
	              }               
	           }
	        }
	        else if(mdp[i].fieldType == "many-to-one"){
	           if (structkeyexists(arguments.data,mdp[i].fkcolumn)){
	              local.fkValue = arguments.data[mdp[i].fkcolumn];
	           }
	           else if (structkeyexists(arguments.data,mdp[i].name)){
	              local.fkValue = arguments.data[mdp[i].name];
	           }
	           
	           if (structkeyexists(local,"fkValue")){
	              local.varValue = EntityLoadByPK(mdp[i].name,fkValue);
	              	              	              
	              if (isnull(varValue)){
					if (!structkeyexists(mdp[i],"notNull") || !mdp[i].notNull){
						_setPropertyNull(mdp[i].name);
					}
					else {
						throw "Trying to load a null into the #mdp[i].name#, but it doesn't accept nulls.";
					}
	              }
	              else {
	                 _setProperty(mdp[i].name,varValue);
	              }
	
	           }
	        } 
	     }                        
	  }
	}

	//PRIVATE *******************************************************************************************************

	/**
	 * @hint I set a dynamically named property
	 */
	private void function _setProperty(required any name, any value){
		local.theMethod = this["set" & arguments.name];
	
		if (isNull(arguments.value)) {
			theMethod(javacast('NULL', ''));
		} else {
			theMethod(arguments.value);
		}
	}
	
	/**
	 * @hint I set a dynamically named property to null
	 */
	private void function _setPropertyNull(required any name){
		_setProperty(arguments.name);
	}
	  
	/**
	 * @hint I cleanse input via HTMLEditFormat. My implementation can be changed to support other cleansing methods.
	 */
	private any function _cleanse(required any data){
		return HTMLEditFormat(arguments.data);
	}

}