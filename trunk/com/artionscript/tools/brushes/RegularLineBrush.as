package com.artionscript.tools.brushes 
{
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.LineVO;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class RegularLineBrush extends Tool
	{
		public function RegularLineBrush(length:Number = 50, angle:Number = 0, lineVO:LineVO = null) 
		{
			setFillAndLineStyle(null, lineVO);
			this.graphics.moveTo(0, 0);
			
			var radAngle:Number = angle * (Math.PI/180)
			this.graphics.lineTo(Math.cos(radAngle)*length, Math.sin(radAngle)*length);
		}
	}
}