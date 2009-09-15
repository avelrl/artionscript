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
	public class ArcStamp extends Tool
	{
		
		public function ArcStamp(radius:Number, arc:Number, startAngle:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false)
		{
			setFillAndLineStyle(fillVO, lineVO);
			
			if (centre) {
				Arc.draw(this,(radius),(0), radius, arc, startAngle);
			}else{
				Arc.draw(this, 0, 0, radius, arc, startAngle);
			}
			
			this.graphics.endFill();
		}
	}
}