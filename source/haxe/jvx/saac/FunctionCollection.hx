package jvx.saac;

class FunctionCollection
{
  public static function load(api:SaacApi):FunctionCollection
  {
    return new FunctionCollection(api.listFunctions());
  }

  var funcs:Array<FunctionDescriptor>;
  public function new(funcs:Array<FunctionDescriptor>)
  {
    this.funcs = funcs;
  }

  /**
   * Returns the function with the simplified name, otherwise throws exception
   */
  public function ensureGetFunction(name:String):FunctionDescriptor
  {
    var ret:FunctionDescriptor = null;
    var search:String = "."+name;
    for(f in funcs)
    {
      if(StringTools.endsWith(f.getId(), search))
      {
        if(null != ret)
        {
          throw "Requested function is not unique. Function name ("+name+") appears in multiple in different namespace: "+ret.getId()+" & "+f.getId();
        }
        ret = f;
      }
    }

    if(null == ret)
    {
      throw "Requested function ("+name+") doesn't exists.";
    }
    return ret;
  }

  public function ensureCreateContainer(name:String):SaacContainer
  {
    return SaacContainer.fromDescriptor(ensureGetFunction(name));
  }
}
