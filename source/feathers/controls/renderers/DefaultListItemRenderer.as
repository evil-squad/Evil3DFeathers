package feathers.controls.renderers
{
	import feathers.controls.List;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 自定义的支持布局列表渲染项 
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultListItemRenderer extends BaseDefaultListItemRenderer
	{
		public function DefaultListItemRenderer()
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
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
				if(isInBounds)onTouchTarget(t.target);
			}
		}
		
		/**
		 *当子对象被点击后的处理。默认已实现关闭按钮被点击后的处理，关闭按钮名称为"btnClose"或"closeBtn"时生效
		 *子类可以覆盖此方法以实现特定目标被点击后的处理
		 */		
		protected function onTouchTarget(target:DisplayObject):void
		{
			onClick();
		}
		
		
		private function onClick():void
		{
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
		
		override public function set isSelected(value:Boolean):void
		{
			if(_isSelected == value)return;
			_isSelected = value;
		}
		
		override public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		protected function update(data:Object, owner:List):void
		{
			
		}
		
		override public function dispose():void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			super.dispose();
		}
	}
}


