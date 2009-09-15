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
	public class PantonCurves extends Artist
	{				
		public function PantonCurves(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			
			var radius:int = 100;

			var numberOfLines:int = 1;
			var numberOfArcs:int =24;
			
			var startingPoints:int = 15;
			var xStartingPoint:Number;
			var yStartingPoint:Number;
			
			var fillVO:FillVO = new FillVO();
			
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 15;
			lineVO.alpha = 1;
			lineVO.pixelHinting = true;
				
			var tempX:Number;
			var tempY:Number;
			var tempAngle:Number = 180;
			var tempStartingAngle:Number = 0;
			var tempArc:ArcStamp;
			for (var i:int = 0; i < startingPoints; i++ )
			{
				xStartingPoint = Math.random() * canvas.cWidth;
				yStartingPoint = Math.random() * canvas.cHeight;
				
				for (var j:int=0; j < numberOfLines; j++){
					
					tempX = xStartingPoint;
					tempY = yStartingPoint;
					
					lineVO.color = getRandomPaletteColour();
					//fillVO.color = lineVO.color;
					
					for (var k:int=0; k < numberOfArcs; k++){
						tempAngle += 0//((Math.random() * -180))
						tempAngle *= -1
						tempAngle = tempAngle%360;
						tempStartingAngle += 15; //(Math.random() * 90) - 45;
						
						
						for (var m:int = 0; m < 8; m++){
							lineVO.color = getPaletteColourAtIndex(m);
							tempArc = new ArcStamp(radius, tempAngle, tempStartingAngle, null, lineVO, false);
							tempArc.x = tempX; 
							tempArc.y = tempY + (lineVO.thickness * (m*0.8));
							canvas.addChild(tempArc);
						}		
						
						var angle:Number = (tempStartingAngle / 180) * Math.PI;
						
						var ax:Number = 0 - Math.cos(angle) * radius;
						var ay:Number = 0 - Math.sin(angle) * radius;
						
						angle += ((tempAngle / 180) * Math.PI);
						
						var bx:Number = ax + Math.cos(angle) * radius;
						var by:Number = ay + Math.sin(angle) * radius;
						
						tempX += bx
						tempY += by						
					}
				}
			}	
		}
	}
}