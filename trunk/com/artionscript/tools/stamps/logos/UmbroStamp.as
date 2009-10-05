package com.artionscript.tools.stamps.logos
{
	import com.artionscript.tools.Tool;	
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.FillVO;
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class UmbroStamp extends Tool
	{
		private const DEFAULT_WIDTH:Number = 50;
		
		private var _width:Number;  
        private var _height:Number;
        private var _fill:FillVO;  
		private var _line:LineVO;  
		
		public function UmbroStamp(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):void
		{
			var container:Sprite = new Sprite();
			
			var s:Sprite = new Sprite();
			setFillAndLineStyle(fillVO,lineVO, s);
			s.graphics.drawPath(Vector.<int>([1,2,2,2,2,2,2,1,2,2,2,2,2,2]),Vector.<Number>([88.472,0,0,40.147,87.8,79.756,176.94299999999998,40.147,88.472,0,88.472,0,88.472,0,88.472,13.427,28.32699999999999,40.147,87.8,66.732,150.09199999999998,40.147,88.472,13.427,88.472,13.427,88.472,13.427]),"evenOdd");
			s.graphics.endFill();
			container.addChild(s);

			var s2:Sprite = new Sprite();
			setFillAndLineStyle(fillVO,lineVO, s2);
			s2.graphics.drawPath(Vector.<int>([1,2,2,2,2,2,2,1,2,2,2,2,2,2]),Vector.<Number>([88.472,21.452,47.794,40.116,87.8,58.376,129.418,40.114999999999995,88.472,21.452,88.472,21.452,88.472,21.452,88.472,30.314,64.978,40.115,87.8,49.783,110.354,40.116,88.472,30.314,88.472,30.314,88.472,30.314]),"evenOdd");
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