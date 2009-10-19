package com.artionscript.artists.grid 
{
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	import com.artionscript.tools.stamps.RectangleStamp;
	
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.EllipseStamp;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class VariedGrid extends Grid
	{		
		
		protected var _largeToolArray:Array;
		protected var _largeToolFiltersArray:Array;
		protected var _smallToolFiltersArray:Array;
		
		public function VariedGrid(canvas:Canvas, inspiration:Inspiration = null, palette:Palette = null) {
			_largeToolFiltersArray = new Array();
			_smallToolFiltersArray = new Array();
			
			var blurFilter:BlurFilter = new BlurFilter();
			blurFilter.blurX = 2;
			blurFilter.blurY = 2;
			blurFilter.quality = 1;
			_largeToolFiltersArray.push(blurFilter);
			
			var smallToolBlurFilter:BlurFilter = new BlurFilter();
			smallToolBlurFilter.blurX = 2;
			smallToolBlurFilter.blurY = 2;
			smallToolBlurFilter.quality = 1;
			_smallToolFiltersArray.push(smallToolBlurFilter);
			
			var dropShadowFilter:DropShadowFilter = new DropShadowFilter();
			dropShadowFilter.angle = 45;
			dropShadowFilter.color = 0x000000;
			dropShadowFilter.distance = 5;
			dropShadowFilter.strength = 1;
			_largeToolFiltersArray.push(dropShadowFilter);
			_smallToolFiltersArray.push(dropShadowFilter);
			
			super(canvas, inspiration, palette);
		}
		
		//override variables
		override protected function setVariables():void {
			//externally define variables to avoid frequent updating/committing of class
			include "includes/VariedGridVariables.as";
		}
		
		override protected function buildTool(...args):Tool {
			if (!_largeToolArray) {
				_largeToolArray = new Array();
			}
			
			var tempWidth:Number = (Math.random() * (MAX_WIDTH - MIN_WIDTH)) + MIN_WIDTH;
			var tempTool:Tool;			
			if (Math.floor(Math.random() * 3) == 2){
				tempTool = createTool();
				tempTool.alpha = 0;
			}else if (Math.floor(Math.random() * 40) == 0){
				tempTool = createTool(tempWidth * 3, tempWidth * 3, args[0], args[1]);
				//tempTool.filters = _largeToolFiltersArray;
				_largeToolArray.push(tempTool);
			}else{
				tempTool = createTool(tempWidth, tempWidth, args[0], args[1]);
				//tempTool.filters = _smallToolFiltersArray;
			}
			
			return tempTool;
		}
		
		override protected function finaliseCreate():void {	
			super.finaliseCreate();
			
			if (_largeToolArray && _largeToolArray.length != 0)
			{
				var tempTool:Tool;
				var arrLen:int = _largeToolArray.length - 1;
				for (var j:int = arrLen; j>=0; j--) {
					tempTool = _largeToolArray[j];
					canvas.addChild(tempTool);
				}
			}
		}
		
		override public function repaint():void {
			_largeToolArray = null;
			super.repaint()
		}
	}
}