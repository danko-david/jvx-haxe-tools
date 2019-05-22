package jvx.query;

class QueryTools
{
	public static function L(rel:LogicalRelation, units:Array<ConditionInterface>):ConditionInterface
	{
		return LogicalGroup.logicalGroup(rel, units);
	}

	public static function and(units:Array<ConditionInterface>):ConditionInterface
	{
		return LogicalGroup.logicalGroup(LogicalRelation.AND, units);
	}

	public static function or(units:Array<ConditionInterface>):ConditionInterface
	{
		return LogicalGroup.logicalGroup(LogicalRelation.OR, units);
	}

	public static function is(op:Operator, field:String, value:Dynamic):ConditionInterface
	{
		return new AtomicCondition(op, false, field, value);
	}

	public static function not(op:Operator, field:String, value:Dynamic):ConditionInterface
	{
		return new AtomicCondition(op, true, field, value);
	}
}
