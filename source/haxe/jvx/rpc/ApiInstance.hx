package jvx.rpc;

import haxe.Json;

class ApiInstance
{
	var conn:ApiConnector;
	
	/**
	 * Subclasses should have a constructor with this signature,
	 * in order to the refelction system can create instances automatically.
	 */
	public function new(conn:ApiConnector)
	{
		this.conn = conn;
	}

	function invokeRpcFunction(method:String, params: Array<Dynamic>):Dynamic
	{
		//TODO does it needed to wrap?
		var req = Json.parse("{}");//there's no default costructor, lol
		req.f = method;
		req.p = params;
		return conn.txrx(req);
	}
	
	//PHP wont get this, haxe generates a default one __call method.
	function __call(method:String, params: Array<Dynamic>)
	{
		return invokeRpcFunction(method, params);
	}
}

