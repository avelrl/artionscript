package com.artionscript.tools.stamps.florids 
{
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class StaticFloridFactory
	{
		public static function getRandomFlorid(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):Tool {
			
			var tempRan:int = Math.floor(Math.random() * 6);
			var florid:Tool;
			
			switch(tempRan) {
				case 0:
					florid = new Florid1(width, height, fillVO, lineVO, centre);
				break;
				case 1:
					florid = new Florid2(width, height, fillVO, lineVO, centre);
				break;
				case 2:
					florid = new Florid3(width, height, fillVO, lineVO, centre);
				break;
				case 3:
					florid = new Florid4(width, height, fillVO, lineVO, centre);
				break;
				case 4:
					florid = new Florid5(width, height, fillVO, lineVO, centre);
				break;
				case 5:
					florid = new Florid6(width, height, fillVO, lineVO, centre);
				break;
			}
			
			return florid;
		}
	}

}