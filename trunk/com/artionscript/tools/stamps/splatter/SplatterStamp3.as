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
	public class SplatterStamp3 extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function SplatterStamp3(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false) 
		{
			var container:Sprite = new Sprite();
			
			var s:Sprite = new Sprite;
			setFillAndLineStyle(fillVO, lineVO, s);
			s.graphics.drawPath(Vector.<int>([1,3,3,3,3,3,3,3,2]),Vector.<Number>([1.511,0.887,1.9104864105201877,-0.213148122721611,1.382,-0.971,1.2371185696873168,-1.2032630429700202,0.726375,-1.339,0.26911728879714475,-1.4605223724405711,0.16599999999999993,-1.803,0.4998071428571421,-3.1382285714285696,-0.922,-1.354,-1.7947954678648175,-0.3357386208243798,-1.69,0.246,-0.6752592405032115,1.9354774723050423,0.039000000000000146,1.781,0.24871698113207613,1.781,1.511,0.887,1.511,0.887]),"nonZero");
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