/*
 * Ext JS Library 2.2
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.grid.EditorGridPanel=Ext.extend(Ext.grid.GridPanel,{clicksToEdit:2,isEditor:true,detectEdit:false,autoEncode:false,trackMouseOver:false,initComponent:function(){Ext.grid.EditorGridPanel.superclass.initComponent.call(this);if(!this.selModel){this.selModel=new Ext.grid.CellSelectionModel()}this.activeEditor=null;this.addEvents("beforeedit","afteredit","validateedit")},initEvents:function(){Ext.grid.EditorGridPanel.superclass.initEvents.call(this);this.on("bodyscroll",this.stopEditing,this,[true]);if(this.clicksToEdit==1){this.on("cellclick",this.onCellDblClick,this)}else{if(this.clicksToEdit=="auto"&&this.view.mainBody){this.view.mainBody.on("mousedown",this.onAutoEditClick,this)}this.on("celldblclick",this.onCellDblClick,this)}this.getGridEl().addClass("xedit-grid")},onCellDblClick:function(B,C,A){this.startEditing(C,A)},onAutoEditClick:function(C,B){if(C.button!==0){return }var E=this.view.findRowIndex(B);var A=this.view.findCellIndex(B);if(E!==false&&A!==false){this.stopEditing();if(this.selModel.getSelectedCell){var D=this.selModel.getSelectedCell();if(D&&D.cell[0]===E&&D.cell[1]===A){this.startEditing(E,A)}}else{if(this.selModel.isSelected(E)){this.startEditing(E,A)}}}},onEditComplete:function(B,D,A){this.editing=false;this.activeEditor=null;B.un("specialkey",this.selModel.onEditorKey,this.selModel);var C=B.record;var F=this.colModel.getDataIndex(B.col);D=this.postEditValue(D,A,C,F);if(String(D)!==String(A)){var E={grid:this,record:C,field:F,originalValue:A,value:D,row:B.row,column:B.col,cancel:false};if(this.fireEvent("validateedit",E)!==false&&!E.cancel){C.set(F,E.value);delete E.cancel;this.fireEvent("afteredit",E)}}this.view.focusCell(B.row,B.col)},startEditing:function(F,B){this.stopEditing();if(this.colModel.isCellEditable(B,F)){this.view.ensureVisible(F,B,true);var C=this.store.getAt(F);var E=this.colModel.getDataIndex(B);var D={grid:this,record:C,field:E,value:C.data[E],row:F,column:B,cancel:false};if(this.fireEvent("beforeedit",D)!==false&&!D.cancel){this.editing=true;var A=this.colModel.getCellEditor(B,F);if(!A.rendered){A.render(this.view.getEditorParent(A))}(function(){A.row=F;A.col=B;A.record=C;A.on("complete",this.onEditComplete,this,{single:true});A.on("specialkey",this.selModel.onEditorKey,this.selModel);this.activeEditor=A;var G=this.preEditValue(C,E);A.startEdit(this.view.getCell(F,B).firstChild,G)}).defer(50,this)}}},preEditValue:function(A,C){var B=A.data[C];return this.autoEncode&&typeof B=="string"?Ext.util.Format.htmlDecode(B):B},postEditValue:function(C,A,B,D){return this.autoEncode&&typeof C=="string"?Ext.util.Format.htmlEncode(C):C},stopEditing:function(A){if(this.activeEditor){this.activeEditor[A===true?"cancelEdit":"completeEdit"]()}this.activeEditor=null},onDestroy:function(){if(this.rendered){var C=this.colModel.config;for(var B=0,A=C.length;B<A;B++){var D=C[B];Ext.destroy(D.editor)}}Ext.grid.EditorGridPanel.superclass.onDestroy.call(this)}});Ext.reg("editorgrid",Ext.grid.EditorGridPanel);