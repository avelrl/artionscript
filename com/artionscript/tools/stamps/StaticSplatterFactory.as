package com.artionscript.tools.stamps 
{
	import com.artionscript.tools.stamps.splatter.*;
	import com.artionscript.tools.stamps.grime.*;
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class StaticSplatterFactory
	{
		public static function getRandomSplatter(width:Number=0, height:Number=0, fillVO:FillVO=null, lineVO:LineVO=null, centre:Boolean=false):Tool {
			
			var tempRan:int = Math.floor(Math.random() * 6);
			var splatter:Tool;
			
			switch(tempRan) {
				case 0:
					splatter = new SplatterStamp1(width, height, fillVO, lineVO, centre);
				break;
				case 1:
					splatter = new SplatterStamp2(width, height, fillVO, lineVO, centre);
				break;
				case 2:
					splatter = new SplatterStamp3(width, height, fillVO, lineVO, centre);
				break;
				case 3:
					splatter = new GrimeStamp5(width, height, fillVO, lineVO, centre);
				break;
				case 4:
					splatter = new GrimeStamp6(width, height, fillVO, lineVO, centre);
				break;
				/*case 5:
					splatter = new GrimeStamp7(width, height, fillVO, lineVO, centre);
				break;*/
				case 5:
					splatter = new GrimeStamp8(width, height, fillVO, lineVO, centre);
				break;
			}
			
			return splatter;
		}
	}

}