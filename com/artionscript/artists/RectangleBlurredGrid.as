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
	public class RectangleBlurredGrid extends Artist
	{		
		private const RECTANGLE_SIDE:Number = 30;
		private const RECTANGLE_SPACING:Number = 0;
		
		public function RectangleBlurredGrid(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();
			//fillVO.color = 0xFFFFFF
			//fillVO.color = Math.random()*0xFFFFFF
			
			var lineVO:LineVO = null;
			
			var tempAlpha:Number = 1//.8;
			
			var blur:BlurFilter = new BlurFilter();
			blur.blurX = 0;
			blur.blurY = 10;
			blur.quality = 1;
			var filterArray:Array = new Array(blur);
			
			var columns:int = Math.floor(canvas.cWidth / RECTANGLE_SIDE);
			var rows:int = Math.floor(canvas.cHeight / RECTANGLE_SIDE);
			
			var tempRectangle:RectangleStamp;
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					fillVO.color = getRandomPaletteColour();
					
					//if (Math.floor(Math.random() * 3) == 2){
				//		tempRectangle = new RectangleStamp();
					//	tempRectangle.alpha = 0;
					//}else{
						tempRectangle = new RectangleStamp(RECTANGLE_SIDE, RECTANGLE_SIDE + (Math.random() * (RECTANGLE_SIDE * 3)), 0, 0, fillVO, lineVO);
					//}
					
					tempRectangle.x = j * (RECTANGLE_SIDE + RECTANGLE_SPACING);
					tempRectangle.y = i * (RECTANGLE_SIDE + RECTANGLE_SPACING);
					
					tempRectangle.alpha = tempAlpha;
					
					//tempRectangle.filters = filterArray;
					
					canvas.addChild(tempRectangle);
					
					//fillVO.color -= ONE_GREY_COLOUR_STEP;
				}
			}
		}
	}
}