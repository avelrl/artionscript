package com.artionscript.artists.grid 
{
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
	public class RectangleGrid extends Grid
	{		
		public function RectangleGrid(canvas:Canvas, inspiration:Inspiration = null, palette:Palette = null) {
			super(canvas, inspiration, palette);
		}
		
		//override variables
		override protected function setVariables():void {
			COLUMN_SPACING = 30;
			ROW_SPACING = 30;
			
			//externally define variables to avoid frequent updating/committing of class
			include "includes/RectangleGridVariables.as";
		}
		
		override protected function buildTool(...args):Tool {
			var tempWidth:Number = (Math.random() * (MAX_WIDTH - MIN_WIDTH)) + MIN_WIDTH;
			var tempHeight:Number = tempWidth * ((Math.random() * 3) + 1);
			return createTool(tempWidth, tempHeight, args[0], args[1]);
		}
	}
}