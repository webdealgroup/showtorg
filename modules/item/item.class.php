<?php
include_once('modules/aModule.class.php');

class item extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die();
		$query="SELECT items.*
		FROM items 
		WHERE items.id = ".$arr['send_params']['id']." ";

        $res=rows($query);

		if ($arr['node']=="") {$arr['node']=$res[0]['node'];}
		if ($arr['node']=="") {$arr['node']=1;}
        
            $Page = new Page();
            $i = $arr['node'];
            $remark = array();
            $path = "";
            
    		$_SESSION['smarty']->assign('node',$Page->getNode($i));
            
            
            //$remark[] = array('title'=>$res[0]['name'], 'url'=>$res[0]['id']); 
            
            while ($i != 1)
            {
                $node = $Page->getNode($i);
                $path = $node[0]['id']."/".$path;
                $remark[] = array('title'=>$node[0]['title'], 'url'=>$node[0]['id']);
                $i = $node[0]['parent_id'];
            } 
            
            //$path = "/1/".$path;
            $path = $arr['node'];
            
    		$_SESSION['smarty']->assign('remark',array_reverse($remark));
    		$_SESSION['smarty']->assign('path',$path);

            $res[0]["dir"] = $path;
            
            $q="SELECT * FROM info WHERE id = ".$res[0]["id"]." ";
            $r=rows($q);
            
            $res[0]["param"] = $r[0]["description"];

		$query="SELECT * FROM currency WHERE id = 2 ";
		$r=rows($query);
        $_SESSION['smarty']->assign('showing',$r[0]['value']);
            
		$query="SELECT * FROM currency WHERE id = 1 ";
		$r=rows($query);
        $_SESSION['smarty']->assign('currency',$r[0]['value']);



            
            $dir = "/img/items/".$res[0][id];
            
            //if ($_POST['dir'] == "/1") $dir = "../img/";
            
            $images = array();
            $d = dir(getcwd().$dir);
            
           
            while($name = $d->read()){
                if(!preg_match('/\.(jpg|gif|png|JPG|GIF|PNG)$/', $name)) continue;
                //$size = filesize($dir.$name);
                //$lastmod = filemtime($dir.$name)*1000;
                $images[] = array('name'=>$name, //'size'=>$size, 
                        //'lastmod'=>$lastmod, 
                        'url'=>"items/".$res[0][id]."/".$name);
            }
            $d->close();
            sort($images);

            
            
            $res[0]["images"]  = $images; 
            
            //echo "<pre>"; print_r($res); echo "</pre>"; //die();


            $doll = $res[0][cost];
            $res[0]["doll"] = number_format($doll, 1, ',', ' ');  
            

            $credit = ($res[0]["cost"]* $r[0]['value'])/10;
            if ($res[0]["cost"] >300000 && $res[0]["cost"] < 5000000) $res[0]["credit"] = number_format($credit, 0, '', ' ');

            $res[0]["cost"] = number_format(round(($res[0]["cost"] * $r[0]['value']), 1), 2, ',', ' '); 
            $url = "docs/".$res[0]["id"].".pdf";
            if (file_exists($url)) {
                $res[0]["pdf"] = $url;
            }  
            
            $q="SELECT * FROM description WHERE id = ".$res[0]["id"]." ";
            $r=rows($q);
            
            
            //$res[$k]['param'] = substr($r[0]["description"], 0, strpos($r[0]["description"], '<br />')); 
            $res[0]["descr"] = $r[0]["description"];

		$_SESSION['smarty']->assign('items',$res);


        $list_nodes = $Page->getMenuNodes($arr['node']);

		$_SESSION['smarty']->assign('list_nodes',$list_nodes);
        
        
        $node = $Page->getNode($arr['node']);
        $_SESSION['smarty']->assign('page_title',$node[0]["title"]);
        


		$this->mod_display($this->prot);
	}

}

?>