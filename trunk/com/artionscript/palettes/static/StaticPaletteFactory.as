package com.artionscript.palettes.static 
{
	import com.artionscript.palettes.Palette;
	import com.artionscript.palettes.Palette;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class StaticPaletteFactory
	{
		
		public function StaticPaletteFactory() 
		{
			
		}
		
		public static function randomPalette():Palette {
			
			var tempRan:int = Math.floor(Math.random() * 17);
			var palette:Palette;
			
			switch(tempRan) {
				case 0:
					palette = new PaletteAfrica();
				break;
				case 1:
					palette = new PaletteAvoidance();
				break;
				case 2:
					palette = new PaletteCitrusGrove();
				break;
				case 3:
					palette = new PaletteExperience();
				break;
				case 4:
					palette = new PaletteFruitAndFuzz();
				break;
				case 5:
					palette = new PaletteGrey();
				break;
				case 6:
					palette = new PaletteHyperactive();
				break;
				case 7:
					palette = new PaletteMajito();
				break;
				case 8:
					palette = new PalettePanton();
				break;
				case 9:
					palette = new PalettePhoenixTail();
				break;
				case 10:
					palette = new PaletteSandyStoneBeach();
				break;
				case 11:
					palette = new PaletteStepIntoTheLight();
				break;
				case 12:
					palette = new PaletteTune();
				break;
				case 13:
					palette = new PaletteVitaminC();
				break;
				case 14:
					palette = new PaletteWorldAtNight();
				break;
				case 15:
					var paletteCitrusAvoidance:Palette = new Palette();
					paletteCitrusAvoidance.addColours((new PaletteAvoidance()).colours);
					paletteCitrusAvoidance.addColours((new PaletteCitrusGrove()).colours);
					palette = paletteCitrusAvoidance;
				break;
				case 16:
					var paletteCitrusMajitoAvoidance:Palette = new Palette();
					paletteCitrusMajitoAvoidance.addColours((new PaletteAvoidance()).colours);
					paletteCitrusMajitoAvoidance.addColours((new PaletteCitrusGrove()).colours);
					paletteCitrusMajitoAvoidance.addColours((new PaletteMajito).colours);
					palette = paletteCitrusMajitoAvoidance;
				break;
			}
							
			return palette;
		}
	}

}