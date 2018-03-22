<?php

// Создание меню

include_once('modules/aModule.class.php');
 
class menu_v extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        $menu_v = $this->getNodeChildren(1);
        
        //echo "<pre>"; print_r($menu_v);echo "</pre>"; die();
        
        
        $_SESSION['smarty']->assign('menu_v',$this->getNodeChildren(1));
        $_SESSION['smarty']->assign('page', $arr['send_params']['page']);

		$this->mod_display($this->prot);
	}
    
    function getNodeChildren($id=0) 
    {
		
      	$result = rows("SELECT * FROM `tree` WHERE `parent_id` = ".$id."  ORDER BY `sort` ASC ");
		foreach($result as $k => $v)
        {
            $result[$k]['submenu'] = rows("SELECT * FROM `tree` WHERE `parent_id` = ".$v['id']." ORDER BY `sort` ASC ");
            foreach($result[$k]['submenu'] as $k2 => $v2)
            {
                $result[$k]['submenu'][$k2]['submenu'] = rows("SELECT * FROM `tree` WHERE `parent_id` = ".$v2['id']." ORDER BY `sort` ASC ");
            }
        }

        return $result;
    }   
}

?>