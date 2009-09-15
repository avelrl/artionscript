package com.artionscript.tools.stamps 
{
	import com.artionscript.tools.Tool;	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class EllipseStamp extends Tool
	{
		private const DEFAULT_WIDTH:Number = 50;
		
		private var _width:Number;  
        private var _height:Number;  
        private var _fill:FillVO;  
		private var _line:LineVO;  
		
		public function EllipseStamp(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):void
		{
			if (width == 0) {
				width = DEFAULT_WIDTH;
			}
			
			if (height == 0) {
				height = width;
			}

			setFillAndLineStyle(fillVO,lineVO);
			
			if (centre) {
				this.graphics.drawEllipse((width/2)*-1,(height/2)*-1,width,height);
			}else{
				this.graphics.drawEllipse(0,0,width,height);
			}
			this.graphics.endFill();
		}
	}
}