package com.artionscript.tools.stamps.shapes
{
	import com.artionscript.tools.Tool;	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class ArrowStamp extends Tool
	{
		private const DEFAULT_WIDTH:Number = 50;
		
		private var _width:Number;  
        private var _height:Number;
        private var _fill:FillVO;  
		private var _line:LineVO;  
		
		public function ArrowStamp(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):void
		{
			var container:Sprite = new Sprite();
			
			var s:Sprite = new Sprite();
			setFillAndLineStyle(fillVO,lineVO, s);
			s.graphics.moveTo(-22.848,-13.154);
			s.graphics.lineTo(22.848, -13.154);
			s.graphics.lineTo(22.848, 13.154);
			s.graphics.lineTo( -22.848, 13.154);
			s.graphics.lineTo( -22.848, -13.154);
			s.graphics.endFill();
			//container.addChild(s);

			var s2:Sprite = new Sprite();
			setFillAndLineStyle(fillVO,lineVO, s2);
			s2.graphics.moveTo(-22.848,-6.346);
			s2.graphics.lineTo(0.069, -6.346);
			s2.graphics.lineTo(0.069, -13.154);
			s2.graphics.lineTo(22.848, 0.001);
			s2.graphics.lineTo(0.069, 13.154);
			s2.graphics.lineTo(0.069, 6.346);
			s2.graphics.lineTo( -22.848, 6.346);
			s2.graphics.lineTo( -22.848, -6.346);
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