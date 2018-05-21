 <?php
require_once('site/modules/aModule.class.php');

class list_engine_templates extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die();

    	//$data = rows("SELECT * FROM templates");

		//$_SESSION['smarty']->assign('templates',$data);
		$this->mod_display($this->prot);
	}
    
}
?>