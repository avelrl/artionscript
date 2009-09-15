package com.artionscript.tools.stamps 
{
	import com.artionscript.tools.Tool;	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class RectangleStamp extends Tool
	{
		private const DEFAULT_SIDE:Number = 50;
		
		private var _width:Number;  
        private var _height:Number;
		private var _ellipseWidth:Number;
		private var _ellipseHeight:Number;
        private var _fill:FillVO;  
		private var _line:LineVO;  
		
		public function RectangleStamp(width:Number=0, height:Number=0, ellipseWidth:Number=0, ellipseHeight:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):void
		{
			if (width == 0) {
				width = DEFAULT_SIDE;
			}
			
			if (height == 0) {
				height = width;
			}

			setFillAndLineStyle(fillVO,lineVO);
			
			if (centre) {
				this.graphics.drawRoundRect((width / 2) * -1,(height / 2) * -1, width,height,ellipseWidth,ellipseHeight);
			}else{
				this.graphics.drawRoundRect(0,0,width,height,ellipseWidth,ellipseHeight);
			}
			
			this.graphics.endFill();
		}
	}
}