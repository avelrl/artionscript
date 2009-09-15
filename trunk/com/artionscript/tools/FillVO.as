package com.artionscript.tools
{
	import flash.geom.Matrix;
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
		
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class FillVO
	{
		public static const SOLID:String = "solid";
		public static const BITMAP:String = "bitmap";
		
		private var _fillType:String = FillVO.SOLID; //FillVO.SOLID, FillVO.BITMAP, GradientType.LINEAR, GradientType.RADIAL
		
		public var color:uint;
		public var alpha:Number = 1;
		
		public var matrix:Matrix = null;

		public var colors:Array;
		public var alphas:Array;
		public var ratios:Array;
		public var spreadMethod:String = SpreadMethod.PAD;
		public var interpolationMethod:String = InterpolationMethod.RGB;
		public var focalPointRatio:Number = 0;
		
		public var bitmap:BitmapData;
		public var repeat:Boolean = true;
		public var smooth:Boolean = false;
		
		public function FillVO(){
		}
		
		public function get fillType():String {
			return _fillType;
		}
		
		public function set fillType(fillType:String):void {
			switch(fillType)
			{
				case FillVO.SOLID:
				case FillVO.BITMAP:
				case GradientType.LINEAR:
				case GradientType.RADIAL:
					_fillType = fillType;
					break;
				default:
					throw new Error("FillVO: '"+ fillType +"' is not a recognised value for @param fillType.")
					break;
			}
		}
	}
}