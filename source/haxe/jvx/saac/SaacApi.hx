package jvx.saac;

import jvx.rpc.ApiInstance;
import jvx.rpc.ApiConnector;

class SaacApi extends ApiInstance
{
	public function new(conn:ApiConnector)
	{
		super(conn);
	}

	public function listFunctions():Array<FunctionDescriptor>
	{
		return FunctionDescriptor.parseFunctions(invokeRpcFunction("listFunctions", new Array()));
	}

	//TODO maybe offer?
}
