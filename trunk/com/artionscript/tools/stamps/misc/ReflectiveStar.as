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
	public class ReflectiveStar extends Tool
	{
		
		private const DEFAULT_WIDTH:Number = 50;
		
		public function ReflectiveStar(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false, ...args) 
		{
			var container:Sprite = new Sprite();
			
			
			trace(args[0])
			var fillVO_2:FillVO;
			if (args[0]) {
				trace(args[0])
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
			s.graphics.moveTo(0,-14.462);
			s.graphics.lineTo(-14.169,-21.912)
			s.graphics.lineTo(-11.463,-6.134)
			s.graphics.lineTo(-22.926,5.04)
			s.graphics.lineTo(-7.085,7.342)
			s.graphics.lineTo(0,21.696)
			s.graphics.lineTo(7.085,7.342)
			s.graphics.lineTo(22.926,5.04)
			s.graphics.lineTo(11.463,-6.134)
			s.graphics.lineTo(14.169,-21.912)
			s.graphics.lineTo(0,-14.462)
			s.graphics.endFill()
			container.addChild(s);

			var s2:Sprite = new Sprite;
			setFillAndLineStyle(fillVO_2,lineVO_2, s2);
			s2.graphics.drawPath(Vector.<int>([1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2]),Vector.<Number>([0,20.566,6.521,7.355999999999998,6.753,6.883999999999999,7.273,6.808999999999998,21.851,4.69,11.302,-5.593,10.926,-5.959,11.015,-6.478,13.506,-20.999000000000002,0.4660000000000011,-14.144000000000002,0,-13.897,-0.465,-14.142,-13.504999999999999,-20.997,-11.014,-6.475999999999999,-10.924999999999999,-5.956999999999999,-11.300999999999998,-5.590999999999999,-21.851,4.69,-7.273,6.81,-6.753,6.885,-6.521,7.356999999999999,0,20.566,0,22.826,-7.417,7.799,-24,5.389,-12,-6.307999999999999,-14.833,-22.826,0,-15.027,14.833,-22.826,12,-6.309,24,5.389,7.417,7.799,0,22.826,0,22.826,0,22.826]),"nonZero");
			s2.graphics.endFill();
			container.addChild(s2);
			
			var s3:Sprite = new Sprite;
			setFillAndLineStyle(fillVO_2, lineVO_2, s3);
			s3.graphics.drawPath(Vector.<int>([1,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2]),Vector.<Number>([-9.851,-5.609,-10.029000000000002,-6.648,-10.467000000000002,-9.203,-0.8720371948588951,0.3126382762663553,16.008,0.391,19.701,3.991,7.127,5.818,6.087,5.97,5.621,6.914,-0.0009999999999994458,18.305,-5.622,6.914,-6.087,5.971,-7.128,5.819,-19.702,3.99,-10.602000000000002,-4.877000000000001,-9.851,-5.609,-9.851,-5.609]),"nonZero");
			s3.graphics.endFill();
			container.addChild(s3);
			
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