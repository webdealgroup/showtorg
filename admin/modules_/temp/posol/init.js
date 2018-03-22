<?php

jsLoadPages($module, array(
	'menutext' => 'Посольства',					// пункт в меню (false - не показывать)
	'title' => 'Посольства',								// заголовок окна
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
			'table' => 'posol',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'name',									// растягивающаяся колонка
			'limit' => '100',										// по сколько записей на страницу выводить
			'defkey' => 'name',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '5',								// ширина
					'header' => 'ID'								// заголовок
				),
				array(
					'dataIndex' => 'name',
					'header' => 'Наименование',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'description',
					'header' => 'Посольство в РБ',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'turist',
					//'width' => '45',								// ширина
					'header' => 'Посольство РБ',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)/**/
			)
		)
	)
));

?>