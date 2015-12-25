package feathers.controls.renderers
{
	import feathers.controls.ToggleButton;
	import feathers.controls.Tree;
	import feathers.data.TreeNode;
	
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
			this.treeNode.expanded = !treeNode.expanded;
			
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
		
		protected function renderTreeNode(node:TreeNode):void
		{
			
		}
	}
}



