<?php
include_once('modules/aModule.class.php');

class pages extends aModule
{

	function execute($arr)
	{
//		echo "<pre>";print_r($arr);echo "<pre>";die();

    	$result=row("SELECT `content` FROM `pages` WHERE `id` = ".$arr['send_params']['id']);
        $_SESSION['smarty']->assign('content' , $result['content']);


		$this->mod_display($this->prot);
    }

}

?>