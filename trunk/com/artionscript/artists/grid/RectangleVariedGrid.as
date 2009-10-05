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
	public class RectangleVariedGrid extends VariedGrid
	{		
		public function RectangleVariedGrid(canvas:Canvas, inspiration:Inspiration = null, palette:Palette = null) {
			super(canvas, inspiration, palette);
		}
		
		//override variables
		override protected function setVariables():void {
			//externally define variables to avoid frequent updating/committing of class
			include "includes/RectangleVariedGridVariables.as";
		}
		
		override protected function buildTool(...args):Tool {
			if (!_largeToolArray) {
				_largeToolArray = new Array();
			}
			
			var tempWidth:Number = (Math.random() * (MAX_WIDTH - MIN_WIDTH)) + MIN_WIDTH;
			var tempHeight:Number = tempWidth * ((Math.random() * 3) + 1);
			
			var tempTool:Tool;			
			if (Math.floor(Math.random() * 3) == 2){
				tempTool = createTool();
				tempTool.alpha = 0;
			}else if (Math.floor(Math.random() * 40) == 0){
				tempTool = createTool(tempWidth * 3, tempHeight * 3, args[0], args[1]);
				tempTool.filters = _largeToolFiltersArray;
				_largeToolArray.push(tempTool);
			}else{
				tempTool = createTool(tempWidth, tempHeight, args[0], args[1]);
				tempTool.filters = _smallToolFiltersArray;
			}
			
			return tempTool;
		}
	}
}