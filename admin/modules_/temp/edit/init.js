<?php

jsLoadPages($module, array(
	'menutext' => 'Редактирование (edit)',					// пункт в меню (false - не показывать)
	'title' => 'Редактирование',								// заголовок окна
	'single' => false,											// один таб или несколько
	'open' => array(												// массив настроек для табов
		array(
			'title' => 'Редактируемый грид',					// заголовок таба
			'xtype' => 'editorgrid',							// тип таба (content, grid, editorgrid)
			'url' => './?page='.$module,						// URL для получения данных
			'url_delete' => './?page='.$module,				// URL для удаления
			'url_update' => './?page='.$module,				// URL для изменения
			'url_edit' => './?page='.$module,				// URL для изменения
			'bodystyle' => 'padding:0px;',					// CSS для таба
			'table' => 'site_news',									// таблица в БД, из которой берутся данные
			'key' => 'news_id',									// первичный ключ в таблице
			'expand' => 'title',									// растягивающаяся колонка
			'limit' => '5',										// по сколько записей на страницу выводить
			'defkey' => 'news_id',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'news_id',					// название колонки
					'width' => '5',								// ширина
					'header' => 'ID'								// заголовок
				),
				array(
					'dataIndex' => 'title',
					'header' => 'Название',
					'editor' => 'new Ext.form.TextField({allowBlank:false})'		// редактор, вызываемый для ячейки по двойному клику
				)
			)
		),
		array(														// таб со страницей, тип по умолчанию (content)
			'title' => 'Таб со страницей',					// заголовок таба
			'url' => './?page=index&action=second',			// URL для загрузки
			'refresh' => true,									// обновлять страницу при смене табов
			'closable' => true									// возможность закрыть таб
		)
	)
));

?>