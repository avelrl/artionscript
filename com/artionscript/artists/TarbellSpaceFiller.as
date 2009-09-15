package com.artionscript.artists 
{	
	import com.artionscript.tools.Tool;
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
	 * 
	 * Concepts from Jared Tarbell's 'Emotional Fractal' make up the majority of this 'Artist'
	 * http://www.levitated.net/daily/levEmotionFractal.html
	 */
	public class TarbellSpaceFiller extends Artist
	{		
		
		private var fillRequests:Array = new Array();
		
		private const DESIRED_MINIMUM_WIDTH:int = 50;
		private const MAXIMUM_WIDTH:int = 500;
		
		private const MINIMUM_SIZE:int = 1;
		
		private const MAX_PERC_REGION_WIDTH:Number = .9;
		private const MIN_PERC_REGION_WIDTH:Number = .1;
		
		private const OBJECT_WIDTH:int = 5;
		private const OBJECT_HEIGHT:int = 5;
		
		public function TarbellSpaceFiller(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {	
			fillRegion(0, 0, canvas.cWidth, canvas.cHeight);
		}
		
		private function fillRegion(regionX:Number, regionY:Number, regionWidth:Number, regionHeight:Number):void {
			
			var percRegionWidth:Number;			
			if (regionWidth<DESIRED_MINIMUM_WIDTH) {
				percRegionWidth = 1;
			} else {
				percRegionWidth = (Math.random() * (MAX_PERC_REGION_WIDTH - MIN_PERC_REGION_WIDTH)) + MIN_PERC_REGION_WIDTH;
			}
			
			var tempWidth:Number = percRegionWidth * regionWidth
			if (tempWidth > MAXIMUM_WIDTH) {
				tempWidth = MAXIMUM_WIDTH;
			}
			var tempHeight:Number = tempWidth * (OBJECT_HEIGHT / OBJECT_WIDTH)
			
			if (tempHeight>regionHeight) {
				// recalculate width to fit height
				tempHeight = regionHeight
				tempWidth = tempHeight * ( OBJECT_WIDTH / OBJECT_HEIGHT);
			}
			
			var tempObject:Tool = drawObject(Math.ceil(tempWidth), Math.ceil(tempHeight));
			canvas.addChild(tempObject);
			
			var newRegionX:Number;
			var newRegionWidth:Number;
			var objectY:Number;
			var newRegionHeight:Number;

			if (Math.round(Math.random())) {
				//place left
				tempObject.x = regionX;

				newRegionX = regionX + tempObject.width;
				newRegionWidth = regionWidth - tempObject.width;
				
				if (Math.round(Math.random())) {
					//place top
					tempObject.y = regionY;
					
					if(newRegionWidth>2 && (regionY+tempObject.height)>=MINIMUM_SIZE){
						//fill region to right
						fillRegion(newRegionX, regionY, newRegionWidth, tempObject.height);
					}
					if((regionHeight-tempObject.height)>=MINIMUM_SIZE){
						//fill region below
						fillRegion(regionX, regionY + tempObject.height, regionWidth, regionHeight - tempObject.height);
					}
				} else {
					//place bottom
					objectY = (regionHeight + regionY) - tempObject.height;
					
					tempObject.y = objectY;
					
					//fill region to right
					if(newRegionWidth>MINIMUM_SIZE && (tempObject.height)>=MINIMUM_SIZE){
						fillRegion(newRegionX, objectY, newRegionWidth, tempObject.height);
					}
					//fill region above
					if (regionHeight - tempObject.height >=MINIMUM_SIZE){
						fillRegion(regionX, regionY, regionWidth, regionHeight-tempObject.height);
					}
				}
			} else {
				//place right
				tempObject.x = (regionWidth + regionX) - tempObject.width;
				
				newRegionX = regionX
				newRegionWidth = regionWidth - tempObject.width;				
				
				if (Math.round(Math.random())) {
					//place top
					tempObject.y = regionY;
					
					if (newRegionWidth >= MINIMUM_SIZE && tempObject.height >= MINIMUM_SIZE){
						//fill region to left
						fillRegion(regionX, regionY, newRegionWidth, tempObject.height);
					}
					
					if (regionHeight - tempObject.height >= MINIMUM_SIZE){
						//fill region below
						fillRegion(regionX, regionY + tempObject.height, regionWidth, regionHeight - tempObject.height);
					}
				} else {
					// place bottom
					objectY = (regionHeight + regionY) - tempObject.height;
					
					tempObject.y = objectY
					
					if (newRegionWidth >= MINIMUM_SIZE && tempObject.height >= MINIMUM_SIZE){
						// fill region to left
						fillRegion(regionX, objectY, newRegionWidth, tempObject.height);
					}
					
					if (regionHeight - tempObject.height >= MINIMUM_SIZE){
						// fill region above
						fillRegion(regionX, regionY, regionWidth, regionHeight - tempObject.height);
					}
				}
			}
		}
	
		
		private function drawObject (width:Number, height:Number):Tool {
			var lineVO:LineVO = null;
			var fillVO:FillVO = new FillVO();	
			fillVO.color = getRandomPaletteColour();
			
			var tempSquare:RectangleStamp;
			tempSquare = new RectangleStamp(width, height, 0, 0, fillVO, lineVO);
			
			return tempSquare;
		}
	}
}