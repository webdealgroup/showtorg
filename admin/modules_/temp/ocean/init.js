<?php

jsLoadPages($module, array(
	'menutext' => 'ocean',					// пункт в меню (false - не показывать)
	'title' => 'ocean',								// заголовок окна
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
			'table' => 'ocean',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'zaezd',									// растягивающаяся колонка
			'limit' => '200',										// по сколько записей на страницу выводить
			'defkey' => 'id',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '5',								// ширина
					'header' => 'ID'	// заголовок
/*
id
	
id_co
	
id_hotel
	
napravlenie
	
nomer
	
pitanie
	
chel
	
zaezd
	
day
	
cosht
	
desc
	
spec
	
display
*/

				),
				array(
					'dataIndex' => 'id_co',
					'width' => '15',								// ширина
					'header' => 'id_co',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'id_hotel',
					'width' => '15',								// ширина
					'header' => 'id_hotel',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'napravlenie',
					'width' => '15',								// ширина
					'header' => 'napravlenie',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'nomer',
					'width' => '25',								// ширина
					'header' => 'nomer',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'pitanie',
					'width' => '25',								// ширина
					'header' => 'pitanie',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'chel',
					'width' => '10',								// ширина
					'header' => 'chel',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'zaezd',
					'width' => '25',								// ширина
					'header' => 'zaezd',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'day',
					'width' => '25',								// ширина
					'header' => 'day',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'cosht',
					'width' => '15',								// ширина
					'header' => 'cosht',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),/*
				array(
					'dataIndex' => 'desc',
					'width' => '25',								// ширина
					'header' => 'desc',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),*/
				array(
					'dataIndex' => 'spec',
					'width' => '10',								// ширина
					'header' => 'spec',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'display',
					'width' => '25',								// ширина
					'header' => 'display',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)
			)
		)
	)
));

?>