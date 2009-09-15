package com.artionscript.artists 
{
	//http://theflashblog.com/?p=429 - http://leebrimelow.googlecode.com/svn/trunk/as3/com/theflashblog/drawing/Arc.as
	//Lee Brimelow's 'Arc' class is fundemental to this 'Artist'
	
	import com.artionscript.tools.stamps.ArcStamp;
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
	public class Tunnel extends Artist
	{				
		public function Tunnel(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			var angle:int = 180;
			var startingPoint:int = 0;
			
			var numberOfLines:int = 500;
			var numberOfArcs:int = 1;
			
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
			var tempRadius:Number;
			var tempArc:ArcStamp;
			for (var i:int = 0; i < startingPoints; i++ )
			{
				xStartingPoint = canvas.cWidth/2
				yStartingPoint = (canvas.cHeight/2)-600;
				
				for (var j:int=0; j < numberOfLines; j++){
					
					tempX = xStartingPoint;
					//tempY = yStartingPoint;
					
					for (var k:int=0; k < numberOfArcs; k++){
						
						tempRadius = (Math.random()*600) + 150
						
						lineVO.color = getRandomPaletteColour();
						fillVO.color = lineVO.color;
						
						angle = angle * -1
						
						tempArc = new ArcStamp(tempRadius, angle, 0, null, lineVO, true);
						
						tempArc.x = tempX; 
						tempArc.y = yStartingPoint + tempRadius;
						
						tempX += Math.cos((startingPoint / 180) * Math.PI) * tempRadius;
						//tempY += Math.sin((startingPoint / 180) * Math.PI) * tempRadius;
						
						canvas.addChild(tempArc);
					}
				}
			}	
		}
	}
}