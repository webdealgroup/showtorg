<?php
	echo "Отключено за неоплату хостинга. Сайт будет удален 19.04.2018 9:00."; die();
	error_reporting(0);
	session_start();

    require_once('mysql.php');

    define("TPL_PATH", "modules");
    require_once('lib/smarty/Smarty.class.php');

	$post 	= ($_SERVER["REQUEST_METHOD"] == "POST")? $_POST	: $_GET;

	$post["page"] = !isset($post["page"]) ? "index" : $post["page"];
	$post["action"] = !isset($post["action"]) ? "" : $post["action"];
	$post["lng"] = !isset($post["lng"]) ? "home" : $post["lng"];
	$post["page_id"] = !isset($post["page_id"]) ? "0" : $post["page_id"];

	$post["item"] = !isset($post["item"]) ? "" : $post["item"];

		$query="SELECT * FROM currency WHERE id = 1 ";
		$res=rows($query);
        $smarty->assign('currency',$res[0]['value']);
   
		$query="SELECT * FROM currency WHERE id = 2 ";
		$res=rows($query);
        $_SESSION['smarty']->assign('showing',$res[0]['value']);
        
        
        
    if(($post["mod_name"]=='item') && strlen($post["id"])>0)
    {
            $smarty->assign('item_page',row("SELECT name FROM `items` WHERE id = ".$post['id']));
    }
    
    if(isset($post["mod_name"]) && strlen($post["mod_name"])>0)
    {
        if(isset($_GET["path"]) && strlen($_GET["path"])>0)
            $smarty->assign('path',$_GET["path"]);

        if(isset($_POST["action"]) && strlen($_POST["action"])>0)
            $smarty->assign('action',$_POST["action"]);
    
        echo $smarty->fetch($post["mod_name"].".tpl");
        exit;
    }


    $smarty->assign('current_page',$post["page"]);
	$smarty->assign('action',$post["action"]);
	$smarty->assign('lng',$post["lng"]);



    
    $tmp = $smarty->fetch("db:".$post["page"]);
    
    $_SESSION['smarty'] = $smarty = new Smarty;
    $smarty->assign("content", $tmp);

    $result = row("SELECT * FROM `tree` WHERE `name` like '".$post['page']."'");
    $smarty->assign('this_page',$result);
   
   

   
	if ($result)
	{
		$tpl=$result['tpl'];
		print $smarty->fetch($tpl);
	}

?>