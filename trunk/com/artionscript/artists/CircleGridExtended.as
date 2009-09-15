package com.artionscript.artists 
{

	import com.artionscript.canvas.Canvas;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	
	import com.artionscript.tools.stamps.EllipseStamp;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class CircleGridExtended extends Artist
	{		
		private const CIRCLE_DIAMETER:Number = 30;
		private const CIRCLE_SPACING:Number = 0;
		private const COLUMNS:int = 50;
		private const ROWS:int = 50;
		
		public function CircleGridExtended(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();
			//fillVO.color = Math.random() * 0xFFFFFF;
			
			var lineVO:LineVO = null;
			
			var smallCircleFiltersArray:Array = new Array();
			var largeCircleFiltersArray:Array = new Array();
			
			var smallCircleBlurFilter:BlurFilter = new BlurFilter();
			smallCircleBlurFilter.blurX = 2;
			smallCircleBlurFilter.blurY = 2;
			smallCircleBlurFilter.quality = 1;
			smallCircleFiltersArray.push(smallCircleBlurFilter);
			
			var largeCircleBlurFilter:BlurFilter = new BlurFilter();
			largeCircleBlurFilter.blurX = 2;
			largeCircleBlurFilter.blurY = 2;
			largeCircleBlurFilter.quality = 1;
			//largeCircleFiltersArray.push(largeCircleBlurFilter);
			
			var dropShadowFilter:DropShadowFilter = new DropShadowFilter();
			dropShadowFilter.angle = 45;
			dropShadowFilter.color = 0x000000;
			dropShadowFilter.distance = 5;
			dropShadowFilter.strength = 1;
			smallCircleFiltersArray.push(dropShadowFilter);
			largeCircleFiltersArray.push(dropShadowFilter)

			var columns:int = Math.floor(canvas.cWidth / CIRCLE_DIAMETER);
			var rows:int = Math.floor(canvas.cHeight / CIRCLE_DIAMETER);
			
			var tempCircle:EllipseStamp;
			var largeCircleArray:Array = new Array();
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					
					fillVO.color = getRandomPaletteColour();
					
					if (Math.floor(Math.random() * 3) == 2){
						tempCircle = new EllipseStamp();
						tempCircle.alpha = 0;
					}else if (Math.floor(Math.random() * 50) == 49){
						tempCircle = new EllipseStamp(CIRCLE_DIAMETER*3,CIRCLE_DIAMETER*3,fillVO,lineVO,true);
						largeCircleArray.push(tempCircle);
						tempCircle.filters = largeCircleFiltersArray;
					}else{
						tempCircle = new EllipseStamp(CIRCLE_DIAMETER, CIRCLE_DIAMETER, fillVO, lineVO, true);
						tempCircle.filters = smallCircleFiltersArray;
					}
					
					tempCircle.x = j * (CIRCLE_DIAMETER + CIRCLE_SPACING);
					tempCircle.y = i * (CIRCLE_DIAMETER + CIRCLE_SPACING);

					canvas.addChild(tempCircle);
				}
			}
			
			for (var k:int = 0; k < largeCircleArray.length; k++) {
				canvas.addChild(largeCircleArray[k]);
			}
		}
	}
}