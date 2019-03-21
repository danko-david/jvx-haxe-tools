package jvx.rpc;

import haxe.Json;

class ApiInterface
{
	var conn:ApiConnector;
	
	public function new(conn:ApiConnector)
	{
		this.conn = conn;
	}

	function invokeRpcFunction(method:String, params: Array<Dynamic>):Dynamic
	{
		//TODO does it needed to wrap?
		var req = Json.parse("{}");//no default costructor, lol
		req.f = method;
		req.p = params;
		return conn.txrx(req);
	}
	
	function __call(method:String, params: Array<Dynamic>)
	{
		return invokeRpcFunction(method, params);
	}
}

