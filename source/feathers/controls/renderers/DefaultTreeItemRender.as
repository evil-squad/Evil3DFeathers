package feathers.controls.renderers
{
	import feathers.controls.ToggleButton;
	import feathers.controls.Tree;
	import feathers.data.TreeNode;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 * 默认的支持布局树渲染项 
	 * @author wewell@163.com
	 * 
	 */	
	public class DefaultTreeItemRender extends DefaultListItemRenderer
	{
		private var _toggleButton:ToggleButton;
		protected var  depthPaddingLeft:int = 30;
		
		public function DefaultTreeItemRender()
		{
			doubleClickFunction = doubleClick;
		}
		
		override protected function commitData():void
		{
			if(this._data && this._owner)
			{
				renderTreeNode(_data as TreeNode);
				if(_toggleButton && treeNode)_toggleButton.isSelected = treeNode.expanded ;
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
			expandChange();
			e.stopImmediatePropagation();
		}
		
		/**
		 *当子对象被点击后的处理。默认已实现关闭按钮被点击后的处理，关闭按钮名称为"btnClose"或"closeBtn"时生效
		 *子类可以覆盖此方法以实现特定目标被点击后的处理
		 */		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			
		}
		
		private function expandChange():void
		{
			this.treeNode.expanded = !treeNode.expanded;
			
			refleshTree();
		}
		
		private function doubleClick(item:DefaultListItemRenderer):void
		{
			if(treeNode && treeNode.hasChildren)expandChange();
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
		
		protected function renderTreeNode(node:TreeNode):void
		{
			
		}
		
		override public function dispose():void
		{
			if(_toggleButton != null)
			{
				_toggleButton.removeEventListener(Event.TRIGGERED, onNodeBtnClick);
			}
			_toggleButton = null;
			
			super.dispose();
		}
	}
}



