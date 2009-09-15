package com.artionscript.studios.working
{	
	//Saving functionality by http://www.bit-101.com/blog/?p=1415 - Keith Peters
	//FP10 and patience required.
	import com.bit101.SavingBitmap;
	
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import flash.ui.Keyboard;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import flash.text.TextField;
	
	import com.artionscript.canvas.Canvas;
	
	import com.artionscript.artists.Artist;
	import com.artionscript.artists.*;
	
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.inspirations.*;

	import com.artionscript.palettes.Palette;
	import com.artionscript.palettes.*;
	import com.artionscript.palettes.static.*;
	
	import flash.geom.Rectangle;
	 
	
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
			
			var paletteAfrica:Palette = new PaletteAfrica();
			var paletteAvoidance:Palette = new PaletteAvoidance();
			var paletteCitrusGrove:Palette = new PaletteCitrusGrove();
			var paletteExperience:Palette = new PaletteExperience();
			var paletteFruitAndFuzz:Palette = new PaletteFruitAndFuzz();
			var paletteGrey:Palette = new PaletteGrey();
			var paletteHyperactive:Palette = new PaletteHyperactive();
			var paletteMajito:Palette = new PaletteMajito();
			var palettePanton:Palette = new PalettePanton();
			var palettePhoenixTail:Palette = new PalettePhoenixTail();
			var paletteSandyStoneBeach:Palette = new PaletteSandyStoneBeach();
			var paletteStepIntoTheLight:Palette = new PaletteStepIntoTheLight();
			var paletteTune:Palette = new PaletteTune();
			var paletteVitaminC:Palette = new PaletteVitaminC();
			var paletteWorldAtNight:Palette = new PaletteWorldAtNight();
			
			var paletteCitrusAvoidance:Palette = new Palette();
			paletteCitrusAvoidance.addColours(paletteAvoidance.colours);
			paletteCitrusAvoidance.addColours(paletteCitrusGrove.colours);
			
			var paletteCitrusMajitoAvoidance:Palette = new Palette();
			paletteCitrusMajitoAvoidance.addColours(paletteCitrusAvoidance.colours);
			paletteCitrusMajitoAvoidance.addColours(paletteMajito.colours);
			
			var canvas:Canvas = new Canvas(4000, 3000, 0xFFFFFF);
			//var canvas:Canvas = new Canvas(4000, 3000, 0x000000);
			//var canvas:Canvas = new Canvas(4000, 3000, 0x353535);
			
			//var canvas:Canvas = new Canvas(3000, 4000, 0x000000);
			//var canvas:Canvas = new Canvas(382, 286, 0xFFFFFF); 
			//var canvas:Canvas = new Canvas(400, 300, 0x000000);//canvas.x = canvas.y = 400;
			
			canvas.cacheAsBitmap = true;
			addChild(canvas);

			_artistArray = new Array();
			//_artistArray.push(new SquareGrid(canvas, new Inspiration(), paletteHyperactive));
			//_artistArray.push(new RectangleBlurredGrid(canvas, new Inspiration(), paletteAvoidance));
			//_artistArray.push(new CircleGrid(canvas, new Inspiration(), paletteAvoidance));
			//_artistArray.push(new CircleGridExtended(canvas, new Inspiration(), paletteHyperactive));
			//_artistArray.push(new AngularLines(canvas, new Inspiration(), paletteExperience)); 
			//_artistArray.push(new CityAtNight(canvas, new Inspiration(), paletteWorldAtNight));
			//_artistArray.push(new Tunnel(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new Arcs(canvas, new Inspiration(), paletteVitaminC));
			_artistArray.push(new ArcTrails(canvas, new Inspiration(), paletteStepIntoTheLight));
			//_artistArray.push(new TarbellSpaceFiller(canvas, new Inspiration(), paletteAfrica));
			//_artistArray.push(new SpaceFiller(canvas, new Inspiration(), paletteVitaminC));
			//_artistArray.push(new PieMosaic(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new PantonCurves(canvas, new Inspiration(), palettePanton));
			//_artistArray.push(new HorizontalLines(canvas, new Inspiration(), paletteCitrusGrove));
			//_artistArray.push(new KPetersWave(canvas, new Inspiration(), paletteCitrusGrove));
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPress);
		}
				
		private function keyPress(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.SPACE){
				if (_artistArray) {
					var i:int;
					for (i = 0; i < _artistArray.length; i++ ){
						//clear canvas
						_artistArray[i].canvas.clear();
					}
					for (i = 0; i < _artistArray.length; i++ ){
						//recreate art
						_artistArray[i].create();
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