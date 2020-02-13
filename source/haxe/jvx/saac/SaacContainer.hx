package jvx.saac;

import jvx.lang.LibFunction;

/**
 * Port of eu.javaexperience.saac.client.SaacContainer
 */
class SaacContainer
{
	var id:String;
	var content:String;
	var args:Array<SaacContainer>;

	public function new
	(
		id:String,
		content:String,
		args:Array<SaacContainer>
	)
	{
		this.id = id;
		this.content = content;
		this.args = args;
	}

	public static function restore(data:Dynamic):SaacContainer
	{
		//if it doesn't have id and content fields it likely be a json as string
		//we try to parse. This might fail, but in this case the caller passed wrong argument.
		if(!Reflect.hasField(data, "id") && !Reflect.hasField(data, "content"))
		{
			data = LibFunction.json_decode(data);
		}
		
		var args = new Array();
		if(Reflect.hasField(data, "args"))
		{
			for(i in 0...data.args.length)
			{
				args[i] = restore(data.args[i]);
			}
		}
		return new SaacContainer(data.id, data.content, args);
	}

	public static function createRaw(content:String)
	{
		return new SaacContainer("", content, []);
	}

	public static function fromDescriptor(descr:FunctionDescriptor)
	{
		return new SaacContainer(descr.getId(), descr.getName(), []);
	}

	public static function createFunction(func:String)
	{
		return new SaacContainer(func, func, []);
	}

	public static function createArray()
	{
		return new SaacContainer("", "", []);
	}

	public function resetArguments():SaacContainer
	{
		args = [];
		return this;
	}

	public function addArgument(arg:SaacContainer):SaacContainer
	{
		args[args.length] = arg;
		return this;
	}

	public function setArgument(index:Int, arg:SaacContainer):SaacContainer
	{
		args[index] = arg;
		return this;
	}

	public function serialize():Dynamic
	{
		var ar = [];
		for(i in 0...args.length)
		{
			ar[i] = args[i].serialize();
		}
		return
		{
			id: id,
			content: content,
			args: ar
		};
	}
	
	public function toString()
	{
		return "SaacFunction{ id: `"+id+"`, content: `"+content+"`, args: `"+args+"`}";
	}
}
