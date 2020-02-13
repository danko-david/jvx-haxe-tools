package jvx.lang;

import haxe.Json;

class LibFunction
{
	public static /*final*/ var DEFAULT_JSON_DECODE = function(json:String):Dynamic
	{
		return Json.parse(json);
	};
	
	public static /*final*/ var DEFAULT_JSON_ENCODE = function(data:Dynamic):String
	{
		return Json.stringify(data);
	};
	
	
	
	/**
	 * Built in library can't parse junky JSON format (json object with keys
	 * that's doesn't quoted with " or ') So if you project uses JSON like that,
	 * override (assign) this functions
	 *
	 */
	public static var json_decode = DEFAULT_JSON_DECODE;
	
	public static var json_encode = DEFAULT_JSON_ENCODE;
}