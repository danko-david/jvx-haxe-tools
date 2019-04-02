package jvx.saac;

import jvx.rpc.ApiInstance;
import jvx.rpc.ApiConnector;
import jvx.validation.ValidationEntry;

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

	public function compileAndCheck(func:Dynamic):Array<ValidationEntry>
	{
		return ValidationEntry.parseEntries(invokeRpcFunction("compileAndCheck", [func]));
	}

	//TODO maybe offer?
}
