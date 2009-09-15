package com.artionscript.tools.stamps 
{
	import com.artionscript.tools.Tool;	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class FreeDrawStamp extends Tool
	{
		private const DEFAULT_SIDE:Number = 50;
		
		private var _width:Number;  
        private var _height:Number;
		private var _ellipseWidth:Number;
		private var _ellipseHeight:Number;
        private var _fill:FillVO;  
		private var _line:LineVO;  
		
		public function FreeDrawStamp(fillVO:FillVO=null, lineVO:LineVO=null):void
		{
			setFillAndLineStyle(fillVO,lineVO);
		}
		
		public function moveTo(x:Number, y:Number):void {
			this.graphics.moveTo(x, y);
		}
		
		public function lineTo(x:Number, y:Number):void {
			this.graphics.lineTo(x, y);
		}

		public function angleTo(length:Number = 50, angle:Number = 0, x:Number=0, y:Number=0):void {
			var radAngle:Number = angle * (Math.PI/180)
			this.graphics.lineTo((Math.cos(radAngle)*length)+x, Math.sin(radAngle)*length+y);
		}
		
		public function curveTo(controlX:Number, controlY:Number, anchorX:Number, anchorY:Number):void {
			this.graphics.curveTo(controlX, controlY, anchorX, anchorY)
		}
		
		public function endFill():void {
			this.graphics.endFill();	
		}
		

	}
}