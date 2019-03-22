package jvx.rpc;

import haxe.Json;
import sys.net.Socket;
import sys.net.Host;

class ApiConnectorSocket implements ApiConnector
{
	var socket:Socket;

	public function new(host:String, port:Int)
	{
		socket = new Socket();
		socket.connect(new Host(host), port);
	}

	public function txrx(data:Dynamic):Dynamic
	{
		socket.write(Json.stringify(data));
		socket.write("\n");
		//TODO what if connection closed?
		var ret = Json.parse(socket.input.readLine());
		if(Reflect.hasField(ret, "e"))
		{
			throw ret.e;
		}
		
		return ret.r;
	}

	public function close()
	{
		socket.close();
	}
}
