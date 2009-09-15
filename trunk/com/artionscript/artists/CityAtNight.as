package com.artionscript.artists 
{
	import com.artionscript.tools.stamps.FreeDrawStamp;
	import flash.display.Sprite;	
	import flash.filters.GlowFilter;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.stamps.EllipseStamp;
	import com.artionscript.tools.brushes.RegularLineBrush;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class CityAtNight extends Artist
	{				
		//background colour #010018
		public function CityAtNight(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var length:int = 100;
			var angleVariation:int = 290;
			
			var numberOfUniqueLines:int = 30
			var numberOfTurns:int = 100;
			
			var startingPoints:int = 3;
			var xStartingPoint:Number;
			var yStartingPoint:Number;
			
			var fillVO:FillVO = new FillVO();
			
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 1;
			lineVO.alpha = 1;
			lineVO.pixelHinting = true;
			
			var circleGlowFilter:GlowFilter = new GlowFilter();
			circleGlowFilter.blurX = 10;
			circleGlowFilter.blurY = 10;
			circleGlowFilter.strength = 8;
			circleGlowFilter.quality = 3;
			
			var glowFilter:GlowFilter = new GlowFilter();
			glowFilter.blurX = 5;
			glowFilter.blurY = 5;
			glowFilter.strength = 1;
			glowFilter.quality = 1;
			
			var tempX:Number;
			var tempY:Number;
			var tempAngle:Number = 0;
			var tempLine:FreeDrawStamp;
			var tempCircle:EllipseStamp;
			for (var i:int = 0; i < startingPoints; i++ )
			{
				xStartingPoint = Math.random() * canvas.cWidth;
				yStartingPoint = Math.random() * canvas.cHeight;
				
				for (var j:int = numberOfUniqueLines; j >= 0; j--){
					tempX = xStartingPoint;
					tempY = yStartingPoint;
					
					lineVO.color = getRandomPaletteColour();
					tempLine = new FreeDrawStamp(null, lineVO);
					tempLine.moveTo(tempX, tempY);
					for (var k:int = numberOfTurns; k >= 0; k--){
						lineVO.color = getRandomPaletteColour();
						
						switch (Math.floor(Math.random() * 3)) {
							case 0:
								tempAngle-= angleVariation;
								break;
							case 1:
								tempAngle = tempAngle;
								break;
							case 2:
								tempAngle += angleVariation;
								break;
						}
						
						tempLine.angleTo(length, tempAngle, tempX, tempY);

						tempX += Math.cos((tempAngle/ 180) * Math.PI) * length;
						tempY += Math.sin((tempAngle/ 180) * Math.PI) * length;
					}
					canvas.addChild(tempLine);
					
					glowFilter.color = lineVO.color;
					tempLine.filters = new Array(glowFilter);
					
					fillVO.color = lineVO.color;
					circleGlowFilter.color = fillVO.color;
					
					tempCircle = new EllipseStamp(5, 5, fillVO, lineVO, true);
					tempCircle.filters = new Array(circleGlowFilter);
					
					tempCircle.x = tempX
					tempCircle.y = tempY
					canvas.addChild(tempCircle);
				}
			}
		}
	}
}