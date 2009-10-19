package com.artionscript.inspirations 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Inspiration extends EventDispatcher
	{
		public static const INSPIRATION_UPDATED:String = "inspiration_updated";
		public static const INSPIRATION_STATE_CHANGED:String = "inspiration_state_changed";
		
		public static const IMAGE_TYPE:String = "image_type";
		public static const AUDIO_TYPE:String = "audio_type";
		public static const VIDEO_TYPE:String = "video_type";
		
		protected var _ready:Boolean = true;
		protected var _type:String;
		
		public function Inspiration() { }
		
		public function get ready():Boolean {
			return _ready;
		}
		public function set ready(ready:Boolean):void {
			_ready = ready;
			dispatchEvent(new Event(INSPIRATION_STATE_CHANGED));
		}
		
		public function get type():String {
			return _type;
		}
		public function set type(type:String):void {
			_type = type;
		}
	}
}