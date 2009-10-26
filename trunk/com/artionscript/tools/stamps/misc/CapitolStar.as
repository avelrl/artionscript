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
	public class CapitolStar extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function CapitolStar(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false, ...args) 
		{
			var container:Sprite = new Sprite();
			
			var fillVO_2:FillVO;
			if (args[0]) {
				fillVO_2 = args[0];
			}else {
				fillVO_2 = fillVO;
			}
			
			var lineVO_2:LineVO;
			if (args[1]) {
				lineVO_2 = args[1];
			}else {
				lineVO_2 = lineVO;
			}
			
			var s:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s);
			s.graphics.drawPath(Vector.<int>([1,3,3,3,3,2]),Vector.<Number>([5.78,-0.002,5.78,-5.781,0,-5.781,-5.78,-5.781,-5.78,-0.0019999999999997797,-5.78,5.779,0,5.779,5.78,5.779,5.78,-0.002,5.78,-0.002]),"nonZero");
			s.graphics.endFill();
			container.addChild(s);

			var s2:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s2);
			s2.graphics.moveTo(3.434,-4.676);
			s2.graphics.lineTo(0.008,-2.244)
			s2.graphics.lineTo(-3.382,-4.744)
			s2.graphics.lineTo(-2.321,-0.718)
			s2.graphics.lineTo(-5.554,1.718)
			s2.graphics.lineTo(-1.525,1.863)
			s2.graphics.lineTo(-0.08,5.781)
			s2.graphics.lineTo(1.435,1.896)
			s2.graphics.lineTo(5.476,1.83)
			s2.graphics.lineTo(2.298,-0.663)
			s2.graphics.lineTo(3.434,-4.676)
			s2.graphics.endFill()
			container.addChild(s2);
			
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