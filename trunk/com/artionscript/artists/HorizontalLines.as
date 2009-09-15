package com.artionscript.artists 
{
	import com.artionscript.tools.brushes.RegularLineBrush;
	import flash.display.Sprite;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 * Inspired by Jared Tarbell's 'City Lines'
	 * http://www.levitated.net/daily/levCityLines.html
	 */
	public class HorizontalLines extends Artist
	{				
		public function HorizontalLines(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {	
			var fillVO:FillVO = new FillVO();
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 1;
			lineVO.alpha = 1;
			lineVO.pixelHinting = true;
				
			var tempLine:RegularLineBrush;
			var verticalStart:Number = 0;
			var tempY:Number;
			var tempX:Number;
			var tempLineLength:Number;
			var tempAngle:Number;
			var tempPrevAngle:Number;
			while(verticalStart<canvas.cHeight)
			{
				lineVO.color = getRandomPaletteColour();
				tempY = verticalStart
				tempX = 0;
				while(tempX<canvas.cWidth){
					tempLineLength = (Math.random() * 50) + 10;
					
					switch(Math.floor((Math.random() * 3)))
					{
						case 0:
							tempAngle = 0;
							break;
						case 1:
							if (tempPrevAngle != -90){
								tempAngle = 90;
							}
							break;
						case 2:
							if (tempPrevAngle != 90){
								tempAngle = -90;
							}
							break;
					}
					
					tempLine = new RegularLineBrush(tempLineLength,tempAngle,lineVO);
					tempLine.x = tempX;
					tempLine.y = tempY;
					
					canvas.addChild(tempLine);
					
					
					tempPrevAngle = tempAngle;
					tempX += Math.cos((tempAngle / 180) * Math.PI) * tempLineLength;
					tempY += Math.sin((tempAngle / 180) * Math.PI) * tempLineLength;
				}
				
				verticalStart += (Math.random() * 100) + 10;
			}	
		}
	}
}