<?php
require_once('modules/aModule.class.php');

class desktop extends aModule
{	
    function execute($arr)
    {
    	echo "<pre>"; print_r($arr); echo "</pre>"; die();
		
		if (!isset($this->p['page']) || strlen($this->p['page'])==0) $this->p['page'] = "desktop";
 
        $_SESSION['smarty']->assign('template', $this->p['page']);
        $this->mod_display($this->prot);
    }
	
	function modules($arr, $db_account) 			
		{include "modules/desktop/m/modules.php";}

}
?>