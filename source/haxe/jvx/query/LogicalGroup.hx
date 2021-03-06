package jvx.query;

import haxe.EnumTools;

class LogicalGroup implements ConditionInterface
{
	var lr:LogicalRelation;
	var components:Array<ConditionInterface>;
	var ac:AtomicCondition;

	private function new(lr:LogicalRelation, components:Array<ConditionInterface>, ac:AtomicCondition)
	{
		this.lr = lr;

		#if php
			if(!Std.is(components, Array))
			{
				components = cast(php.Lib.toHaxeArray(cast(components)));
			}
		#end
		this.components = components;
		this.ac = ac;
	}

	public static function atomicCondition(ac:AtomicCondition)
	{
		return new LogicalGroup(LogicalRelation.UNIT, null, ac);
	}

	public static function logicalGroup(lr:LogicalRelation, grp:Array<ConditionInterface>):ConditionInterface
	{
		return new LogicalGroup(lr, grp, null);
	}

	public function getLogicalRelation():LogicalRelation
	{
		return lr;
	}

	public function getAtomicCondition():AtomicCondition
	{
		return ac;
	}

	public function getLogicalGroups():Array<ConditionInterface>
	{
		return components;
	}

	public function toString()
	{
		if(null != ac)
		{
			return ac.toString();
		}

		var ret = "";

		for(c in components)
		{
			if(ret.length > 0)
			{
				ret = ret+" ";
				ret = ret+lr;
				ret = ret+" ";
			}
			ret = ret+c.toString();
		}

		return ret;
	}


	public static function parse(obj:Dynamic):ConditionInterface
	{
		var relation:LogicalRelation = Type.createEnum(LogicalRelation, cast obj.r);
		/*Map<String, Object>*/var atomicCondidition = obj.a;
		/*List<Map<String,Object>>*/ var comp:Array<Dynamic> = cast obj.c;

		if(null != atomicCondidition)
		{
			return atomicCondition(AtomicCondition.parse(atomicCondidition));
		}
		else
		{
			var lrs:Array<ConditionInterface> = new Array();
			for(i in 0...comp.length)
			{
				lrs[i] = parse(comp[i]);
			}

			return logicalGroup(relation, lrs);
		}
	}

	public function serialize():Dynamic
	{
		var ret = {};
		var a = null;
		var c = null;

		if(null != ac)
		{
			return {r: lr.getName(), a: ac.serialize()};
		}
		else
		{
			var lst:Array<Dynamic> = new Array();
			for(i in 0...components.length)
			{
				lst[i] = components[i].serialize();
			}

			return {r: lr.getName(), c: lst};
		}
	}
}
