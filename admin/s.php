<?php
/*
$prs = array(
		'out1' => array(
				'proc' => 'getComments',
				'tpl' => 'test/action1',
				'p' => array(
					'accId' => 29
				)
		),
		'out2' => array(
				'proc'=> 'getTime',
				'tpl'=> 'test/time',
				'p'=> array(
					
				)
		),
		'out3' => array(
				'proc'=> 'getComments',
				'tpl'=> 'test/action1',
				'p'=> array(
					'accId' => 30
				)
		),
		'out4' => array(
				'proc' => 'getComments',
				'tpl' => 'test/action1',
				'p' => array(
					'accId' => 61
				)
		)
);
*/
$prs = array(
		'content' => array(
				'proc'=> 'getContent',
				'tpl'=> 'desktop/modules',
				'p'=> array(
					'pageID' => '1'
				)
		),
        'time' => array(
				'proc'=> 'getTime',
				'tpl'=> 'test/time',
				'p'=> array(
					
				)
		)
        
);

echo serialize($prs);


?>