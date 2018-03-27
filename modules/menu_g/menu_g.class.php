<?php
include_once('modules/aModule.class.php');

class menu_g extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        //echo "<pre>"; print_r($arr);echo "</pre>"; die();

        $_SESSION['smarty']->assign('menu_g',$this->getPageChildren(1));
        $_SESSION['smarty']->assign('page', $arr['send_params']['page']);

		$this->mod_display($this->prot);
	}
    
    function getPageChildren ($id=0) 
    {

      	$result = rows("SELECT * FROM `pages` WHERE `parent_id` = ".$id."  ORDER BY `sort` ASC ");
        return $result;
    }        
}

?>