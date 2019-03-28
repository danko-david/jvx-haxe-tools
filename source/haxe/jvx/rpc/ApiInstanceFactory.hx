package jvx.rpc;

import jvx.api.DiscoverRpc;

class ApiInstanceFactory
{
	var conn:ApiConnector;

	public function new(conn:ApiConnector)
	{
		this.conn = conn;
	}

	public function getApiConnector():ApiConnector
	{
		return conn;
	}

	public function getApi<T:ApiInstance>(?ns:String, type:Class<T>):T
	{
		var c:ApiConnector = conn;
		if(null != ns)
		{
			c = new ApiConnectorNamespace(c, ns);
		}

		return Type.createInstance(type, [c]);
	}

	public function getDiscoveryApi()
	{
		return getApi("DiscoverRpc", DiscoverRpc);
	}
}
