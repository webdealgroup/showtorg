<?php

jsLoadPages($module, array(
	'menutext' => 'Рейсы',
	'title' => 'Рейсы',
	'single' => false,
	'open' => array(
		array(
			'title' => 'Расписание',
			'xtype' => 'editorgrid',
			'url' => './?page='.$module,
			'url_delete' => './?page='.$module,
			'url_update' => './?page='.$module,
			'url_edit' => './?page='.$module,				// URL для изменения
			'bodystyle' => 'padding:0px;',
			'table' => 'site_flights',
			'key' => 'fly_id',
			'expand' => '',
			'limit' => '10',
			'defkey' => 'fly_id',
			'defdir' => 'asc',
			'columns' => array(
				array(
					'dataIndex' => 'fly_id',
					'width' => '5',
					'header' => 'ID'
				),
				array(
					'dataIndex' => 'flight_no',
					'header' => 'Номер рейса',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'
				)
			)
		),
		array(
			'title' => 'Таб со страницей',
			'url' => './?page=index&action=second',
			'refresh' => true,
			'closable' => true
		)
	)
));

?>