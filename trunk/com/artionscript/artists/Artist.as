package com.artionscript.artists 
{
	
	import com.artionscript.canvas.Canvas;
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
		
		public function Artist(canvas:Canvas, inspiration:Inspiration=null, palette:Palette=null)
		{
			this.canvas = canvas;
			this.inspiration = inspiration;
			this.palette = palette;
			
			this.inspiration.addEventListener(Inspiration.INSPIRATION_UPDATED, inspirationUpdated, false, 0, true);
			this.palette.addEventListener(Palette.PALETTE_UPDATED, paletteUpdated, false, 0, true);
		}
		
		public function create():void {}
		
		private function paletteUpdated(e:Event = null):void {}
		
		private function inspirationUpdated(e:Event = null):void{}
		
		protected function getRandomPaletteColour():uint {
			return palette.getRandomColour();
		}
		protected function getPaletteColourAtIndex(index:int):uint {
			return palette.getColourAtIndex(index);
		}	
		
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