package feathers.utils.filter
{
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
	}
}