<?php
include_once('modules/aModule.class.php');

class new_products extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		echo "<pre>";print_r($arr);echo "<pre>";die();
		$query="SELECT * FROM currency WHERE id = 1 ";
		$res=rows($query);
        $_SESSION['smarty']->assign('currency',$res[0]['value']);
        $currency = $res[0]['value'];
        
		$query="SELECT * FROM items WHERE hide <> 0 AND young = 1 AND image NOT LIKE '' GROUP BY items.id ORDER BY RAND() ";
		$query.=" LIMIT 0, 4";
		$res=rows($query);

        $Page = new Page();  
		foreach ($res as $k => $v)
		{
            $i = $res[$k]["node"];
            $path = "";
            while ($i != 1)
            {
                $node = $Page->getNode($i);
                $path = $node[0]['id']."/".$path;
                $i = $node[0]['parent_id'];
            } 
            //$path = "1/".$path;  
            $path = $res[$k]["node"];  
            
            $res[$k]["dir"] = $path;
            
            $credit = ($res[$k][cost]* $currency)/10;
            if ($res[$k]["cost"] >300000 && $res[$k]["cost"] < 5000000) $res[$k]["credit"] = number_format($credit, 0, '', ' ');
            
            $res[$k]["cost"] = number_format($res[$k][cost] * $currency, 0, '', ' ');  

           
    	}
		$_SESSION['smarty']->assign('items',$res);
		$this->mod_display($this->prot);
	}
}

?>