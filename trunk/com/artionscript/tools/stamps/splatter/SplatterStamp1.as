package com.artionscript.tools.stamps.splatter {

	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.ArcStamp;
	import com.artionscript.tools.Tool;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class SplatterStamp1 extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function SplatterStamp1(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false) 
		{
			var container:Sprite = new Sprite();
			
			var s:Sprite = new Sprite;
			setFillAndLineStyle(fillVO, lineVO, s);
			s.graphics.drawPath(Vector.<int>([1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2]),Vector.<Number>([0.958,2.864,1.3344101096504317,3.0353388834824155,1.6131250000000001,2.648625,1.9134845710819754,2.2318793570652344,2.173,2.29,2.1995894398127835,1.837979523182681,2.909,1.14575,3.507593490969375,0.5616536951400397,3.261,-0.14400000000000013,3.456027309092774,-0.8572427303964298,2.7335000000000003,-1.3596250000000003,1.9832805683355892,-1.8812619485791608,2.1100000000000003,-2.576,3.0302864195416133,-2.4846903318111058,0.03837500000000027,-3.17525,-1.27450005526135,-3.4782731966806213,-2.178,-2.576,-2.6763573758028048,-2.3996511124227204,-2.73,-1.55925,-2.7737752378099017,-0.873437940978208,-3.5220000000000002,-0.976,-2.882,-0.3360000000000004,-2.882,0.1120000000000001,-2.882,1.6479999999999992,-3.266,1.008,-2.033057487579844,1.9351149751596877,-2.306,2.481,-1.4825586924219911,2.0692793462109957,-1.09,3.2489999999999997,-0.8015063478807607,2.607289772068683,-0.09075,3.03325,0.6386232345099866,3.4703674315153608,0.958,2.864,0.958,2.864]),"nonZero");
			s.graphics.endFill();
			container.addChild(s);
			
			var s2:Sprite = new Sprite;
			setFillAndLineStyle(fillVO, lineVO, s2);
			s2.graphics.drawPath(Vector.<int>([1,3,2,3,2]),Vector.<Number>([3.356,0.62,3.4395,0.6485000000000001,3.5229999999999997,0.677,3.5229999999999997,0.341,3.356,0.6841090909090923,3.356,0.62,3.356,0.62]),"nonZero");
			s2.graphics.endFill();
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