package com.artionscript.artists 
{
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	import com.artionscript.canvas.Canvas;
	
	import com.artionscript.tools.stamps.RectangleStamp;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class SquareGrid extends Artist
	{		
		private const SQUARE_SIDE:Number = 30;
		private const SQUARE_SPACING:Number = 2;
		
		public function SquareGrid(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();
			//fillVO.color = 0xFFFFFF//
			//fillVO.color = Math.random()*0xFFFFFF
			
			var lineVO:LineVO = null;
					
			
			var columns:int = Math.floor(canvas.cWidth / SQUARE_SIDE);
			var rows:int = Math.floor(canvas.cHeight / SQUARE_SIDE);
			
			var tempSquare:RectangleStamp;
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					fillVO.color = getRandomPaletteColour();
					
					tempSquare = new RectangleStamp(SQUARE_SIDE,SQUARE_SIDE,0,0,fillVO,lineVO);
					tempSquare.x = j * (SQUARE_SIDE + SQUARE_SPACING);
					tempSquare.y = i * (SQUARE_SIDE + SQUARE_SPACING);
					
					canvas.addChild(tempSquare);
					
					//fillVO.color -= ONE_GREY_COLOUR_STEP;
				}
			}
		}
	}
}