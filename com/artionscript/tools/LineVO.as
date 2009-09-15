package com.artionscript.tools 
{
	import flash.geom.Matrix;
	import flash.display.LineScaleMode;
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class LineVO
	{
		public static var SOLID:String = "solid";

		private var _lineType:String = LineVO.SOLID; //LineVO.SOLID, GradientType.LINEAR, GradientType.RADIAL
		
		public var thickness:Number = NaN;
		public var color:uint = 0;
		public var alpha:Number = 1.0;
		public var pixelHinting:Boolean = false;
		public var scaleMode:String = LineScaleMode.NORMAL;
		public var caps:String = null;
		public var joints:String = null;
		public var miterLimit:Number = 3;
		
		public var colors:Array;
		public var alphas:Array;
		public var ratios:Array;
		public var matrix:Matrix = null;
		public var spreadMethod:String = SpreadMethod.PAD
		public var interpolationMethod:String = InterpolationMethod.RGB;
		public var focalPointRatio:Number = 0;
		
		public function LineVO() {
		}
		
		public function get lineType():String {
			return _lineType;
		}
		
		public function set lineType(lineType:String):void {
			switch(lineType)
			{
				case LineVO.SOLID:
				case GradientType.LINEAR:
				case GradientType.RADIAL:
					_lineType = lineType;
					break;
				default:
					throw new Error("LineVO: '"+ lineType +"' is not a recognised value for @param lineType.")
					break;
			}
		}
	}
}