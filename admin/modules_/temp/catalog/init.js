<?php

jsLoadPages($module, array(
	'menutext' => 'Каталог',					// пункт в меню (false - не показывать)
	'title' => 'Каталог',								// заголовок окна
	'single' => false,											// один таб или несколько
	'open' => array(												// массив настроек для табов
		array(
			'title' => 'Список позиций',					// заголовок таба
			'xtype' => 'editorgrid',							// тип таба (content, grid, editorgrid)
			'url' => './?page='.$module,						// URL для получения данных
			'url_delete' => './?page='.$module,				// URL для удаления
			'url_update' => './?page='.$module,				// URL для изменения
			'url_edit' => './?page='.$module.'&action=edit',				// URL для изменения
			'bodystyle' => 'padding:0px;',					// CSS для таба
			'table' => 'items',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'name',									// растягивающаяся колонка
			'limit' => '200',										// по сколько записей на страницу выводить
			'defkey' => 'id',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '5',								// ширина
					'header' => 'ID'								// заголовок
				),
				array(
					'dataIndex' => 'name',
					'header' => 'Название',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'cost1',
					'width' => '25',								// ширина
					'header' => 'Цена без НДС',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'cost2',
					'width' => '25',								// ширина
					'header' => 'Цена с НДС',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'id_theme',
					'width' => '25',								// ширина
					'header' => 'Cat_ID',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)
			)
		)
	)
));

?>