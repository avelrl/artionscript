package com.artionscript.assistants 
{
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	
	 //http://www.cs.rit.edu/~ncs/color/t_convert.html
	 //http://www.easyrgb.com/index.php?X=MATH&H=06
	public class ColourAssistant
	{
		
		public static function sortColoursByLightness(colourArray:Array):Array{
			
			var tempColourArray:Array = colourArray.concat();
			return tempColourArray.sort(sortOnLightness);
		}
		
		public static function sortColoursByLightnessAndSaturation(colourArray:Array):Array{
			
			var tempColourArray:Array = colourArray.concat();
			return tempColourArray.sort(sortOnLightnessAndSaturation);
		}
		
		public static function sortOnLightness(a:uint, b:uint):Number {
			
			var aLightness:Number = getLightness(a);
			var bLightness:Number = getLightness(b);
			
			if (aLightness > bLightness) {
				return 1;
			} else if(aLightness < bLightness) {
				return -1;
			} else  {
				return 0;
			}
		}
		
		public static function sortOnLightnessAndSaturation(a:uint, b:uint):Number {
			
			var aLightness:Number = getLightness(a);
			var bLightness:Number = getLightness(b);
			
			if (aLightness > bLightness) {
				return 1;
			} else if(aLightness < bLightness) {
				return -1;
			} else  {
				return sortOnSaturation(a, b);
			}
		}
		
		public static function getLightness(colour:uint):Number {
			var xyz:XYZColourVO = rgbToXYZ(colour);
			var lab:LabColourVO = XYZToLab(xyz);
			return lab.L;
		}
		
		public static function sortColoursBySaturation(colourArray:Array):Array{
			
			var tempColourArray:Array = colourArray.concat();
			return tempColourArray.sort(sortOnSaturation);
		}
		
		public static function sortOnSaturation(a:uint, b:uint):Number {
			
			var aSaturation:Number = getSaturation(a);
			var bSaturation:Number = getSaturation(b);

			if(aSaturation < bSaturation) {
				return 1;
			} else if(aSaturation > bSaturation) {
				return -1;
			} else  {
				return 0;
			}
		}
		
		public static function getSaturation(colour:uint):Number {
			//http://www.cs.rit.edu/~ncs/color/t_convert.html
			var saturation:Number;
			
			var colourR:int = colour >> 16;
			var colourG:int = colour >> 8 & 0xFF;
			var colourB:int = colour & 0xFF;
			
			var colourMaxChannel:Number = Math.max(Math.max(colourR, colourG), colourB);
			var colourMinChannel:Number = Math.min(Math.min(colourR, colourG), colourB);
			
			var delta:Number = colourMaxChannel - colourMinChannel;
			
			if( colourMaxChannel != 0 )
				saturation = delta / colourMaxChannel;
			else {
				saturation = 0;
			}

			return saturation;	
		}
		
		public static function rgbToXYZ(colour:uint):XYZColourVO {
			//http://www.easyrgb.com/index.php?X=MATH
			var XYZ:XYZColourVO = new XYZColourVO();
			
			var colourR:int = colour >> 16;
			var colourG:int = colour >> 8 & 0xFF;
			var colourB:int = colour & 0xFF;
			
			var tempR:Number = ( colourR / 255 );
			var tempG:Number = ( colourG / 255 );
			var tempB:Number = ( colourB / 255 );

			if ( tempR > 0.04045 ) {
				tempR = Math.pow(( ( tempR + 0.055 ) / 1.055 ), 2.4);
			}else {
				tempR = tempR / 12.92
			}
			
			if ( tempG > 0.04045 ) { 
				tempG = Math.pow(( ( tempG + 0.055 ) / 1.055 ), 2.4);
			}else {                   
				tempG = tempG / 12.92
			}
			
			if ( tempB > 0.04045 ) {
				tempB = Math.pow(( ( tempB + 0.055 ) / 1.055 ), 2.4);
			}else {
				tempB = tempB / 12.92
			}

			tempR = tempR * 100
			tempG = tempG * 100
			tempB = tempB * 100

			//Observer. = 2°, Illuminant = D65
			XYZ.X = (tempR * 0.4124) + (tempG * 0.3576) + (tempB * 0.1805);
			XYZ.Y = (tempR * 0.2126) + (tempG * 0.7152) + (tempB * 0.0722);
			XYZ.Z = (tempR * 0.0193) + (tempG * 0.1192) + (tempB * 0.9505);
			
			return XYZ;
		}
		
		public static function XYZToLab(xyzObj:XYZColourVO):LabColourVO {
			//http://www.easyrgb.com/index.php?X=MATH
			var lab:LabColourVO = new LabColourVO();
			
			var tempX:Number = xyzObj.X / D65IlluminantVO.X;
			var tempY:Number = xyzObj.Y / D65IlluminantVO.Y;
			var tempZ:Number = xyzObj.Z / D65IlluminantVO.Z;

			if ( tempX > 0.008856 ) {
				tempX = Math.pow(tempX, ( 1 / 3 ));
			} else {
				tempX = ( 7.787 * tempX ) + ( 16 / 116 )
			}
			
			if ( tempY > 0.008856 ) {
				tempY = Math.pow(tempY, ( 1 / 3 ));
			} else {
				tempY = ( 7.787 * tempY ) + ( 16 / 116 )
			}
			
			if ( tempZ > 0.008856 ) {
				tempZ = Math.pow(tempZ, ( 1 / 3 ));
			} else {
				tempZ = ( 7.787 * tempZ ) + ( 16 / 116 )
			}

			lab.L = ( 116 * tempY ) - 16;
			lab.a = 500 * ( tempX - tempY );
			lab.b = 200 * ( tempY - tempZ );
			
			return lab;
		}
	}
}