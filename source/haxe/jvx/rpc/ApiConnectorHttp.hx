package jvx.rpc;

import jvx.lang.LibFunction;

class ApiConnectorHttp implements ApiConnector
{
	var url:String;

	public function new(url:String)
	{
		this.url = url;
	}

	public function txrx(data:Dynamic):Dynamic
	{
		var request = new haxe.Http(url);
		request.setPostData(LibFunction.json_encode(data));
		var response = null;
		request.onData = function (data)
		{
			response = data;
		}
		request.request(true);
		if(null ==	response)
		{
			throw "HttpApi access error at end point: "+url;
		}
		//TODO what if connection closed?
		var ret = LibFunction.json_decode(response);
		if(Reflect.hasField(ret, "e"))
		{
			throw ret.e;
		}

		return ret.r;
	}
}
