<?php

// Создание меню

include_once('modules/aModule.class.php');
 
class carousel extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        $query="
            SELECT * 
            FROM items 
            WHERE young = 1
        ";
        $res = rows($query);

        $_SESSION['smarty']->assign('items', $res);

		$this->mod_display($this->prot);
	}
}
?>