<cfscript>
// STATIC VARIABLES HACK
metadata = getMetaData(this);
if( !structKeyExists(variables,"constraints") ){
	lock name="StaticVariables(#metadata.name#)" timeout="10"{
		if( !structKeyExists(metadata,"constraints") ){
			metadata.constraints = [
				
			];
		}
	}
}
</cfscript>