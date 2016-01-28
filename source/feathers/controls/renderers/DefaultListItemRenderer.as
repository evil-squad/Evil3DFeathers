package feathers.controls.renderers
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.List;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 默认的列表渲染项 
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultListItemRenderer extends BaseDefaultListItemRenderer
	{
		private static var HELP_POINT:Point =  new Point(0,0);
		
		private var _textFiled:Label;
		
		public function DefaultListItemRenderer()
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		override protected function initialize():void
		{
			_textFiled = new Label();
			addChild(_textFiled);
			this.width = 80;
			this.height = 20;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				update(_data, owner);
			}
		}
		
		/**
		 *当面板被点击时
		 */		
		protected function onTouch(e:TouchEvent):void
		{
			var t:Touch = e.getTouch(this, TouchPhase.ENDED);
			if(t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELPER_POINT);
				var isInBounds:Boolean = true;
				if(t.target is DisplayObjectContainer)
				{
					isInBounds = DisplayObjectContainer(t.target).contains(this.stage.hitTest(HELPER_POINT, true));
				}
				if(isInBounds)onTouchItem(t.target);
			}
		}
		
		private function onTouchItem(target:DisplayObject):void
		{
			onTouchTarget(target);
			this.dispatchEventWith(Event.TRIGGERED);
			
			//清除上次的选中状态
			var clickedItemRender:DefaultListItemRenderer = this.owner.customSelectedItemRender as DefaultListItemRenderer;
			if(clickedItemRender != null && clickedItemRender == this && owner.selectedItem == this._data)
			{
				//过滤同一项
				return;
			}
			
			if(clickedItemRender)
			{
				clickedItemRender.isSelected = false;
			}
			
			//当前项被选中
			clickedItemRender = this;
			clickedItemRender.isSelected = true;
			
			//设置选中数据项，List会发送Event.Change事件
			owner.selectedItem = this._data;
			
			//保存当前被选中的ItemRender,会发送Event.Select事件
			owner.customSelectedItemRender = clickedItemRender ;
		}
		
		private function _onDoubleClick( e:MouseEvent ):void
		{
			if( !checkClick() )
				return;
			
			if( _doubleClickFun != null )
				_doubleClickFun( this );
		}
		
		private var _doubleClickFun:Function;
		public function set doubleClickFunction(value:Function):void
		{
			_doubleClickFun = value;
			if(_doubleClickFun != null)
			{
				Starling.current.nativeStage.addEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
			}else{
				Starling.current.nativeStage.removeEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
			}
		}
		
		public function get doubleClickFunction():Function
		{
			return _doubleClickFun;
		}
		
		private function checkClick():Boolean
		{
			HELP_POINT.x = Starling.current.nativeStage.mouseX;
			HELP_POINT.y = Starling.current.nativeStage.mouseY;
			var mousePoint : Point = this.globalToLocal(HELP_POINT);
			return  hitTest(mousePoint) && isEnabled;
		}
		
		/**
		 *当子对象被点击后的处理。默认已实现关闭按钮被点击后的处理，关闭按钮名称为"btnClose"或"closeBtn"时生效
		 *子类可以覆盖此方法以实现特定目标被点击后的处理
		 */		
		protected function onTouchTarget(target:DisplayObject):void
		{
			
		}
		
		/**
		 * @private
		 */
		override protected function trigger():void
		{
			//此逻辑以改用onTouch方法以实现子对象的点击判定， 因此不再执行tirgger方法
		}
		
		override public function set isSelected(value:Boolean):void
		{
			if(_isSelected == value)return;
			_isSelected = value;
			if(_textFiled)_textFiled.color = value ? 0x00FF00 : 0xFFFFFF;
		}
		
		override public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		protected function update(data:Object, owner:List):void
		{
			if(_textFiled)_textFiled.text = String(data);
		}
		
		override public function dispose():void
		{
			if(_textFiled)_textFiled.dispose();
			_textFiled = null;
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			Starling.current.nativeStage.removeEventListener( MouseEvent.DOUBLE_CLICK, _onDoubleClick);
			super.dispose();
		}
	}
}


