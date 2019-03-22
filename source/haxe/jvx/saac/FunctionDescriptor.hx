package jvx.saac;

class FunctionDescriptor
{
	var id:String;
	var name:String;
	var description:String;
	
	public function new(){}

	public static function parseFunctions(descrs:Array<Dynamic>):Array<FunctionDescriptor>
	{
		var ret:Array<FunctionDescriptor> = [];
		for(i in 0...descrs.length)
		{
			ret[i] = parseFunction(descrs[i]);
		}
		return ret;
	}

	public static function parseFunction(descr:Dynamic):FunctionDescriptor
	{
		var ret:FunctionDescriptor = new FunctionDescriptor();
		ret.id = descr.id;
		ret.name = descr.name;
		ret.description = descr.description;
			
		return ret;
	}
}

