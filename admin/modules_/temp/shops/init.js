<?php

jsLoadPages($module, array(
	'menutext' => 'Магазины',					// пункт в меню (false - не показывать)
	'title' => 'Магазины',								// заголовок окна
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
			'table' => 'shops',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'title',									// растягивающаяся колонка
			'limit' => '250',										// по сколько записей на страницу выводить
			'defkey' => 'id',								// колонка для сортировки по умолчанию
			//'defdir' => '',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '5',								// ширина
					'header' => 'ID'	// заголовок
				),
				array(
					'dataIndex' => 'id_page',
                    'width' => '45',
					'header' => 'Страница №',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'images',
					'width' => '65',	
					'header' => 'Иконки',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'title',
					'header' => 'Наименование',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'velcom',
					'header' => 'Velcom',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'mts',
					'header' => 'МТС',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'gor',
					'header' => 'гор. тел.',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'email',
					'header' => 'E-mail',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'icq1',
					'header' => 'icq1',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'icq2',
					'header' => 'icq2',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'title_pav',
					'header' => 'павильон(ы)',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				),
				array(
					'dataIndex' => 'pav',
                    'width' => '45',
					'header' => 'Номера павильонов',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)
			)
		)
	)
));

?>