<?php

jsLoadPages($module, array(
	'menutext' => 'Структура модулей',					// пункт в меню (false - не показывать)
	'title' => 'Структура модулей',								// заголовок окна
	'width' => '800',
	'height' => '500',
	'single' => false,											// один таб или несколько
	'open' => array(												// массив настроек для табов
		array(
			'title' => 'Все модули',					// заголовок таба
			'xtype' => 'tree',							// тип таба (content, grid, editorgrid)
			'url' => './?page='.$module,						// URL для получения данных
			'bodystyle' => 'padding:0px;',					// CSS для таба
			'table' => 'modules',
			'key' => 'id'
		)
	)
));

?>