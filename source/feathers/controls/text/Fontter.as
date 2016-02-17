package feathers.controls.text
{
	import flash.text.TextFormat;
	import flash.utils.Dictionary;

	/**
	 * 字体工具,支持多套字体的嵌入 
	 * @author wewell@163.com
	 * 
	 */	
	public class Fontter
	{
		//字体英文名
		public static const FONT_Hei:String = "SimHei,黑体";
		public static const FONT_YaHei:String = "Microsoft YaHei";
		public static const FONT_Sun:String = "SimSun";
		public static const FONT_Lisu:String = "LiSu";
		public static const FONT_huaLisu:String = "STLiti";//华文隶书
		public static const FONT_Arial:String = "Arial";
		
		public static var DEFAULT_FONT_NAME:String = Fontter.FONT_YaHei;//MSYaHei SimSun
		public static var DEFAULT_FONT_SIZE:int = 12;
		public static var DEFAULT_FONT_COLOR:uint = 0x000000;
		
		//常用文本滤镜
		public static var filterObj:Object = {};//<id(String)-->filter(Object)>
		
		//常用文本颜色及其描边颜色
		public static var textFormatObj:Object = {};//<id(String)-->textFormat(Object)>
		
		public static var truncateToFit:Boolean = true;
		
		public static  var embedFonts:Boolean = false;
		public static var sharpness:Number = 0;
		
		private static var _embedFonts:Dictionary = new Dictionary();
		
		public static function addEmbedFont(systemFontName:String, emebedRegularName:String, embedBoldName:String):void
		{
			_embedFonts[systemFontName] = [emebedRegularName, embedBoldName];
		}
		
		public static function removeEmbedFont(systemFontName:String):void
		{
			delete _embedFonts[systemFontName];
		}
		
		public static function transTextFormat(tf:TextFormat):TextFormat
		{
			if(!tf || !embedFonts ||  !_embedFonts.hasOwnProperty(tf.font)) return tf;
			var embedNames:Array = _embedFonts[tf.font];
			tf.font = tf.bold ? embedNames[1] : embedNames[0];
			return tf;
		}
	}
}