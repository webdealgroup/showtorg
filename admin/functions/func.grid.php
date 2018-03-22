<?php

function initTabGrid($tab,$i) {

	$tab['keys'] = array();
	foreach ($tab['columns'] as $col)
		$tab['keys'][] = $col['dataIndex'];
	$tab['keys'] = implode(',',$tab['keys']);

?>

		var store = new Ext.data.Store({
			autoLoad: true,
			proxy: new Ext.data.HttpProxy({
				url: '<?=$tab['url']?>',
				method: 'POST',
				text: 'Loading...'
			}),
			baseParams: { table: '<?=$tab['table']?>', task: "getData", key: '<?=$tab['key']?>' },
			reader: new Ext.data.JsonReader()
		});

		var cm = new Ext.grid.ColumnModel([
			<?=json_objects($tab['columns'])?>
		]);
		cm.defaultSortable = true;

		this.tabs[<?=$i?>] = new Ext.grid.GridPanel({
			title: '<?=!empty($tab['title'])?$tab['title']:'...'?>',
			scope: this,
			border: false,
			store: store,
			cm: cm,
			viewConfig: { forceFit:true },
			autoExpandColumn: '<?=!empty($tab['expand'])?$tab['expand']:''?>',
			frame: false,
			selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),
			bodyStyle: '<?=!empty($tab['bodystyle'])?$tab['bodystyle']:''?>'
		});

<?php
}
?>