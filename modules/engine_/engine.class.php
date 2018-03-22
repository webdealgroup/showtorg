<?php
include_once('modules/aModule.class.php');

class engine extends aModule
{

	function execute($arr)
	{
//		echo "<pre>";print_r($arr);echo "<pre>";die();
//    	$result=row("SELECT `content` FROM `pages` WHERE `id` = ".$arr['send_params']['id']);
//      $_SESSION['smarty']->assign('content' , $result['content']);

        $mods[0]['folder'] = 'engine';
        $mods[0]['dir'] = 'engine';
        $mods[0]['items'] = $this->names('engine');
        $mods[0]['folders'] = $this->folders('engine');
        
        //echo "<pre>"; print_r($mods); echo "</pre>"; //die();    
        $_SESSION['smarty']->assign('mods' , $mods);


		$this->mod_display($this->prot);
    }
    
    function names($folder)
    {
        $dir = "modules/".$folder;
        $items = array();
        $d = dir($dir);
        while($name = $d->read()){
            if(!preg_match('/\.(js|JS)$/', $name)) continue;
            $items[] = $folder."/".$name;
        }
        $d->close();
        //echo "<pre>"; print_r($items); echo "</pre>"; //die();
        return $items;    
    }
    
    function folders($folder)
    {
        $items = array();
        foreach (glob('modules/'.$folder.'/*') as $m)
            if (is_dir($m)) $items[] = array(
                'folder' => basename($m), 
                'dir' => $folder."/".basename($m),
                'items' => $this->names($folder."/".basename($m)),
                'folders' => $this->folders($folder."/".basename($m))
                );
            
        //echo "<pre>"; print_r($items); echo "</pre>"; //die();
        return $items;    
    }
}

?>