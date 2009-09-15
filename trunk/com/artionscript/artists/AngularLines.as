package com.artionscript.artists 
{
	import flash.display.Sprite;	
	import flash.filters.GlowFilter;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;

	import com.artionscript.tools.brushes.RegularLineBrush;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class AngularLines extends Artist
	{				
		public function AngularLines(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var length:int = 100;
			var angleVariation:int = 290;
			
			var numberOfUniqueLines:int = 40;
			var numberOfTurns:int = 40;
			
			var startingPoints:int = 1;
			var xStartingPoint:Number;
			var yStartingPoint:Number;
			
			var fillVO:FillVO = new FillVO();
			
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 1;
			lineVO.alpha = 1;
			lineVO.pixelHinting = true;
						
			var tempX:Number;
			var tempY:Number;
			var tempAngle:Number;
			var tempLine:RegularLineBrush;
			for (var i:int = 0; i < startingPoints; i++ )
			{
				xStartingPoint = canvas.cWidth/2
				yStartingPoint = canvas.cHeight/2;
				
				for (var j:int = numberOfUniqueLines; j >= 0; j--){
					tempX = xStartingPoint;
					tempY = yStartingPoint;
					tempAngle = Math.random()*360;
					for (var k:int = numberOfTurns; k >= 0; k--){
						lineVO.color = getRandomPaletteColour();
						
						switch (Math.floor(Math.random() * 3)) {
							case 0:
								tempAngle -= angleVariation;
								break;
							case 1:
								tempAngle = tempAngle;
								break;
							case 2:
								tempAngle += angleVariation;
								break;
						}
						
						tempLine = new RegularLineBrush(length,tempAngle,lineVO);
						tempLine.x = tempX; 
						tempLine.y = tempY; 
						
						tempX += Math.cos((tempAngle/ 180) * Math.PI) * length;
						tempY += Math.sin((tempAngle/ 180) * Math.PI) * length;
						
						canvas.addChild(tempLine);
					}
				}
			}
		}
	}
}