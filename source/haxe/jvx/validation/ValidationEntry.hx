package jvx.validation;

import haxe.DynamicAccess;
/**
 * Exact port of eu.javaexperience.verify.TranslationFriendlyValidationEntry
 */
class ValidationEntry
{
	public var propertyName:String;
	public var translationSymbol:String;
	public var translationVariables:Map<String, String>;

	public function new
	(
		propertyName:String,
		translationSymbol:String,
		translationVariables:Map<String, String> = null
	)
	{
		this.propertyName = propertyName;
		this.translationSymbol = translationSymbol;
		if(null == translationVariables)
		{
			this.translationVariables = new Map<String,String>();
		}
		else
		{
			this.translationVariables = translationVariables;
		}
	}

	public function toString():String
	{
		var vs:String = "";
		if(translationVariables.iterator().hasNext())
		{
			vs = " (";
			for(k in translationVariables)
			{
				vs += k +" => "+translationVariables[k]+"|";
			}
			vs += ")";
		}
		return "ValidationEntry["+propertyName+"] = "+translationSymbol+vs;
	}

	public static function parseEntry(from: Dynamic)
	{
		var vars:Map<String, String> = new Map<String, String>();
		if(null != from.translationVariables)
		{
			var tvs:DynamicAccess<String> = cast from.translationVariables;
			for(k in tvs.keys())
			{
					vars[k] = tvs[k];
			}
		}
		return new ValidationEntry(from.propertyName, from.translationSymbol, vars);
	}

	public static function parseEntries(from: Array<Dynamic>):Array<ValidationEntry>
	{
		var ret = [];
		for(i in 0...from.length)
		{
			ret[i] = parseEntry(from[i]);
		}
		return ret;
	}
}
