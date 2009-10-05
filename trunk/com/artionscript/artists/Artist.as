package com.artionscript.artists 
{
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.RectangleStamp;
	import com.artionscript.tools.Tool;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import com.artionscript.palettes.Palette;
	import com.artionscript.inspirations.Inspiration;
	
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Artist
	{
		public static const ONE_GREY_COLOUR_STEP:Number = 0x010101;
		
		private var _canvas:Canvas;
		private var _inspiration:Inspiration;
		private var _palette:Palette;
		
		protected var _toolArray:Array;
		
		public function Artist(canvas:Canvas, inspiration:Inspiration=null, palette:Palette=null)
		{
			this.canvas = canvas;
			this.inspiration = inspiration;
			this.palette = palette;
			
			this.inspiration.addEventListener(Inspiration.INSPIRATION_UPDATED, inspirationUpdated, false, 0, true);
			this.palette.addEventListener(Palette.PALETTE_UPDATED, paletteUpdated, false, 0, true);
		}
		
		public function repaint():void {
			_toolArray = null;
			canvas.clear();
			create();
		}
		
		protected function setVariables():void { }
		
		public function create():void { }
		
		protected function finaliseCreate():void {
			if (_toolArray && _toolArray.length != 0)
			{
				var tempTool:Tool;
				var toolArrayLength:int = _toolArray.length - 1;
				for (var j:int = toolArrayLength; j>=0; j--) {
					tempTool = _toolArray[j] as Tool;
					this.canvas.addChild(tempTool);
				}
			}
		}
		
		protected function buildTool(...args):Tool {
			return createTool(0, 0, null, null);
		}
		
		protected function createTool(width:Number=0, height:Number=0, fillVO:FillVO = null, lineVO:LineVO = null, ...args):Tool {
			return new RectangleStamp(width, height, 0, 0, fillVO, lineVO);
		}
		
		protected function getAColour(...args):uint {
			return getRandomPaletteColour();
		}
		protected function getRandomPaletteColour():uint {
			return palette.getRandomColour();
		}
		protected function getPaletteColourAtIndex(index:int):uint {
			return palette.getColourAtIndex(index);
		}
		
		protected function inspirationUpdated(e:Event = null):void { }
		
		protected function paletteUpdated(e:Event = null):void { }
		
		//*******************
		//GETTERS AND SETTERS
		//*******************
		public function get canvas():Canvas {
			return _canvas;
		}
		public function set canvas(canvas:Canvas):void {
			_canvas = canvas;
		}
		
		public function get inspiration ():Inspiration {
			return _inspiration;
		}
		public function set inspiration (inspiration:Inspiration):void {
			_inspiration = inspiration;
		}
		
		public function get palette ():Palette {
			return _palette;
		}
		public function set palette (palette:Palette):void {
			_palette = palette;
		}
	}
}