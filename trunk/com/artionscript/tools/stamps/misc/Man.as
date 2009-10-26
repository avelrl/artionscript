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
	public class Man extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function Man(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false) 
		{
			var container:Sprite = new Sprite();

			var s2:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s2);
			s2.graphics.moveTo(-6.684,12.01);
			s2.graphics.lineTo(-13.145,0.933)
			s2.graphics.lineTo(-9.813,0.982)
			s2.graphics.lineTo(-3.372,11.666)
			s2.graphics.lineTo(-6.684,12.01)
			s2.graphics.endFill()
			container.addChild(s2);

			var s3:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s3);
			s3.graphics.moveTo(6.708,12.01);
			s3.graphics.lineTo(13.154,0.964)
			s3.graphics.lineTo(9.804,0.926)
			s3.graphics.lineTo(3.396,11.666)
			s3.graphics.lineTo(6.708,12.01)
			s3.graphics.endFill()
			container.addChild(s3);

			var s4:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s4);
			s4.graphics.moveTo(-4.607,-4.796);
			s4.graphics.lineTo(-4.607,11.744)
			s4.graphics.lineTo(4.617,11.744)
			s4.graphics.lineTo(4.617,-5.337)
			s4.graphics.lineTo(4.615,-5.337)
			s4.graphics.lineTo(4.615,-19.717)
			s4.graphics.lineTo(1.342,-19.717)
			s4.graphics.lineTo(1.342,-5.228)
			s4.graphics.lineTo(-1.354,-5.228)
			s4.graphics.lineTo(-1.354,-19.717)
			s4.graphics.lineTo(-4.625,-19.717)
			s4.graphics.lineTo(-4.625,-4.796)
			s4.graphics.lineTo(-4.607,-4.796)
			s4.graphics.endFill()
			container.addChild(s4);

			var s5:Sprite = new Sprite;
			setFillAndLineStyle(fillVO,lineVO, s5);
			s5.graphics.drawPath(Vector.<int>([1,3,3,3,3,2]),Vector.<Number>([-3.854,15.731,-3.854,11.747,0.1299999999999999,11.747,4.115,11.747,4.115,15.731,4.115,19.716,0.13000000000000034,19.716,-3.854,19.717810909090908,-3.854,15.731,-3.854,15.731]),"nonZero");
			s5.graphics.endFill();
			container.addChild(s5);
			
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