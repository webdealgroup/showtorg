<?php
include_once('modules/aModule.class.php');

class get_template extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;


	function execute($arr)
	{    
        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();

        $menu_v = array(); 
        $menu = array();

        $menu_v = $this->getNode($arr['action']);
        $menu_v[0]['sub'] = $this->getNodes($arr['action']);
        foreach($menu_v[0]['sub'] as $key=>$value)
        { 
          $menu_v[0]['sub'][$key]['sub'] = $this->getNodes($menu_v[0]['sub'][$key]["id"]);
            foreach($menu_v[0]['sub'][$key]['sub'] as $k1=>$v1)
            { 
                $menu_v[0]['sub'][$key]['sub'][$k1]['sub'] = $this->getNodes($menu_v[0]['sub'][$key]['sub'][$k1]["id"]);
            }
        } 
        echo "<pre>"; print_r($menu_v); echo "</pre>"; //die();

        $_SESSION['smarty']->assign('menu', $menu_v);
		$this->mod_display($this->prot);
	}
    

        function getNode($id=0) 
        {
        	$result = rows("SELECT * FROM `modules` WHERE `id` = ".$id." ORDER BY `sort` ASC ");
            return $result;
        }   

        function getNodes($id=0) 
        {
        	//$query="SELECT id,title FROM `tree` WHERE `parent_id` = ? AND status <> 4 ORDER BY `sort` ASC ";
			$result=rows("SELECT modules.id,
                                   modules.title,
                                   templates.content,
                                   modules.tpl
                              FROM templates LEFT JOIN modules
                                      ON (templates.name = modules.tpl)
						    WHERE modules.`parent_id` = ".$id." AND modules.status <> 4 
        					ORDER BY modules.`sort` ASC
				   ");
            return $result;
        }

}

?>