package jvx.validation;

class ValidationResult
{
	var valid:Bool;
	var reportEntries:Array<ValidationEntry>;

	public function new(valid:Bool, reportEntries:Array<ValidationEntry>)
	{
		this.valid = valid;
		this.reportEntries = reportEntries;
	}

	public function isValid():Bool
	{
		return valid;
	}

	public function getValidationEntries():Array<ValidationEntry>
	{
		return reportEntries;
	}

	public static function parse(data:Dynamic):ValidationResult
	{
		return new ValidationResult
		(
			data.valid,
			ValidationEntry.parseEntries(cast data.reportEntries)
		);
	}
}
