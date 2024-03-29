package feathers.controls.renderers
{
	import feathers.controls.List;
	import feathers.events.FeathersEventType;
	import feathers.skins.IStyleProvider;
	
	/**
	 * The default item renderer for List control. Supports up to three optional
	 * sub-views, including a label to display text, an icon to display an
	 * image, and an "accessory" to display a UI control or another display
	 * object (with shortcuts for including a second image or a second label).
	 * 
	 * @see feathers.controls.List
	 */
	public class BaseDefaultListItemRenderer extends BaseDefaultItemRenderer implements IListItemRenderer
	{
		/**
		 * @copy feathers.controls.Button#STATE_UP
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_UP:String = "up";
		
		/**
		 * @copy feathers.controls.Button#STATE_DOWN
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_DOWN:String = "down";
		
		/**
		 * @copy feathers.controls.Button#STATE_HOVER
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_HOVER:String = "hover";
		
		/**
		 * @copy feathers.controls.Button#STATE_DISABLED
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_DISABLED:String = "disabled";
		
		/**
		 * @copy feathers.controls.Button#STATE_UP_AND_SELECTED
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_UP_AND_SELECTED:String = "upAndSelected";
		
		/**
		 * @copy feathers.controls.Button#STATE_DOWN_AND_SELECTED
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_DOWN_AND_SELECTED:String = "downAndSelected";
		
		/**
		 * @copy feathers.controls.Button#STATE_HOVER_AND_SELECTED
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_HOVER_AND_SELECTED:String = "hoverAndSelected";
		
		/**
		 * @copy feathers.controls.Button#STATE_DISABLED_AND_SELECTED
		 *
		 * @see #stateToSkinFunction
		 * @see #stateToIconFunction
		 * @see #stateToLabelPropertiesFunction
		 */
		public static const STATE_DISABLED_AND_SELECTED:String = "disabledAndSelected";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_TOP
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_TOP:String = "top";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_RIGHT
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_RIGHT:String = "right";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_BOTTOM
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_BOTTOM:String = "bottom";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_LEFT
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_LEFT:String = "left";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_MANUAL
		 *
		 * @see feathers.controls.Button#iconPosition
		 * @see feathers.controls.Button#iconOffsetX
		 * @see feathers.controls.Button#iconOffsetY
		 */
		public static const ICON_POSITION_MANUAL:String = "manual";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_LEFT_BASELINE
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_LEFT_BASELINE:String = "leftBaseline";
		
		/**
		 * @copy feathers.controls.Button#ICON_POSITION_RIGHT_BASELINE
		 *
		 * @see feathers.controls.Button#iconPosition
		 */
		public static const ICON_POSITION_RIGHT_BASELINE:String = "rightBaseline";
		
		/**
		 * @copy feathers.controls.Button#HORIZONTAL_ALIGN_LEFT
		 *
		 * @see feathers.controls.Button#horizontalAlign
		 */
		public static const HORIZONTAL_ALIGN_LEFT:String = "left";
		
		/**
		 * @copy feathers.controls.Button#HORIZONTAL_ALIGN_CENTER
		 *
		 * @see feathers.controls.Button#horizontalAlign
		 */
		public static const HORIZONTAL_ALIGN_CENTER:String = "center";
		
		/**
		 * @copy feathers.controls.Button#HORIZONTAL_ALIGN_RIGHT
		 *
		 * @see feathers.controls.Button#horizontalAlign
		 */
		public static const HORIZONTAL_ALIGN_RIGHT:String = "right";
		
		/**
		 * @copy feathers.controls.Button#VERTICAL_ALIGN_TOP
		 *
		 * @see feathers.controls.Button#verticalAlign
		 */
		public static const VERTICAL_ALIGN_TOP:String = "top";
		
		/**
		 * @copy feathers.controls.Button#VERTICAL_ALIGN_MIDDLE
		 *
		 * @see feathers.controls.Button#verticalAlign
		 */
		public static const VERTICAL_ALIGN_MIDDLE:String = "middle";
		
		/**
		 * @copy feathers.controls.Button#VERTICAL_ALIGN_BOTTOM
		 *
		 * @see feathers.controls.Button#verticalAlign
		 */
		public static const VERTICAL_ALIGN_BOTTOM:String = "bottom";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#ACCESSORY_POSITION_TOP
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryPosition
		 */
		public static const ACCESSORY_POSITION_TOP:String = "top";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#ACCESSORY_POSITION_RIGHT
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryPosition
		 */
		public static const ACCESSORY_POSITION_RIGHT:String = "right";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#ACCESSORY_POSITION_BOTTOM
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryPosition
		 */
		public static const ACCESSORY_POSITION_BOTTOM:String = "bottom";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#ACCESSORY_POSITION_LEFT
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryPosition
		 */
		public static const ACCESSORY_POSITION_LEFT:String = "left";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#ACCESSORY_POSITION_MANUAL
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryPosition
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryOffsetX
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#accessoryOffsetY
		 */
		public static const ACCESSORY_POSITION_MANUAL:String = "manual";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#LAYOUT_ORDER_LABEL_ACCESSORY_ICON
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#layoutOrder
		 */
		public static const LAYOUT_ORDER_LABEL_ACCESSORY_ICON:String = "labelAccessoryIcon";
		
		/**
		 * @copy feathers.controls.renderers.BaseDefaultItemRenderer#LAYOUT_ORDER_LABEL_ICON_ACCESSORY
		 *
		 * @see feathers.controls.renderers.BaseDefaultItemRenderer#layoutOrder
		 */
		public static const LAYOUT_ORDER_LABEL_ICON_ACCESSORY:String = "labelIconAccessory";
		
		/**
		 * The default <code>IStyleProvider</code> for all <code>BaseDefaultListItemRenderer</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;
		
		/**
		 * Constructor.
		 */
		public function BaseDefaultListItemRenderer()
		{
			super();
		}
		
		/**
		 * @private
		 */
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return BaseDefaultListItemRenderer.globalStyleProvider;
		}
		
		/**
		 * @private
		 */
		protected var _index:int = -1;
		
		/**
		 * @inheritDoc
		 */
		public function get index():int
		{
			return this._index;
		}
		
		/**
		 * @private
		 */
		public function set index(value:int):void
		{
			this._index = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get owner():List
		{
			return List(this._owner);
		}
		
		/**
		 * @private
		 */
		public function set owner(value:List):void
		{
			if(this._owner == value)
			{
				return;
			}
			if(this._owner)
			{
				this._owner.removeEventListener(FeathersEventType.SCROLL_START, owner_scrollStartHandler);
				this._owner.removeEventListener(FeathersEventType.SCROLL_COMPLETE, owner_scrollCompleteHandler);
			}
			this._owner = value;
			if(this._owner)
			{
				var list:List = List(this._owner);
				this.isSelectableWithoutToggle = list.isSelectable;
				if(list.allowMultipleSelection)
				{
					//toggling is forced in this case
					this.isToggle = true;
				}
				this._owner.addEventListener(FeathersEventType.SCROLL_START, owner_scrollStartHandler);
				this._owner.addEventListener(FeathersEventType.SCROLL_COMPLETE, owner_scrollCompleteHandler);
			}
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		/**
		 * @private
		 */
		override public function dispose():void
		{
			this.owner = null;
			super.dispose();
		}
	}
}
