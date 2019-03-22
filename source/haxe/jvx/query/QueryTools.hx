package jvx.query;

class QueryTools
{
	public static function L(rel:LogicalRelation, units:Array<LogicalGroup>)
	{
		return LogicalGroup.logicalGroup(rel, units);
	}

	public static function is(op:Operator, field:String, value:Dynamic)
	{
		return new AtomicCondition(op, false, field, value);
	}

	public static function not(op:Operator, field:String, value:Dynamic)
	{
		return new AtomicCondition(op, true, field, value);
	}
}
