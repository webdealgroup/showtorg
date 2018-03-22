<?php
<<<<<<< .mine

$time_start = microtime(true);
set_time_limit(0);
error_reporting(E_ALL);
ob_start();
if (isset($_REQUEST["PHPSESSID"])) {
    session_id($_REQUEST["PHPSESSID"]);
=======
// Переключаемся на UTF-8
header('Content-Type: text/html; charset=utf-8');
$time_start = microtime(true);
set_time_limit(0);
error_reporting(E_ALL);
ob_start();
if (isset($_REQUEST["PHPSESSID"])) {
    session_id($_REQUEST["PHPSESSID"]);
}
session_start();

$db_string = "mysql://remoteadmin:q1w2e3asda3@tl.by/allvision";
if (strpos($db_string, "mysql://") === false)
    die("Can emulate only on MYSQL!");
$db_string = str_replace("mysql://", "", $db_string);
$db_string = str_replace("/", "@", $db_string);
$parts = explode("@", $db_string);
define('DB_HOST', $parts[1]);
define('DB_NAME', $parts[2]);
$parts = explode(":", $parts[0]);
define('DB_USER', $parts[0]);
define('DB_PASS', (isset($parts[1])) ? $parts[1] : "");

include_once ('../site/libs/JSON.php');
//========================================================
$_SESSION['json'] = new Services_JSON();
require_once ('../site/libs/smarty/Smarty.class.php');
//========================================================
require_once ('../site/modules/aModule.class.php');$aModule = new aModule();$id = $aModule->id();
//========================================================
$page = !isset($_REQUEST["page"]) ? "1" : $_REQUEST["page"];
// из базы данных получить настройки для страницы
// в настройках могут быть переменные, которые нуждаются в подстановке
/*
$content = $aModule->row("SELECT `content`, `title`  FROM `engine` WHERE `name` = '".$page."'");
$_SESSION['smarty']->assign('title', $content['title']);
$prs = unserialize($content['content']);
if (count($prs) > 0) {    
    $out = array();
    foreach ($prs as $key=>$val) {
        $sp_arr['proc'] = $val['proc'];
        $sp_arr['p'] = $val['p'];
        $out[] = $sp_arr;
    }
    $res = $aModule->call_sp($out); // !! вызов хранимых процедур и получение массива данных по ним
    $i = 0;
    foreach ($prs as $key=>$val) {
        $_SESSION['smarty']->assign('items', $res[$i]);
        $_SESSION['smarty']->assign($key, $_SESSION['smarty']->fetch($val['tpl'].'.tpl'));
        $i++;
    }
<<<<<<< .mine
>>>>>>> .r29
<<<<<<< .mine
}
session_start();

$db_string = "mysql://remoteadmin:q1w2e3asda3@tl.by/allvision";
if (strpos($db_string, "mysql://") === false)
    die("Can emulate only on MYSQL!");
$db_string = str_replace("mysql://", "", $db_string);
$db_string = str_replace("/", "@", $db_string);
$parts = explode("@", $db_string);
define('DB_HOST', $parts[1]);
define('DB_NAME', $parts[2]);
$parts = explode(":", $parts[0]);
define('DB_USER', $parts[0]);
define('DB_PASS', (isset($parts[1])) ? $parts[1] : "");

include_once ('../site/libs/JSON.php');
=======
}=======
}
*/>>>>>>> .r32
>>>>>>> .r29
//========================================================
$_SESSION['json'] = new Services_JSON();
require_once ('../site/libs/smarty/Smarty.class.php');
//========================================================
require_once ('../modules/aModule.class.php');
$aModule = new aModule();
$id = $aModule->id();
//========================================================
$page = !isset($_REQUEST["page"]) ? "1" : $_REQUEST["page"];
// из базы данных получить настройки для страницы
// в настройках могут быть переменные, которые нуждаются в подстановке
/*
$content = $aModule->row("SELECT `content`, `title`  FROM `engine` WHERE `name` = '".$page."'");
$_SESSION['smarty']->assign('title', $content['title']);
$prs = unserialize($content['content']);
if (count($prs) > 0) {    
    $out = array();
    foreach ($prs as $key=>$val) {
        $sp_arr['proc'] = $val['proc'];
        $sp_arr['p'] = $val['p'];
        $out[] = $sp_arr;
    }
    $res = $aModule->call_sp($out); // !! вызов хранимых процедур и получение массива данных по ним
    $i = 0;
    foreach ($prs as $key=>$val) {
        $_SESSION['smarty']->assign('items', $res[$i]);
        $_SESSION['smarty']->assign($key, $_SESSION['smarty']->fetch($val['tpl'].'.tpl'));
        $i++;
    }
}
*///========================================================
$shortcuts = array();
$shortcuts[] = array(
	'id' => 'tree',
	'img' => 'images/grid48x48.png',
	'text' => 'Структура<br>сайта'
);

$shortcuts[] = array(
	'id' => 'modules',
	'img' => 'images/grid48x48.png',
	'text' => 'Modules'
);

$_SESSION['smarty']->assign('shortcuts', $shortcuts);

//========================================================
$tpl = null;
//========================================================
if (isset($_REQUEST["m"]) && strlen($_REQUEST["m"]) > 0) 
{
    // вызов модуля если запрос идет через ajax
    echo $smarty->fetch('str:'.$_REQUEST["m"]);
    exit(0);
} 
else 
{
    $tpl = $aModule->row("SELECT `tpl` FROM `engine` WHERE `name` like '".$page."'");
    
	if(strlen($tpl) > 0) 
	{
        // Переключаемся на UTF-8
        header('Content-Type: text/html; charset=utf-8');
        print($_SESSION['smarty']->fetch($tpl['tpl']));
        
    } else {
        echo "Page not found";
    }
}

exit(0);
?>