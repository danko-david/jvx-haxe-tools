package jvx.interfaces;

interface Serializable
{
	public function serializeState():Dynamic;
	public function restoreState(data:Dynamic):Void;
}
