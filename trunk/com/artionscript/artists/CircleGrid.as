package com.artionscript.artists 
{

	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	
	import com.artionscript.canvas.Canvas;
	
	import com.artionscript.tools.stamps.EllipseStamp;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class CircleGrid extends Artist
	{		
		private const CIRCLE_DIAMETER:Number = 30;
		private const CIRCLE_SPACING:Number = 0;
		private const COLUMNS:int = 50;
		private const ROWS:int = 50;
		
		public function CircleGrid(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();
			//fillVO.color = Math.random() * 0xFFFFFF;
			
			var lineVO:LineVO = null;
			
			var columns:int = Math.floor(canvas.cWidth / CIRCLE_DIAMETER);
			var rows:int = Math.floor(canvas.cHeight / CIRCLE_DIAMETER);
			
			var tempCircle:EllipseStamp;
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					fillVO.color = getRandomPaletteColour();
					
					tempCircle = new EllipseStamp(CIRCLE_DIAMETER, CIRCLE_DIAMETER, fillVO, lineVO, true);

					tempCircle.x = j * (CIRCLE_DIAMETER + CIRCLE_SPACING);
					tempCircle.y = i * (CIRCLE_DIAMETER + CIRCLE_SPACING);
					
					canvas.addChild(tempCircle);
				}
			}
		}
	}
}