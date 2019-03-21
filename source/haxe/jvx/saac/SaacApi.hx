package jvx.saac;

import jvx.rpc.ApiInterface;
import jvx.rpc.ApiConnector;

class SaacApi extends jvx.rpc.ApiInterface
{
	public function new(conn:ApiConnector)
	{
		super(conn);
	}
	
	public function listFunctions():Array<FunctionDescriptor>
	{
		//TODO parse
		return invokeRpcFunction("listFunctions", new Array());
	}
	
	//TODO maybe offer?
}

