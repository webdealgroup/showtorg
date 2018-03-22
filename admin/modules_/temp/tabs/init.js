<?php

jsLoadPages($module, array(
	'menutext' => 'Страница с табами (tabs)',
	'title' => 'Окно с табами',
	'single' => false,
	'open' => array(
		array(
			'title' => 'Первый таб',
			'url' => './?page='.$module
		),
		array(
			'title' => 'Второй таб',
			'url' => './?page='.$module.'&action=second',
			'refresh' => true,
			'closable' => true
		)
	)
));

?>