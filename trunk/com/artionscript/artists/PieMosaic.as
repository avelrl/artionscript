package com.artionscript.artists 
{

	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	import com.artionscript.canvas.Canvas;
	
	import com.artionscript.tools.stamps.PieStamp;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class PieMosaic extends Artist
	{		
		private const PIE_RADIUS:Number = 100;
		private const PIE_SPACING:Number = 1;
		
		public function PieMosaic(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();		
			var lineVO:LineVO = new LineVO();
			//lineVO.thickness = 1;
			//lineVO.alpha = 1;
			//lineVO.pixelHinting = true;
					
			var columns:int = Math.floor(canvas.cWidth / PIE_RADIUS);
			var rows:int = Math.floor(canvas.cHeight / PIE_RADIUS);
			
			var tempPie:PieStamp;
			var tempOrientation:int;
			var tempXOffset:int;
			var tempYOffset:int;
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					tempXOffset = 0;
					tempYOffset = 0;
					
					fillVO.color = getRandomPaletteColour();
					//lineVO.color = 0x333333;
					
					tempOrientation = Math.floor(Math.random() * 4);
					
					if (Math.floor(Math.random() * 5) != 0) {
						if (tempOrientation == 0){
							tempPie = new PieStamp(PIE_RADIUS, 90, 0, fillVO, lineVO);
						}else if (tempOrientation == 1){
							tempPie = new PieStamp(PIE_RADIUS, 90, 90, fillVO, lineVO);
							tempXOffset = PIE_RADIUS;
						}else if (tempOrientation == 2){
							tempPie = new PieStamp(PIE_RADIUS, 90, 180, fillVO, lineVO);
							tempXOffset = PIE_RADIUS;
							tempYOffset = PIE_RADIUS;
						}else if (tempOrientation == 3){
							tempPie = new PieStamp(PIE_RADIUS, 90, 270, fillVO, lineVO);
							tempYOffset = PIE_RADIUS;
						}
						
						tempPie.x = (j * (PIE_RADIUS + PIE_SPACING))+ tempXOffset;
						tempPie.y = (i * (PIE_RADIUS + PIE_SPACING))+ tempYOffset;;
						canvas.addChild(tempPie);
					}
				}
			}
		}
	}
}