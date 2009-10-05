package com.artionscript.artists.grid
{
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	import com.artionscript.artists.Artist;
	import com.artionscript.canvas.Canvas;
	import com.artionscript.inspirations.Inspiration;
	import com.artionscript.palettes.Palette;
	
	import com.artionscript.tools.Tool;
	import com.artionscript.tools.FillVO;
	import com.artionscript.tools.LineVO;
	import com.artionscript.tools.stamps.RectangleStamp;

	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class Grid extends Artist
	{
		protected var COLUMN_SPACING:Number = 35;
		protected var ROW_SPACING:Number = 35;
		
		protected var MIN_WIDTH:Number = 30;
		protected var MAX_WIDTH:Number = 30;
		
		protected var MAX_X_OFFSET:Number = 0;
		protected var MAX_Y_OFFSET:Number = 0;
		
		protected var ROTATION_MIN:Number = 0;
		protected var ROTATION_MAX:Number =0;
		
		protected var ALPHA_MIN:Number = 1;
		protected var ALPHA_MAX:Number = 1;
		
		public function Grid(canvas:Canvas, inspiration:Inspiration, palette:Palette) 
		{
			super(canvas, inspiration, palette);
			setVariables();
			create();
		}
		
		//override variables
		override protected function setVariables():void {
			//externally define variables to avoid frequent updating/committing of class
			include "includes/GridVariables.as";
		}
		
		override public function create():void {
			var fillVO:FillVO = new FillVO();
			var lineVO:LineVO = null;
					
			var columns:int = Math.floor(canvas.cWidth / COLUMN_SPACING) + 1;
			var rows:int = Math.floor(canvas.cHeight / ROW_SPACING) + 1;
			
			var tempTool:Tool;
			var tempWidth:Number;
			var tempHeight:Number;
			
			_toolArray = new Array();
			for (var i:int = rows; i >= 0; i--){
				for (var j:int = columns; j >= 0; j--){
					
					fillVO.color = getAColour();
					
					tempTool = buildTool(fillVO, lineVO);
					tempTool.x = (j * COLUMN_SPACING) + ((Math.random() * (MAX_X_OFFSET * 2)) - MAX_X_OFFSET);
					tempTool.y = (i * ROW_SPACING) + ((Math.random() * (MAX_Y_OFFSET * 2)) - MAX_Y_OFFSET);
					
					tempTool.alpha = (Math.random() * (ALPHA_MAX - ALPHA_MIN)) + ALPHA_MIN;
					tempTool.rotation = (Math.random() * (ROTATION_MAX - ROTATION_MIN)) + ROTATION_MIN;
					
					_toolArray.push(tempTool);
				}
			}
			finaliseCreate();
		}
		
		override protected function finaliseCreate():void {	
			if (_toolArray && _toolArray.length > 0){
				var arrLen:int = _toolArray.length - 1;
				var tempArr:Array = _toolArray.slice();
				var tempRan:Number;
				var tempTool:Tool;
				for (var i:int = 0; i <= arrLen; i++) {
					tempTool = tempArr[i] as Tool;
					tempRan = i + Math.floor((Math.random()*(arrLen-i)));
					tempArr[i] = tempArr[tempRan];
					tempArr[tempRan] = tempTool;
				}
			
				for (var j:int = arrLen; j>=0; j--) {
					tempTool = tempArr[j];
					canvas.addChild(tempTool);
				}
				
				tempArr = null;
			}
		}
		
		override protected function buildTool(...args):Tool {
			var tempWidth:Number = (Math.random() * (MAX_WIDTH - MIN_WIDTH)) + MIN_WIDTH;
			var tempHeight:Number = tempWidth;
			return createTool(tempWidth, tempHeight, args[0], args[1]);
		}
	}
}