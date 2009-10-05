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
	public class CircleVariedGrid extends VariedGrid
	{		
		public function CircleVariedGrid(canvas:Canvas, inspiration:Inspiration = null, palette:Palette = null) {
			super(canvas, inspiration, palette);
		}
		
		//override variables
		override protected function setVariables():void {
			//externally define variables to avoid frequent updating/committing of class
			include "includes/CircleVariedGridVariables.as";
		}
		
		override protected function createTool(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, ...args):Tool {
			return new EllipseStamp(width, height, fillVO, lineVO, true);
		}
	}
}