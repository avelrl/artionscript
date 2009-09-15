package com.artionscript.artists 
{
	//http://theflashblog.com/?p=429 - http://leebrimelow.googlecode.com/svn/trunk/as3/com/theflashblog/drawing/Arc.as
	//Lee Brimelow's 'Arc' class is fundemental to this 'Artist'
	
	import com.artionscript.tools.stamps.ArcStamp;
	import com.artionscript.tools.stamps.EllipseStamp;
	import flash.display.Sprite;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class ArcTrails extends Artist
	{				
		public function ArcTrails(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			
			var radius:int = 25;

			var numberOfLines:int = 10;
			var numberOfArcs:int = 100;
			
			var startingPoints:int = 10;
			var xStartingPoint:Number;
			var yStartingPoint:Number;
			
			var fillVO:FillVO = new FillVO();
			
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 1;
			lineVO.alpha = 1;
			lineVO.pixelHinting = true;
				
			var tempX:Number;
			var tempY:Number;
			var tempAngle:Number = 180;
			var tempStartingAngle:Number = 0;
			var tempArc:ArcStamp;
			var tempCircle:EllipseStamp;
			for (var i:int = 0; i < startingPoints; i++ )
			{
				xStartingPoint = canvas.cWidth/2
				yStartingPoint = canvas.cHeight/2;
				//xStartingPoint = Math.random() * canvas.cWidth;
				//yStartingPoint = Math.random() * canvas.cHeight;
				
				for (var j:int=0; j < numberOfLines; j++){
					
					tempX = xStartingPoint;
					tempY = yStartingPoint;
					
					lineVO.color = getRandomPaletteColour();
					fillVO.color = lineVO.color;
					
					for (var k:int=0; k < numberOfArcs; k++){
						//tempAngle = ((Math.random() * 720) - 360)
						tempAngle += ((Math.random() * 90) - 45)
						tempAngle = tempAngle%360;
						tempStartingAngle += ((Math.random() * 90)-45);

						tempArc = new ArcStamp(radius, tempAngle, tempStartingAngle, null, lineVO, false);
						
						tempArc.x = tempX; 
						tempArc.y = tempY; 
						
						//canvas.addChild(tempArc);
						
						var angle:Number = (tempStartingAngle / 180) * Math.PI;
						
						var ax:Number = 0 - Math.cos(angle) * radius;
						var ay:Number = 0 - Math.sin(angle) * radius;
						
						angle += ((tempAngle / 180) * Math.PI);
						
						var bx:Number = ax + Math.cos(angle) * radius;
						var by:Number = ay + Math.sin(angle) * radius;
						
						tempX += bx
						tempY += by
						
						tempCircle = new EllipseStamp(5, 5, fillVO, lineVO, true);
						tempCircle.x = tempX
						tempCircle.y = tempY
						
						canvas.addChild(tempCircle);
						
					}
				}
			}	
		}
	}
}