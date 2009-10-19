package com.artionscript.artists.grid 
{
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	import com.artionscript.tools.stamps.shapes.ArrowStamp;
	
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.EllipseStamp;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class ArrowGrid extends Grid
	{
		public function ArrowGrid(canvas:Canvas, inspiration:Inspiration=null, palette:Palette=null) {
			super(canvas, inspiration, palette);
		}
		
		//override variables
		override protected function setVariables():void {
			//externally define variables to avoid frequent updating/committing of class
			include "includes/ArrowGridVariables.as";
		}
		
		override protected function setFillAndLine():void {
			fillVO = new FillVO();
			fillVO.color = 0xFFFFFF;
			lineVO = new LineVO();
			//lineVO.thickness = 0;
			//lineVO.color = 0x000000;
			
			UPDATE_FILL_COLOUR = true;
			UPDATE_LINE_COLOUR = false;
			
		}
		
		override protected function createTool(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, ...args):Tool {
			return new ArrowStamp(width, height, fillVO, lineVO, false);
		}
	}
}