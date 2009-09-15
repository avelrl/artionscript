package com.artionscript.artists 
{	
	import com.artionscript.tools.brushes.RegularLineBrush;
	import com.artionscript.tools.stamps.FreeDrawStamp;
	import flash.display.Sprite;
	
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;

	/**
	 * ...
	 * @author Trevor Boyle
	 * 
	 * Concepts and code from Keith Peters make up the majority of this 'Artist'
	 * http://www.bit-101.com/blog/?page_id=1164
	 */
	public class KPetersWave extends Artist
	{	
		private var a:Number;
		private var b:Number;
		private var c:Number;
		private var y0:Number;
		private var asVal:Number;
		private var bsVal:Number;
		private var csVal:Number;
		private var wave:Number;
		private var height:Number;
		private var height2:Number;
		
		private var xMov:Number;
		
		private var asf:Number;
		private var bsf:Number;
		private var csf:Number;
		private var wavef:Number;
		private var heightf:Number;
		private var height2f:Number;
		
		private var asdelta:Number;
		private var bsdelta:Number;
		private var csdelta:Number;
		private var wavedelta:Number;
		private var heightdelta:Number;
		private var height2delta:Number;
		
		/*
		private var red1:Number;
		private var red2:Number;
		private var green1:Number;
		private var green2:Number;
		private var blue1:Number;
		private var blue2:Number;
		private var col:uint;
		private var redspeed:Number;
		private var greenspeed:Number;
		private var bluespeed:Number;
		private var colspeed:Number;
		*/
		
		public function KPetersWave(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			create();
		}
		
		override public function create():void {
			a = 0;
			b = 0;
			c = 0;
			y0 = canvas.cHeight;
			asVal = Math.random();
			bsVal = Math.random() / 3;
			csVal = Math.random()*2;
			wave = Math.random()*60+10;
			height = Math.random()*10+5;
			height2 = Math.random() * 4;
			//
			xMov = 100;
			//
			asf = Math.random()/2;
			bsf = Math.random()/3*2;
			csf = Math.random()*3;
			wavef = Math.random()*6+1;
			heightf = Math.random()*10+5;
			height2f = Math.random()*4;
			//
			asdelta = 0//(asf-asVal)/84;
			bsdelta = 0//(bsf-bsVal)/84;
			csdelta = 0//(csf-csVal)/84;
			wavedelta = 0//(wavef-wave)/84;
			heightdelta = 0//(heightf-height)/84;
			height2delta = 0//(height2f-height2)/84;
			//
			/*
			var startCol:uint = getRandomPaletteColour();
			var endCol:uint = getRandomPaletteColour();
			red1 = startCol >> 16 & 0xFF;
			red2 = endCol >> 16 & 0xFF;
			green1 = startCol >> 8 & 0xFF;
			green2 = endCol >> 8 & 0xFF;
			blue1 = startCol & 0xFF;
			blue2 = endCol & 0xFF;
			col = startCol;
			
			redspeed = (red2-red1)/(canvas.cWidth/xMov);
			greenspeed = (green2-green1)/(canvas.cWidth/xMov);
			bluespeed = (blue2-blue1)/(canvas.cWidth/xMov);
			colspeed = redspeed << 16 | greenspeed << 8 | bluespeed;
			*/
			//
			draw();
		}
		
		private function draw():void {
			var fillVO:FillVO = new FillVO();
			var lineVO:LineVO = new LineVO();
			lineVO.thickness = 1;
			lineVO.alpha = .2;
			lineVO.pixelHinting = true;
			
			var tempWave:FreeDrawStamp;
			var n:int;
			var tempX:Number;
			var tempY:Number;
			while (y0 > -20) {
				fillVO.color = getRandomPaletteColour();//col;
				lineVO.color = getRandomPaletteColour();//0;
				tempWave = new FreeDrawStamp(fillVO, lineVO);
				tempWave.moveTo(canvas.cWidth + 2, y0+30);
				tempWave.lineTo(-2, y0+30);
				tempWave.lineTo(-2, y0 + Math.sin(a) * height);
				
				n = 1;
				tempX = 0;
				tempY = 0;
				while (tempX < canvas.cWidth){
					n++
					tempY = y0+Math.sin(a += asVal)*height+Math.cos(c += csVal)*height2;
					tempX = n*xMov;
					tempWave.lineTo(tempX, tempY);
				}
				tempWave.endFill();
				canvas.addChildAt(tempWave, 1);
				
				a = Math.sin(b += bsVal)*wave;
				y0 -= 5;
				//col += colspeed;
				asVal += asdelta;
				bsVal += bsdelta;
				csVal += csdelta;
				wave += wavedelta;
				height += heightdelta;
				height2 += height2delta;
			}
		}
	}
}