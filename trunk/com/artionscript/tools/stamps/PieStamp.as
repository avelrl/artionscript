package com.artionscript.tools.stamps 
{
	//http://theflashblog.com/?p=429 - http://leebrimelow.googlecode.com/svn/trunk/as3/com/theflashblog/drawing/Arc.as
	//Lee Brimelow's 'Arc' class is fundemental to this 'Stamp'
	import com.leebrimelow.drawing.Arc;
	
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;
	
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class PieStamp extends Tool
	{
		
		public function PieStamp(radius:Number, arc:Number, startAngle:Number=0, fillVO:FillVO=null, lineVO:LineVO=null)
		{
			setFillAndLineStyle(fillVO, lineVO);
			
			var angle:Number = (startAngle / 180) * Math.PI;
			
			var arcStartX:Number = Math.cos(angle) * radius;
			var arcStartY:Number = Math.sin(angle) * radius;
			
			if(Math.abs(arc-startAngle)<360){
				this.graphics.moveTo(0, 0);
				this.graphics.lineTo(arcStartX, arcStartY);
			}else {
				this.graphics.moveTo(arcStartX, arcStartY);
			}
			
			Arc.draw(this, arcStartX, arcStartY, radius, arc, startAngle);
			
			if(Math.abs(arc-startAngle)<360){
				this.graphics.lineTo(0, 0);
			}
			
			this.graphics.endFill();
		}
	}
}