package jvx.validation;

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
  	transaltionVariables:Map<String, String>
  )
  {
    this.propertyName = propertyName;
    this.translationSymbol = translationSymbol;
    this.translationVariables = transaltionVariables;
  }
}
