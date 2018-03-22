<?php
include_once('modules/aModule.class.php');

class pages extends aModule
{

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";//die();

        if (!isset($arr["action"]) || strlen($arr["action"])==0)
        {
            $arr["action"] = $arr['send_params']['id'];
        }

		$query="SELECT * FROM currency WHERE id = 2 ";
		$r=rows($query);
        $_SESSION['smarty']->assign('showing',$r[0]['value']);
          
        $_SESSION['smarty']->assign('mod_name' , $result['content']);

    	$result=row("SELECT * FROM `pages` WHERE `id` = ".$arr["action"]);
        
        
        
        $_SESSION['smarty']->assign('page_arr' , $result);


		$this->mod_display($this->prot);
    }

}

?>