package com.artionscript.tools 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Tool extends Sprite
	{
		private var defaultFillColour:uint = 0x000000;
		
		public function Tool() {
		}
		
		protected function setFillAndLineStyle(fillVO:FillVO, lineVO:LineVO):void {
			
			if (lineVO != null){
				this.graphics.lineStyle(lineVO.thickness, lineVO.color, lineVO.alpha, lineVO.pixelHinting, lineVO.scaleMode, lineVO.caps, lineVO.joints, lineVO.miterLimit);
			}else {
				this.graphics.lineStyle();
			}
			
			if(fillVO != null){
				this.graphics.beginFill(fillVO.color, fillVO.alpha);
			}else if(lineVO==null){
				//Q. Should I default to a black fill if no line or fill is defined?
				//A. I'm currently thinking no.
				//this.graphics.beginFill(defaultFillColour);
			}
		}
	}
}