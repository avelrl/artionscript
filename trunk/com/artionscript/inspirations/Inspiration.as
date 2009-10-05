package com.artionscript.inspirations 
{
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Inspiration extends EventDispatcher
	{
		public static const INSPIRATION_UPDATED:String = "inspiration_updated";
		
		private var _ready:Boolean = true;
		
		public function Inspiration() { }
		
		public function isReady():Boolean {
			return _ready;
		}
	}
}