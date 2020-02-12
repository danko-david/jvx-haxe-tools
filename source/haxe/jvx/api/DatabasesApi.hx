package jvx.api;

import jvx.rpc.ApiInstance;
import jvx.rpc.ApiConnector;

class DatabasesApi extends DatabaseApi
{
	public function new(conn:ApiConnector)
	{
		super(conn);
	}

	public function listDatabases():Array<String>
	{
		return invokeRpcFunction("listDatabases", []);
	}

	public function getSelectedDatabase():String
	{
		return invokeRpcFunction("getSelectedDatabase", []);
	}

	public function selectDatabase(database:String):Void
	{
		invokeRpcFunction("selectDatabase", [database]);
	}
}
