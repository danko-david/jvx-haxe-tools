package jvx.query;


class AtomicCondition implements ConditionInterface
{
	var operator:Operator;
	var negate:Bool;
	var field:String;
	var value:Dynamic;

	public function new(operator:Operator, negate:Bool, field:String, val:Dynamic)
	{
		this.operator = operator;
		this.negate = negate;
		this.field = field;
		this.value = val;
	}

	public function getOperator():Operator
	{
		return operator;
	}

	public function isNegated():Bool
	{
		return negate;
	}

	public function getFieldName():String
	{
		return field;
	}

	public function getValue():Dynamic
	{
		return value;
	}

	public function toString()
	{
		return field+" "+(negate?"!":"")+operator+" "+value;
	}

	public static function parse(ac:Dynamic):AtomicCondition
	{
		//TODO parse
		var op:Operator = cast ac.o;
		var neg:Bool = cast ac.n;
		var f:String = cast ac.f;
		var val = ac.v;
		return new AtomicCondition(op, neg, f, val);
	}

	public function serialize():Dynamic
	{
		var arr:Map<String, Dynamic> = new Map();
		arr["o"] = operator.getName();
		arr["n"] = negate;
		arr["f"] = field;
		arr["v"] = value;
		return arr;
	}
}
