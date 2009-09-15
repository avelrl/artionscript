package com.artionscript.canvas 
{
	import flash.system.System;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Canvas extends Sprite
	{
		private var _cWidth:Number;
		private var _cHeight:Number;
		private var _backing:Sprite;
		
		public function Canvas(cWidth:Number = 4000, cHeight:Number = 3000, colour:uint = 0xFFFFFF) 
		{
			this.cWidth = cWidth;
			this.cHeight = cHeight;
			
			_backing = new Sprite();
			_backing.graphics.beginFill(colour);
			_backing.graphics.drawRect(0, 0, cWidth, cHeight);
			_backing.graphics.endFill();
			addChild(_backing);
		}
		
		public function clear():void {
			//remove all but the backing
			while( this.numChildren > 1 ){
				this.removeChildAt(1);
			}
			System.gc()
		}
		
		public function get cWidth():Number {
			return _cWidth;
		}
		public function set cWidth(cWidth:Number):void {
			_cWidth = cWidth;
		}
		
		public function get cHeight():Number {
			return _cHeight;
		}
		public function set cHeight(cHeight:Number):void {
			_cHeight = cHeight;
		}
	}
}



