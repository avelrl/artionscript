package com.artionscript.palettes 
{
	import adobe.utils.ProductManager;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Palette extends EventDispatcher
	{
		public static const PALETTE_UPDATED:String = "palette_updated";
		public static const PALETTE_STATE_CHANGED:String = "palette_state_changed";
		
		private var _colours:Array;
		
		private var _ready:Boolean = true;
		
		public function Palette()
		{	
			_colours = new Array();
		}
		
		public function addColours(colours:Array):void {
			this.colours = this.colours.concat(colours);
		}
		
		public function getRandomColour():uint {
			if (_colours && _colours.length != 0) {
				return _colours[Math.floor(Math.random() * _colours.length)];
			}else {
				return 0x000000;
			}
		}
		
		public function getColourAtIndex(index:int):uint {
			if (_colours && index < _colours.length) {
				return _colours[index];
			}else {
				return 0x000000;
			}
		}
		
		public function get colours():Array {
			return _colours;
		}
		
		public function set colours(colours:Array):void {
			_colours = colours;
		}
		
		public function get ready():Boolean {
			return _ready;
		}
	}
}