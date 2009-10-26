package com.artionscript.studios.working
{	
	//Saving functionality by http://www.bit-101.com/blog/?p=1415 - Keith Peters
	//FP10 and patience required.
	import com.artionscript.artists.stripes.Stripes;
	import com.artionscript.tools.stamps.grime.*
	import com.artionscript.tools.stamps.misc.*;
	import com.artionscript.tools.stamps.splatter.*;
	import com.bit101.SavingBitmap;
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import flash.ui.Keyboard;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import flash.text.TextField;
	
	import flash.geom.Rectangle;
	
	import com.artionscript.canvas.Canvas;
	
	import com.artionscript.artists.Artist;
	import com.artionscript.artists.*;
	import com.artionscript.artists.grid.*;
	
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.inspirations.*;

	import com.artionscript.palettes.Palette;
	import com.artionscript.palettes.*;
	import com.artionscript.palettes.static.*;

	import com.artionscript.inspirations.images.*
	import com.artionscript.tools.stamps.florids.*;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.Tool;
	 
	
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Main extends Sprite 
	{		
		private var _savingBmp:SavingBitmap;
        private var _bmpData:BitmapData;
		private var _artist:Artist;
		private var _artistArray:Array;
		
		public function Main():void 
		{
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
            _bmpData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xFF000000);
            _savingBmp = new SavingBitmap(_bmpData);
			
			var palette:Palette = new PaletteHyperactive()//StaticPaletteFactory.getRandomPalette();
			
			var canvas:Canvas = new Canvas(1500, 2000, 0xFFFFFF);
			
			canvas.cacheAsBitmap = true;
			addChild(canvas);

			_artistArray = new Array();
			//_artistArray.push(new Grid(canvas, new MonaLisaInspiration(),new PaletteCitrusGrove()));
			//_artistArray.push(new CircleGrid(canvas, new SunflowersInspiration(), new Palette()));
			//_artistArray.push(new RectangleGrid(canvas, new Inspiration(), paletteHyperactive));
			//_artistArray.push(new ArrowGrid(canvas, new MonaLisaInspiration(), new PaletteHyperactive()));
			//_artistArray.push(new VariedGrid(canvas, new Inspiration(), paletteHyperactive));
			//_artistArray.push(new CircleVariedGrid(canvas, new Inspiration(), new PalettePaulSmith()));
			//_artistArray.push(new RectangleVariedGrid(canvas, new SunflowersInspiration(), new Palette()));
			//_artistArray.push(new SplatterGrid(canvas, new MonaLisaInspiration(), new PalettePaulSmith()));
			
			_artistArray.push(new Stripes(canvas, new MonaLisaInspiration(), new Palette()));
			
			//_artistArray.push(new AngularLines(canvas, new Inspiration(), paletteExperience)); 
			//_artistArray.push(new CityAtNight(canvas, new Inspiration(), paletteWorldAtNight));
			//_artistArray.push(new Tunnel(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new Arcs(canvas, new Inspiration(), paletteVitaminC));
			//_artistArray.push(new ArcTrails(canvas, new Inspiration(), paletteStepIntoTheLight));
			//_artistArray.push(new TarbellSpaceFiller(canvas, new Inspiration(), paletteAfrica));
			//_artistArray.push(new SpaceFiller(canvas, new Inspiration(), paletteVitaminC));
			//_artistArray.push(new UmbroSpaceFiller(canvas, new Inspiration(), paletteVitaminC));
			//_artistArray.push(new SpaceFiller_v1(canvas, new Inspiration(), paletteVitaminC));
			//_artistArray.push(new PieMosaic(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new PantonCurves(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new HorizontalLines(canvas, new Inspiration(), paletteCitrusGrove));
			//_artistArray.push(new KPetersWave(canvas, new Inspiration(), paletteCitrusGrove));
		
		
/*		 
		 var fillVO:FillVO = new FillVO();
		 fillVO.color = palette.colours[0];
		 
		 var lineVO:LineVO = new LineVO();
		 lineVO.color = palette.colours[1];
		 lineVO.thickness = 0//1;
		 
		 var fillVO_2:FillVO = new FillVO();
		 fillVO_2.color = palette.colours[2];
		 
		 var lineVO_2:LineVO = new LineVO();
		 lineVO_2.color = palette.colours[3];
		 lineVO_2.thickness = 0//1;
			
		 var stamp:Tool = new Splatter3(0, 0, fillVO, lineVO, true);
		stamp.x = stage.width / 2;
		stamp.y = stage.height / 2;
		addChild(stamp);
*/		
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPress);
		}
				
		private function keyPress(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.SPACE){
				if (_artistArray) {
					var i:int;
					var artistArrayLength:int = _artistArray.length;
					for (i = 0; i < artistArrayLength; i++ ){
						//clear canvas
						_artistArray[i].repaint();
					}
				}
			}else if (e.ctrlKey) {
				if (e.keyCode ==  Keyboard.NUMPAD_ADD) {
					createBitmap();
				}else if (e.keyCode == 83) {
					//else if 's'
					saveBitmap();
				}
			}
		}
		
		private function createBitmap():void {
			_bmpData.draw(stage, null, null, null, new flash.geom.Rectangle(0, 0, stage.width, stage.height), false);
		}
		
		private function saveBitmap(e:MouseEvent = null):void {
			createBitmap();
			_savingBmp.encoderType = "jpeg";
			_savingBmp.jpegQuality = 100;
			_savingBmp.save("export.jpg");
		}
	}
}