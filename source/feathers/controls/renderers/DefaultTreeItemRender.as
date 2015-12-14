package feathers.controls.renderers
{
	import feathers.controls.ToggleButton;
	import feathers.controls.Tree;
	import feathers.controls.renderers.LayoutGroupListItemRenderer;
	import feathers.data.TreeNode;
	
	import starling.events.Event;
	
	/**
	 * 默认的支持布局树渲染项 
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultTreeItemRender extends LayoutGroupListItemRenderer
	{
		private var _toggleButton:ToggleButton;
		protected var  depthPaddingLeft:int = 30;
		
		public function DefaultTreeItemRender()
		{
		}
		
		override protected function initialize():void
		{
			this.addEventListener(Event.TRIGGERED, onClick);
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				update(_data as TreeNode, owner as Tree);
			}
		}
		
		protected function set toggleButton(value:ToggleButton):void
		{
			if(_toggleButton == value)return;
			if(_toggleButton != null)
			{
				_toggleButton.removeEventListener(Event.TRIGGERED, onNodeBtnClick);
			}
			_toggleButton = value;
			if(_toggleButton != null)
			{
				_toggleButton.addEventListener(Event.TRIGGERED, onNodeBtnClick);
			}
		}
		
		protected function get toggleButton():ToggleButton
		{
			return _toggleButton;
		}
		
		private function onNodeBtnClick(e:Event):void
		{
			this.treeNode.expanded = !treeNode.expanded;
			
			if(_toggleButton)_toggleButton.isToggle = !_toggleButton.isToggle;
			
			refleshTree();
			
			e.stopImmediatePropagation();
		}
		
		private function refleshTree():void
		{
			tree.updateTree();
		}
		
		protected function get treeNode():TreeNode
		{
			return _data as TreeNode;
		}
		
		protected function get tree():Tree
		{
			return _owner as Tree;
		}
		
		private function onClick():void
		{
			//清除上次的选中状态
			var clickedItemRender:DefaultTreeItemRender = this._owner.customSelectedItemRender as DefaultTreeItemRender;
			if(clickedItemRender)
			{
				clickedItemRender.isSelected = false;
			}
			
			//当前项被选中
			clickedItemRender = this;
			clickedItemRender.isSelected = true;
			//保存当前被选中的ItemRender
			_owner.customSelectedItemRender = clickedItemRender ;
			
			//设置选中下标，List会发送Event.Change事件
			_owner.selectedIndex = this._data ?  this._data.index : -1;
			_owner.selectedItem = this._data;
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
		
		protected function update(node:TreeNode, owner:Tree):void
		{
			
		}
	}
}



