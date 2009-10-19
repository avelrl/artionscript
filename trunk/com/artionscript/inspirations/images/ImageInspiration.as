package com.artionscript.inspirations.images 
{
	import com.artionscript.inspirations.Inspiration;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Trevor Boyle
	 */
	public class ImageInspiration extends Inspiration
	{
	
		protected var _url:String;
		private var _loader:Loader;
		private var _bmpData:BitmapData;
		
		public function ImageInspiration() {
			ready = false;
			type = Inspiration.IMAGE_TYPE;
		}
		
		protected function loadImage():void {
			if(_url){
				_loader = new Loader();
				_loader.addEventListener(Event.COMPLETE, onComplete);
				_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				_loader.load(new URLRequest(_url));
			}
		}
		
		private function onComplete(e:Event):void{	
			var image:Bitmap = Bitmap(_loader.content);
			_bmpData = image.bitmapData;
			ready = true;
		}
		
		public function get bmpData():BitmapData {
			return _bmpData;
		}
	}

}