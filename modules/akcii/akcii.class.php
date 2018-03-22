<?php
include_once('modules/aModule.class.php');

class akcii extends aModule
{ 
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        $_SESSION['smarty']->assign('akcii_items',$this->getPageChildren($arr['action']));
		$this->mod_display($this->prot);
	}
    
    function getPageChildren($id=0) 
    {
      	$rrr = rows("SELECT * FROM `templates` WHERE `parent_id` = ".$id." ");
        
        //echo "<pre>"; print_r($rrr); echo "</pre>"; //die();
        /*
        foreach ($rrr as $k=>$v)
        {
            $rrr[$k]['title'] = iconv('utf-8', 'windows-1251', $rrr[$k]['title']);            
            $rrr[$k]['content'] = iconv('utf-8', 'windows-1251', $rrr[$k]['content']);            
        }*/
        return $rrr;
    }        
}

?>