<?php

jsLoadPages($module, array(
	'menutext' => 'napr',					// пункт в меню (false - не показывать)
	'title' => 'napr',								// заголовок окна
	'single' => false,											// один таб или несколько
	'open' => array(												// массив настроек для табов
		array(
			'title' => 'Список',					// заголовок таба
			'xtype' => 'editorgrid',							// тип таба (content, grid, editorgrid)
			'url' => './?page='.$module,						// URL для получения данных
			'url_delete' => './?page='.$module,				// URL для удаления
			'url_update' => './?page='.$module,				// URL для изменения
			'url_edit' => './?page='.$module.'&action=edit',				// URL для изменения
			'bodystyle' => 'padding:0px;',					// CSS для таба
			'table' => 'napr',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'name',									// растягивающаяся колонка
			'limit' => '100',										// по сколько записей на страницу выводить
			'defkey' => 'name',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '10',								// ширина
					'header' => 'ID'								// заголовок
				),
				array(
					'dataIndex' => 'id_theme',
					'width' => '15',
					'header' => 'id_theme',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'name',
					'header' => 'Наименование',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)
			)
		)
	)
));

?>