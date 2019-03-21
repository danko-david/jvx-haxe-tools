package jvx.rpc;

class ApiConnectorNamespace implements ApiConnector
{
	var conn:ApiConnector;
	var ns:String;

	public function new(api:ApiConnector, namespace:String)
	{
		conn = api;
		ns = namespace;
	}
	
	public function txrx(data:Dynamic):Dynamic
	{
		data.N = ns;
		return conn.txrx(data);
	}
}

