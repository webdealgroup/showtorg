<?php

jsLoadPages($module, array(
	'menutext' => 'Новости',					// пункт в меню (false - не показывать)
	'title' => 'Новости',								// заголовок окна
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
			'table' => 'news',									// таблица в БД, из которой берутся данные
			'key' => 'id',									// первичный ключ в таблице
			'expand' => 'title',									// растягивающаяся колонка
			'limit' => '100',										// по сколько записей на страницу выводить
			'defkey' => 'id',								// колонка для сортировки по умолчанию
			'defdir' => 'asc',									// направление сортировки по умолчанию
			'columns' => array(									// описание колонок грида
				array(
					'dataIndex' => 'id',					// название колонки
					'width' => '10',								// ширина
					'header' => 'ID'								// заголовок
				),
				array(
					'dataIndex' => 'date_news',
					'header' => 'Дата',
                    'editor' => 'new Ext.form.TextField({allowBlank:false})'		// СЂРµРґР°РєС‚РѕСЂ, РІС‹Р·С‹РІР°РµРјС‹Р№ РґР»СЏ СЏС‡РµР№РєРё РїРѕ РґРІРѕР№РЅРѕРјСѓ РєР»РёРєСѓ
				),
				array(
					'dataIndex' => 'title',
					'header' => 'Заглавие',
                    'editor' => 'new Ext.form.TextField({allowBlank:false})'		// СЂРµРґР°РєС‚РѕСЂ, РІС‹Р·С‹РІР°РµРјС‹Р№ РґР»СЏ СЏС‡РµР№РєРё РїРѕ РґРІРѕР№РЅРѕРјСѓ РєР»РёРєСѓ
				),
				array(
					'dataIndex' => 'short_text',
					'header' => 'Кратое описание',
                    'editor' => 'new Ext.form.TextField({allowBlank:false})'		// СЂРµРґР°РєС‚РѕСЂ, РІС‹Р·С‹РІР°РµРјС‹Р№ РґР»СЏ СЏС‡РµР№РєРё РїРѕ РґРІРѕР№РЅРѕРјСѓ РєР»РёРєСѓ
				),
				array(
					'dataIndex' => 'url_news',
					'header' => 'Полная ссылка на новость',
                    'editor' => 'new Ext.form.TextField({allowBlank:false})'		// СЂРµРґР°РєС‚РѕСЂ, РІС‹Р·С‹РІР°РµРјС‹Р№ РґР»СЏ СЏС‡РµР№РєРё РїРѕ РґРІРѕР№РЅРѕРјСѓ РєР»РёРєСѓ
				)
			)
		)
	)
));

?>