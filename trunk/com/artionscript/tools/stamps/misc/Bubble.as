package com.artionscript.tools.stamps.misc {

	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.ArcStamp;
	import com.artionscript.tools.Tool;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Bubble extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function Bubble(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false) 
		{
			var container:Sprite = new Sprite();
			
			var s:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s);
			s.graphics.drawPath(Vector.<int>([1,3,3,3,3,2]),Vector.<Number>([11,0,11,-11,0,-11,-11,-11,-11,0,-11,11,0,11,11,11,11,0,11,0]),"nonZero");
			s.graphics.endFill();
			container.addChild(s);
			
			if (width == 0) {
				width = DEFAULT_WIDTH;
			}
			
			if (height == 0) {
				height = (width / container.width) * container.height;
			}
			
			container.width = width;
			container.height = height;
			
			if (centre) {
				container.x = 0 - container.width / 2;
				container.y = 0 - container.height / 2;
			}
			
			this.addChild(container);
		}
		
	}

}