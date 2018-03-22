<?php

jsLoadPages($module, array(
	'menutext' => 'Структура сайта',					// пункт в меню (false - не показывать)
	'title' => 'Структура',								// заголовок окна
	'width' => '800',
	'height' => '500',
	'single' => false,											// один таб или несколько
	'open' => array(												// массив настроек для табов
		array(
			'title' => 'Все страницы',					// заголовок таба
			'xtype' => 'tree',							// тип таба (content, grid, editorgrid)
			'url' => './?page='.$module,						// URL для получения данных
			'bodystyle' => 'padding:0px;',					// CSS для таба
			'table' => 'galleries',
			'key' => 'id'
		)
	)
));

?>