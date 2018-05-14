<?php
include_once('site/modules/aModule.class.php');

class menu_g extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		$this->mod_display($this->prot);
	}
    

}

?>