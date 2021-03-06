package jvx.rpc;

#if js
//maybe nodejs can do this.
class ApiConnectorSocket implements ApiConnector
{
	public function new(host:String, port:Int)
	{
		txrx(null);
	}

	public function txrx(data:Dynamic):Dynamic
	{
		throw "ApiConnectorSocket not available in javascript.";
	}
}

#else

import jvx.lang.LibFunction;
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
		socket.write(LibFunction.json_encode(data));
		socket.write("\n");
		//TODO what if connection closed?
		var ret = LibFunction.json_decode(socket.input.readLine());
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

#end
