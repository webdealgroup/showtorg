<?php
include_once('modules/aModule.class.php');

class search_form extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die();

		$_SESSION['smarty']->assign('searchword',$arr['send_params']['searchword']);
       
		$this->mod_display($this->prot);
	}
}
?>