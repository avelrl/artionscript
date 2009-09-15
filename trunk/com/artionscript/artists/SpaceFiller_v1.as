package com.artionscript.artists 
{	
	import com.artionscript.tools.tools;
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
	 * http://www.levitated.net/daily/levEmotionFractal.html
	 * Inspired by Jared Tarbell's 'Emotional Fractal'
	 */
	public class SpaceFiller_v1 extends Artist
	{		
		
		private var fillRequests:Array = new Array();
		
		private const MIN_SIZE:int = 5;
		
		private const MAX_FILL_PERC:Number = .9;
		private const MIN_FILL_PERC:Number = .1;
				
		public function SpaceFiller_v1(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {	
			fillRegion(0, 0, canvas.cWidth, canvas.cHeight);
		}
		
		private function fillRegion(regionX:Number, regionY:Number, regionWidth:Number, regionHeight:Number):void {
			
			var widthHeightRatio:Number = 0.618034; //1.618034;
			var widthHeightInverseRatio:Number = 1 / widthHeightRatio;
										  
			var tempMaxWidth:Number;
			var tempMaxHeight:Number;
			var tempMinWidth:Number;
			var tempMinHeight:Number;
			//
			var maxObjectWidth:Number;
			var maxObjectHeight:Number;
			var minObjectWidth:Number
			var minObjectHeight:Number 
			
			var objectWidth:Number;
			var objectHeight:Number;

			//calculate max possible height
			tempMaxHeight = MAX_FILL_PERC * regionHeight;
			//calculate max possible width
			tempMaxWidth = MAX_FILL_PERC * regionWidth
			
			//calculate max width taking into account max height
			maxObjectWidth =  Math.min(tempMaxWidth, (tempMaxHeight * widthHeightInverseRatio));
			//calculate max height taking into account max width
			maxObjectHeight = Math.min((tempMaxHeight), (tempMaxWidth * widthHeightRatio));
			
			//calculate min width
			tempMinWidth = Math.max(MIN_FILL_PERC * regionWidth, MIN_SIZE);
			//calculate min height
			tempMinHeight = Math.max(MIN_FILL_PERC * regionHeight, MIN_SIZE);
			
			//calcualte min width taking into account min height
			minObjectWidth =  Math.min(tempMinWidth, (tempMinHeight * widthHeightInverseRatio));
			//calcualte min height taking into account min width
			minObjectHeight =  Math.min(tempMinHeight, (tempMinWidth * widthHeightRatio));

			if(maxObjectWidth>=MIN_SIZE && maxObjectHeight>=MIN_SIZE){
				objectWidth = minObjectWidth + (Math.random() * (maxObjectWidth - minObjectWidth))
				objectHeight = objectWidth * widthHeightRatio;
				
				var tempObject:tools;
				tempObject = drawObject(Math.ceil(objectWidth), Math.ceil(objectHeight));
				tempObject.x = Math.round((Math.random() * (regionWidth - tempObject.width)) + regionX);
				tempObject.y = Math.round((Math.random() * (regionHeight - tempObject.height)) + regionY);
				canvas.addChild(tempObject);
				
				var leftSpace:Number = (tempObject.x-regionX);
				var rightSpace:Number = regionWidth - ((tempObject.x-regionX) + tempObject.width);
				var topSpace:Number = (tempObject.y-regionY);
				var bottomSpace:Number = regionHeight - ((tempObject.y-regionY) + tempObject.height);
				
				if (leftSpace >= MIN_SIZE){
					fillRegion(regionX, tempObject.y, leftSpace, tempObject.height);
					
					if (topSpace >= MIN_SIZE) {
						fillRegion(regionX, regionY, leftSpace, topSpace);
					}

					if (bottomSpace >= MIN_SIZE) {
						fillRegion(regionX, (tempObject.y + tempObject.height), leftSpace, bottomSpace);
					}
				}
				
				
				if (rightSpace >= MIN_SIZE){
					fillRegion(tempObject.x + tempObject.width, tempObject.y, rightSpace, tempObject.height);
					
					if (topSpace >= MIN_SIZE) {
						fillRegion(tempObject.x + tempObject.width, regionY, rightSpace, topSpace);
					}
					
					if (bottomSpace >= MIN_SIZE) {
						fillRegion(tempObject.x + tempObject.width, (tempObject.y + tempObject.height), rightSpace, bottomSpace);
					}
				}
				
				if (topSpace >= MIN_SIZE) {
					fillRegion(tempObject.x, regionY, tempObject.width, topSpace);
				}
				
				if (bottomSpace >= MIN_SIZE) {
					fillRegion(tempObject.x, (tempObject.y + tempObject.height), tempObject.width, bottomSpace);
				}
				
			}
		}
	
		
		private function drawObject (width:Number, height:Number):tools {
			var lineVO:LineVO = null;
			var fillVO:FillVO = new FillVO();	
			fillVO.color = getRandomPaletteColour();
			
			var tempSquare:RectangleStamp;
			tempSquare = new RectangleStamp(width, height, 0, 0, fillVO, lineVO);
			
			return tempSquare;
		}
	}
}