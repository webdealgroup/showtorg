<?php
include_once('modules/aModule.class.php');

class rand_product extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die();
		$query="SELECT * FROM currency WHERE id = 1 ";
		$res=rows($query);
        $_SESSION['smarty']->assign('currency',$res[0]['value']);
        $currency = $res[0]['value'];

        //echo "<pre >";print_r($currency);echo "<pre>"; die(); 


		$query="SELECT * FROM currency WHERE id = 2 ";
		$res=rows($query);
        $_SESSION['smarty']->assign('showing',$res[0]['value']);


		$query="SELECT * FROM items WHERE  active = 1  ";
		$result=rows($query);
        $num_items = count($result);
        $_SESSION['smarty']->assign('num_items', $num_items);

        
        
		//$query="SELECT * FROM items WHERE hide <> 0 AND image NOT LIKE '' AND (qty > 0 AND qty IS NOT NULL) GROUP BY items.id ORDER BY RAND() ";
        $query="SELECT * FROM items WHERE  active = 1  ORDER BY RAND() ";
        
        $query.=" LIMIT 0, 30";


		$res=rows($query);



        $Page = new Page();  
		foreach ($res as $k => $v)
		{
            $i = $res[$k]["node"];
            $path = "";
            while ($i != 0)
            {
                $node = $Page->getNode($i);
                $path = $node[0]['id']."/".$path;
                $i = $node[0]['parent_id'];
            } 
            //$path = "1/".$path;  
            $path = $res[$k]["node"];  
            

            $res[$k]["dir"] = $path;
            
            
            //$doll = $res[$k][cost];
            //$res[$k]["doll"] = number_format($doll, 3, ',', ' ');  
            
            

            
            $res[$k]["cost"] = number_format(round(($res[$k][cost]), 1), 0, ',', ' '); //round(($res[$k][cost] * $currency), 2);  
            
            $q="SELECT * FROM description WHERE id = ".$res[$k]["id"]." ";
            $r=rows($q);
            
            
            //$res[$k]['param'] = substr($r[0]["description"], 0, strpos($r[0]["description"], '<br />')); 
            $res[$k]["param"] = $r[0]["description"];
            
 
//echo "<pre>"; print_r($res); echo "</pre>"; die();

           
    	}
		$_SESSION['smarty']->assign('items',$res);
		$this->mod_display($this->prot);
	}
}

?>