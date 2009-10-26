package com.artionscript.assistants 
{
	import com.artionscript.palettes.Palette;
	import flash.display.BitmapData;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class ImageAssistant
	{	
		public static function convertBDToGreyScale(sourceBD:BitmapData):BitmapData {
			//BT.709-5 luminance constants
			
			var tempBD:BitmapData = sourceBD.clone();

			var greyScaleCMF:ColorMatrixFilter = new ColorMatrixFilter();
			greyScaleCMF.matrix = new Array(
			0.2125, 0.7154, 0.0721, 0, 0,
			0.2125, 0.7154, 0.0721, 0, 0,
			0.2125, 0.7154, 0.0721, 0, 0,
			0, 0, 0, 1, 0);

			tempBD.applyFilter(tempBD, new Rectangle(0, 0, tempBD.width, tempBD.height), new Point(0, 0), greyScaleCMF);
			
			return tempBD;
		}
		
		
		public static function equaliseGreyScaleBDHistogram(sourceBD:BitmapData):BitmapData {
			//concept by http://www.generation5.org/content/2004/histogramEqualization.asp
			
			var tempBD:BitmapData = sourceBD.clone();
			
			var v:Vector.<Vector.<Number>> = tempBD.histogram();
			
			var adjustmentMultiplier:Number = 255 / (tempBD.width * tempBD.height);
			var tempAdjustedFreq:int;
			var cumulativeFreq:Number = 0;
			var adjustedRedFreqArr:Array = new Array();
			var adjustedGreenFreqArr:Array = new Array();
			var adjustedBlueFreqArr:Array = new Array();
			for (var i:int=0; i < 256; i++) {
				cumulativeFreq += v[0][i];
				
				tempAdjustedFreq = cumulativeFreq * adjustmentMultiplier;
				
				adjustedRedFreqArr[i] = tempAdjustedFreq << 16 
				adjustedGreenFreqArr[i] = tempAdjustedFreq << 8
				adjustedBlueFreqArr[i] = tempAdjustedFreq
			}
			
			tempBD.paletteMap(tempBD, new Rectangle(0, 0, tempBD.width, tempBD.height), new Point(0, 0), adjustedRedFreqArr, adjustedGreenFreqArr, adjustedBlueFreqArr, null);
		
			return tempBD;
		}
		
		public static function posterizeGreyScaleBD(sourceBD:BitmapData, depth:int):BitmapData {
			//concept by http://www.axiomx.com/posterize.htm
			
			var tempBD:BitmapData = sourceBD.clone();
			
			depth = Math.max(0, Math.min(255, depth));
			
			var numAreas:Number = 256 / depth;
			var numValues:Number = 255 / (depth - 1);
			
			var tempArea:int;
			var tempAdjustedFreq:int;
			var tempColour:uint;
			var adjustedRedFreqArr:Array = new Array();
			var adjustedGreenFreqArr:Array = new Array();
			var adjustedBlueFreqArr:Array = new Array();
			for (var i:int = 0; i < 256; i++) {
				tempArea =  Math.floor(i / numAreas);

				tempAdjustedFreq = Math.floor(numValues * tempArea);
				
				adjustedRedFreqArr[i] = tempAdjustedFreq << 16 
				adjustedGreenFreqArr[i] = tempAdjustedFreq << 8
				adjustedBlueFreqArr[i] = tempAdjustedFreq
			}
			
			tempBD.paletteMap(tempBD, new Rectangle(0, 0, tempBD.width, tempBD.height), new Point(0, 0), adjustedRedFreqArr, adjustedGreenFreqArr, adjustedBlueFreqArr, null);
		
			return tempBD;
		}
		
		public static function posterizeGreyScaleBDToPalette(sourceBD:BitmapData, colours:Array):BitmapData {
			//concept by http://www.axiomx.com/posterize.htm
			
			var tempBD:BitmapData = sourceBD.clone();
			
			colours = ColourAssistant.sortColoursByLightnessAndSaturation(colours);
			
			var depth:int = colours.length;
			
			depth = Math.max(0, Math.min(255, depth));
			
			var numAreas:Number = 256 / depth;
			var numValues:Number = 255 / (depth - 1);
			
			var tempArea:int;
			var tempAdjustedFreq:int;
			var tempColour:uint;
			var adjustedRedFreqArr:Array = new Array();
			var adjustedGreenFreqArr:Array = new Array();
			var adjustedBlueFreqArr:Array = new Array();
			for (var i:int = 0; i < 256; i++) {
				tempArea =  Math.floor(i / numAreas);
				tempAdjustedFreq = Math.floor(numValues * tempArea);
				tempColour = colours[tempArea];
				
				adjustedRedFreqArr[i] = ((tempColour >> 16) & 0xFF) << 16;
				adjustedGreenFreqArr[i] = ((tempColour >> 8) & 0xFF) << 8;
				adjustedBlueFreqArr[i] = (tempColour & 0xFF);
			}
			
			tempBD.paletteMap(tempBD, new Rectangle(0, 0, tempBD.width, tempBD.height), new Point(0, 0), adjustedRedFreqArr, adjustedGreenFreqArr, adjustedBlueFreqArr, null);
		
			return tempBD;
		}
		
		public static function scaleBD(sourceBD:BitmapData, width:Number, height:Number, constrain:Boolean=true, constrainToLargest:Boolean=false):BitmapData {
			
			var tempBD:BitmapData = sourceBD.clone();
			
			var scaleX:Number = width / tempBD.width;
			var scaleY:Number = height / tempBD.height;
			
			if (constrain) {
				if (constrainToLargest) {
					scaleX = scaleY = Math.max(scaleX, scaleY);
				}else{
					scaleX = scaleY = Math.min(scaleX, scaleY);
				}
			}
			
			var scaleMatrix:Matrix = new Matrix();
			scaleMatrix.scale(scaleX, scaleY);
			
			var scaledBD:BitmapData = new BitmapData(Math.min(tempBD.width * scaleX, 4095), Math.min(tempBD.height * scaleY, 4095), false, 0x000000);
			scaledBD.draw(tempBD, scaleMatrix);
			
			return scaledBD;
		}
	}
}