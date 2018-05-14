<?php
include_once('site/modules/aModule.class.php');

class menu_g extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        $_SESSION['smarty']->assign('menu_g', $this->get_data('get_pages', array()));  // поучаем меню
	    $this->mod_display($this->prot);
	}
    

}

?>