package jvx.database;

import jvx.interfaces.Serializable;
import jvx.api.DatabaseApi;
import jvx.query.QueryTools;
import jvx.query.Operator;

import jvx.lang.LibFunction;
import haxe.Int64;

class DbModel implements Serializable
{
	var id:Int;
	var modelClass:String;

	var lastModify:Int64;
	var createdOn:Int64;

	var modelExtraData:Dynamic;

	public function new()
	{
		modelExtraData = {};
	}

	public function getId():Int
	{
		return id;
	}

	public function getModelClass():String
	{
		return modelClass;
	}

	public function beforeSerialize(){}
	public function afterSerialize(){}

	public function beforeRestore(){}
	public function afterRestore(){}

	public function serializeState():Dynamic
	{
		beforeSerialize();
		var ret = {};
		Reflect.setField(ret, "do", id);
		Reflect.setField(ret, "class", modelClass);
		for(n in Reflect.fields(this))
		//for(n in Type.getInstanceField(this.getClass()))
		{
			Reflect.setField(ret, n, Reflect.field(this, n));
		}

		for(e in Reflect.fields(modelExtraData))
		{
			Reflect.setField(ret, e, Reflect.field(this, e));
		}
		afterSerialize();
		return ret;
	}

	public function restoreState(data:Dynamic):Void
	{
		beforeRestore();
		id = Reflect.field(data, "do");
		modelClass = Reflect.field(data, "class");
		for(n in Reflect.fields(data))
		{
			if(Reflect.hasField(this, n))
			{
				Reflect.setField(this, n,	Reflect.field(data, n));
			}
			else if("do" != n && "class" != n)
			{
				Reflect.setField(modelExtraData, n, Reflect.field(data, n));
			}
		}
		afterRestore();
	}

	public function getDefaultModelClass()
	{
		return "hu.ddsi.java.database.GenericStorable";
	}

	public function selectIdentical(db:DatabaseApi):Array<Dynamic>
	{
		return db.select(getDefaultModelClass(), QueryTools.is(Operator.EQ, "do", getId()), null);
	}

	public function refreshFromDb(db:DatabaseApi):Bool
	{
		var ret:Array<Dynamic> = selectIdentical(db);
		if(0 != ret.length)
		{
			restoreState(ret[0]);
			return true;
		}

		return false;
	}

	public function ensureExsits(db:DatabaseApi)
	{
		if(!refreshFromDb(db))
		{
			var validate = db.create(getDefaultModelClass(), serializeState());
			var ret = selectIdentical(db);
			if(0 == ret.length)
			{
				throw "ensureExists failed: "+LibFunction.json_encode(validate)+" for object: "+LibFunction.json_encode(serializeState());
			}
			restoreState(ret[0]);
		}
	}
}
