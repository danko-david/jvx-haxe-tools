package jvx.rpc;

import haxe.Json;

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
		request.setPostData(Json.stringify(data));
    var response = null;
    request.onData = function (data)
    {
      response = data;
    }
		request.request(true);
		//TODO what if connection closed?
		var ret = Json.parse(response);
		if(Reflect.hasField(ret, "e"))
		{
			throw ret.e;
		}

		return ret.r;
	}
}
