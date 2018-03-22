<?php
include_once('modules/aModule.class.php');

class articles extends aModule
{ 
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();
        
        $_SESSION['smarty']->assign('articles_items', $this->getPageChildren(1));//$this->getPageChildren($arr['action']));
		$this->mod_display($this->prot);
	}
    
    function getPageChildren($id=0) 
    {
      	$rrr = rows("SELECT * FROM `articles` WHERE `parent_id` = ".$id." ORDER BY `articles`.`sort` ASC");
        
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