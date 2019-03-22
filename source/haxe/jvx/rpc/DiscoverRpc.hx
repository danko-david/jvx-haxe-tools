package jvx.rpc;

class DiscoverRpc extends ApiInstance
{
	public function new(conn:ApiConnector)
	{
		super(conn);
	}
	
	public function help():String
	{
		return invokeRpcFunction("help", []);
	}
	
	public function getNamespaces():Array<String>
	{
		return invokeRpcFunction("getNamespaces", []);
	}
	
	public function source(language:String, namespace:String, options:Map<String, String>  = null):Array<String>
	{
		return invokeRpcFunction("getNamespaces", []);
	}
	
}


