package jvx.api;

import jvx.rpc.ApiInstance;
import jvx.rpc.ApiConnector;
import jvx.query.ConditionInterface;

//TODO we ne the classSpace stuffs implemented in PHP right now
class DatabaseApi extends ApiInstance
{
	public function new(conn:ApiConnector)
	{
		super(conn);
	}

	public function select(modelName:String, select:ConditionInterface, options:Dynamic /*limi order etc*/ = null):Array<Dynamic>
	{
		return invokeRpcFunction("select", [modelName, select.serialize(), options]);
	}

	public function getManagedModels():Array<String>
	{
		return invokeRpcFunction("getManagedModels", []);
	}

	public function getAllAccessableClass():Array<Dynamic>
	{
		return invokeRpcFunction("getAllAccessableClass", []);
	}

	public function getModelMetadata(modelName:String):Dynamic/*ModelMetadata*/
	{
		return invokeRpcFunction("getModelMetadata", [modelName]);
	}

	public function getPermissions():Array<String>
	{
		return invokeRpcFunction("getPermissions",[]);
	}

	public function update(modelName:String, data:Dynamic):Dynamic/*ValidationResult*/
	{
		return invokeRpcFunction("update",[modelName, data]);
	}

	public function delete(modelName: String, id:Int, delOptions:Dynamic/**/):Dynamic/*ValidationResult*/
	{
		return invokeRpcFunction("delete", [modelName, id, delOptions]);
	}

	public function fork(newDatabaseName:String):Void
	{
		invokeRpcFunction("fork", [newDatabaseName]);
	}

	public function getById(modelName:String, id:Int):Dynamic/*WebDbModel*/
	{
		return invokeRpcFunction("getById", [modelName, id]);
	}

	public function create(modelName:String, data:Dynamic):Dynamic/*ValidationResult*/
	{
		return invokeRpcFunction("create", [modelName, data]);
	}
}
