package feathers.utils.filter
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	
	import starling.display.DisplayObject;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;

	public class GrayFilter
	{
		private static var _grayFilter:FragmentFilter;
		public static function getFragGrayFilter():FragmentFilter
		{
			var v:Number = 0.33;
			if (_grayFilter == null)
			{
				var	data:Array = [v, v, v, 0, 0,
					v, v, v, 0, 0,
					v, v, v, 0, 0,
					0, 0, 0, 1, 0];
				_grayFilter = new starling.filters.ColorMatrixFilter(Vector.<Number>(data));
			}
			
			return _grayFilter;
		}
		
		/**
		 *使Starling显示对象变灰 
		 */		
		public static function gray(starlingDisplay:starling.display.DisplayObject):void
		{
			if(starlingDisplay != null)starlingDisplay.filter = getFragGrayFilter();
		}
		
		public static function unGray(starlingDisplay:starling.display.DisplayObject):void
		{
			if(starlingDisplay != null && starlingDisplay.filter == _grayFilter)starlingDisplay.filter = null;
		}
		
		/**
		 * 为显示对象添加灰色滤镜
		 * @param source 显示对象
		 * 
		 */
		private static var grayFilters:Array;
		public static function grayNativeDisplay(source:flash.display.DisplayObject):void {
			if(grayFilters == null){
				grayFilters = [getNativeGrayFilter()];
			}
			source.filters = grayFilters;
		}
		
		/**
		 * 获取灰色滤镜
		 * @private
		 * 
		 */
		private static function getNativeGrayFilter():flash.filters.ColorMatrixFilter {
			var grayColorMat:Array =  [
				1/3, 1/3, 1/3, 0, 0,
				1/3, 1/3, 1/3, 0, 0,
				1/3, 1/3, 1/3, 0, 0,
				0, 0, 0, 1, 0 ];
			return  new flash.filters.ColorMatrixFilter(grayColorMat)
		}
		
		public static function grayBitmapData(bmd:BitmapData):BitmapData
		{
			var grayBmd:BitmapData = new BitmapData(bmd.width, bmd.height,true,0);
			var bm:flash.display.Bitmap = new flash.display.Bitmap(bmd);
			grayNativeDisplay(bm);
			grayBmd.draw(bm);
			return grayBmd;
		}
	}
}