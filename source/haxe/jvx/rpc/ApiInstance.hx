package jvx.rpc;

import jvx.lang.LibFunction;

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
		var req = LibFunction.json_decode("{}");//there's no default costructor, lol
		req.f = method;
		req.p = params;
		return conn.txrx(req);
	}
}
