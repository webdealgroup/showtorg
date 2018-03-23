<?php

error_reporting(0);

header('HTTP/1.0 200 OK');
header('HTTP/1.1 200 OK');

// MYSQL ============================================================================================
// DB SETTINGS (begin)
define('DBHOST', '85.143.172.67');
define('DBNAME', 'showtorg');
define('DBUSER', 'showtorg');
define('DBPASS', 'R?vU%#');
define('PREFIX', 'site');
define('PCONNECT', 0);
if (!defined('FORCE1251')) define('FORCE1251', 0);
// DB SETTINGS (end)

$GLOBALS['dbid'] = false;

function dbconnect() {
	$F = PCONNECT ? 'mysql_pconnect' : 'mysql_connect';
	if (!$GLOBALS['dbid']) $GLOBALS['dbid'] = $F(DBHOST, DBUSER, DBPASS);
	if (!$GLOBALS['dbid'] OR !mysql_select_db(DBNAME, $GLOBALS['dbid'])) {
		if (DEBUGMODE) dberror(mysql_error(), mysql_errno());
		exit;
	}
	if (FORCE1251) {
		q("/* !40101 SET NAMES 'cp1251' */");
		q("SET character_set_client='cp1251'");
		q("SET character_set_results='cp1251'");
		q("SET collation_connection='cp1251_general_ci'");
	}
}

function dbnum($show=false) {
	static $qnum=0;
	if (false !== $show) return $qnum;
	$qnum++;
}

function q($query) {
	if (!$GLOBALS['dbid']) dbconnect();
	if (!$result = mysql_query($query, $GLOBALS['dbid']))
		$result = false;
	dbnum();
	return $result;
}

function numrows($q) {
	return mysql_num_rows($q);
}

function fetch($q) {
	return mysql_fetch_assoc($q);
}

function row($query,$mode='assoc') {
	$row = array();
	if ($q = q($query)) {
		$F = 'mysql_fetch_'.$mode;
		$row = $F($q);
		mysql_free_result($q);
	}
	return $row;
}

function rows2($query, $setkey=false, $group=false, $subkeys=false) {
	$rows = array();

	echo $query;
	
	$q = q($query);
	echo $q;

	echo mysql_fetch_assoc($q);

		while ($row = mysql_fetch_assoc($q))
				$rows[] = $row;

	return $rows;
}

function rows($query, $setkey=false, $group=false, $subkeys=false) {
	$rows = array();
	if ($q = q($query)) {
		if (false !== $setkey) {
			if (false !== $group) {
				if (false !== $subkeys)
					while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]][$row[$subkeys]] = $row;
				else
					while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]][] = $row;
			} else
				while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]] = $row;
		} else
			while ($row = mysql_fetch_assoc($q))
				$rows[] = $row;
		mysql_free_result($q);
	}
	return $rows;
}

function select($table,$what='*',$where='',$limit='') {
	$q = 'SELECT '.$what.' FROM `'.$table.'`'.($where ? ' WHERE '.$where : '');
	return row($q);
}

function selects($table,$what='*',$where='',$limit='') {
	$q = 'SELECT '.$what.' FROM `'.$table.'`'.($where ? ' WHERE '.$where : '');
	return rows($q);
}

function sel($input,$one=false) {
	$q = array('SELECT');
	$q[] = !empty($input['what']) ? $input['what'] : '*';
	if (is_array($input['from'])) {
		$from = array();
		foreach ($input['from'] as $v)
			$from[] = $v.' as '.$v[0];
		$q[] = 'FROM '.implode(', ', $from);
	} else {
		$q[] = 'FROM '.$input['from'];
	}
	if (!empty($input['where'])) {
		if (is_array($input['where'])) {
			$z = array();
			foreach ($input['where'] as $k=>$v)
				$z[] = mysql_escape_string(stripslashes($k))."='".mysql_escape_string(stripslashes($v))."'";
			$q[] = 'WHERE '.implode(' AND ',$z);
		} else {
			$q[] = 'WHERE '.$input['where'];
		}
	}
	if (!empty($input['order'])) $q[] = 'ORDER BY '.$input['order'];
	if (!empty($input['limit'])) $q[] = 'LIMIT '.$input['limit'];
	$F = $one ? 'row' : 'rows';
	if (is_array($input['from'])) die(implode(' ',$q));
	return $F(implode(' ',$q));
}

function insert($table, $values) {
	foreach ($values as $k=>$v)
		$values[$k] = mysql_escape_string(stripslashes(trim($values[$k])));
    q("INSERT INTO `".mysql_escape_string(stripslashes($table))."` (`".implode('`,`',array_keys($values))."`) VALUES ('".implode("','",$values)."')");
    return insert_id();
}

function update($table, $where, $values) {
	$q = "UPDATE `".mysql_escape_string(stripslashes($table))."` SET ";
	$z = array();
	foreach ($values as $k=>$v)
		$z[] = mysql_escape_string(stripslashes($k))."='".mysql_escape_string(stripslashes(trim($v)))."'";
	$q .= implode(', ',$z);
	$q .= ' WHERE ';
	$z = array();
	foreach ($where as $k=>$v)
		$z[] = mysql_escape_string(stripslashes($k))."='".mysql_escape_string(stripslashes($v))."'";
	$q .= implode(' AND ',$z);
	return q($q);
}

function sql_delete($table, $where) {
	$q = "DELETE FROM `".mysql_escape_string($table)."` WHERE ";
	$z = array();
	foreach ($where as $k=>$v)
		$z[] = mysql_escape_string(stripslashes($k))."='".mysql_escape_string(stripslashes($v))."'";
	$q .= implode(' AND ',$z);
	return q($q) ? true : false;
}

function insert_id() {
	return mysql_insert_id($GLOBALS['dbid']);
}

function freeresult($q) {
	if ($q) mysql_free_result($q);
}

function get_result_fields($result) {
	$fields = array();
	while ($field = mysql_fetch_field($result))
		$fields[] = $field;
	return $fields;
}

function fields($table) {
	$names = array();
	$fields = mysql_list_fields(DBNAME, $table, $GLOBALS['dbid']);
	$columns = mysql_num_fields($fields);
	for ($i = 0; $i < $columns; $i++)
	    $names[] = mysql_field_name($fields, $i);
	mysql_free_result($fields);
	return $names;
}

function dbclose() {
	if ($GLOBALS['dbid']) mysql_close($GLOBALS['dbid']);
}

function dberror($error, $error_num, $query = '') {
	$query = preg_replace('#([0-9a-f]){32}#', '********************************', $query);
	include 'templates/messages/db_error.html';
	exit;
}

function esc($str) {
	return mysql_escape_string($str);
}

function i($str) {
	return intval($str);
}
//ФУНКЦИИ ===================================================================================================

// Управление кэшированием
function cache_drive($filename) {
	$lastModified = filemtime($filename);
	header('Last-Modified: '.gmdate('r', $lastModified).' GMT');
	$request = getallheaders();
	if (isset($request['If-Modified-Since'])) {
		$modifiedSince = explode(';', $request['If-Modified-Since']);	// fix for Netscape
		$modifiedSince = strtotime($modifiedSince[0]);
	} else {
		$modifiedSince = 0;
	}
	if ($lastModified <= $modifiedSince) {
		header('HTTP/1.1 304 Not Modified');
		exit;
	}
}

// Возвращает текст в UTF-8
function utf($str) {
	return iconv('windows-1251', 'UTF-8', $str);
}

function win1251($str) {
	return iconv('UTF-8', 'windows-1251', $str);
}
/*
function json_encode($data,$single=false) {

	if ($single) return json($data);

	static $json = false;
	if (!$json) {
		require_once('JSON.php'); //if php<5.2 need JSON class
		$json = new Services_JSON();//instantiate new json object
	}
	return $json->encode($data);

}
*/
// Перевод массива в JSON
function json($out) {
	$params = array();
	$text = "{ ";
	foreach ($out as $k=>$v)
		$params[] = "{$k}: \"".str_replace('"','\"',$v)."\"";
	$text .= implode(", ",$params)." }";
	return $text;
}

function json_objects($data) {
	$rows = array();
	foreach ($data as $k=>$v) {
		$values = array();
		foreach ($data[$k] as $key=>$value) {
			$values[] = $key.':'. (
				is_bool($value)
					? $value 
						? 'true' : 'false' 
					: (is_numeric($value) OR substr($value,0,4) == 'new ') 
						? $value : "'".$value."'"
			);
		}
		$rows[] = '{ '. implode(', ', $values) .' }';
	}
	$rows = implode(','."\n\t\t\t", $rows)."\n";
	return $rows;
}

// Функция перевода массива в JSON для grid-окон
function json_table($data,$total=0) {

$num = $total ? $total : sizeof($data);
$keys = array_keys($data[0]);
$unique = $keys[0];

$fields = array();
foreach ($keys as $k)
	$fields[] = "{name: '{$k}'}";
$fields = implode(', ', $fields);

$rows = json_objects($data);

return <<<JSON
{
	'metaData': {
		totalProperty: 'results',
		root: 'rows',
		id: '{$unique}',
		fields: [ {$fields} ]
	},
	'results': {$num},
	'rows': [ {$rows} ]
}
JSON;

}

function out() {
	ob_end_flush();
	exit;
}

class Tree {

	var $params = array();
	var $cats = array();
	var $names = array();
	var $tree = array();
	var $path = array();
	var $page = array();
	var $parent = array();
	var $found = true;
	var $root = '/';
	var $main = 1;
	var $home = false;

	function __construct() {
		$this->Tree();
	}

	function Tree() {

		foreach (rows("SELECT id,name,title,parent_id,status FROM tree ORDER BY sort ASC") as $row) {
			$this->cats[$row['id']] = $row;
			@$this->tree[$row['parent_id']][$row['name']] = $row['id'];
		}

		$this->path[] = $this->main = $parent_id = reset($this->tree[0]);
		foreach (explode('/', reset(explode('?', $_SERVER['REQUEST_URI']))) as $t) {

			$t = trim(urldecode($t));
			if ('' === $t) continue;
            
			if (substr_compare($t,'?',1,1)>=0) 
            {
                $t = str_replace("?", "", $t);
                parse_str($t, $this->params);

                continue;
            }

			if (isset($this->tree[$parent_id][$t]) AND $this->cats[$this->tree[$parent_id][$t]]['status'] != 4) {
				$this->path[] = $parent_id = $this->tree[$parent_id][$t];
			} else {
				$this->found = false;
				return;
			}

		}

		$this->page = array_pop($this->path);
		$this->parent = array_pop($this->path);

		if ($this->parent) {

			$this->page = row("SELECT * FROM tree WHERE id='".i($this->page)."'");
			$this->parent = $this->cats[$this->page['parent_id']];

		} else {

			$this->page = row("SELECT * FROM tree WHERE id='".i($this->main)."'");
			$this->parent = array('id' => 0);
			$this->home = true;

		}

		if (!$this->page OR in_array($this->page['status'],array(3,4)) OR !$this->parent)
			$this->found = false;

	}

	function getPath($id) {
		if (isset($this->cats[$id]) AND $this->cats[$id]['parent_id'] > 0)
			$cat = $this->cats[$id];
		else return $this->root;
		$out = array();
		while ($cat['parent_id'] > 0) {
			$out[] = $cat['name'];
			$cat = $this->cats[$cat['parent_id']];
		}
		$out = array_reverse($out);
		return $this->root.implode('/',$out).'/';
	}

	function &getNode($id=0) {
		return $this->cats[$id];
	}

	function &getChildrenID($id) {
		return $this->tree[$id];
	}

	function getChildren($id=0) {

		if (!$id) $id = $this->main;

		$out = array();
		if (!empty($this->tree[$id]))
		foreach ($this->tree[$id] as $v) {
			$in = $this->cats[$v];
			if ($in['status'] != 1) continue;
			$in['path'] = $this->getPath($in['id']);
			$out[] = $in;
		}

		return $out;

	}

}


//===================================================================================================

// Переключаемся на UTF-8
header('Content-Type: text/html; charset=utf-8');
ob_start('ob_gzhandler');
q("SET NAMES 'utf8'");

if (isset($_POST['task'])):

switch ($_POST['task']):


case "setStatus":
		
	q("UPDATE tree SET status = 4");		
	
	$data = rows("SELECT tree.id, MAX(items.hide) AS hide 
				 FROM items items RIGHT JOIN tree tree
    				ON (items.node = tree.id) 
				 WHERE hide = 1 AND tree.id NOT IN (SELECT parent_id FROM tree)
    			 GROUP BY tree.id");
				  
	foreach($data as $k=>$v)
	{
       $i = $data[$k]['id'];
       do 
       {   
	   	   update("tree", array('id' => $i), array('status' => '2'));
	   	   $d = row("SELECT parent_id FROM tree WHERE id = ".$i."");
           $i = $d['parent_id'];
       } while ($i != 1);
	}
				  
	echo json(array('success' => 1, 'message' => 'Статусы категорий обновлены'));
	out();

break;

case "setGoodsStatus":
		
	q("UPDATE items SET hide = 0 WHERE cost = 0 AND qty = 0 ");		
				  
	echo json(array('success' => 1, 'message' => 'Статусы категорий обновлены'));
	out();

break;


case "delete":
	function DeleteSubcategories($parentid) {
		$parentid = intval($parentid);
		if ($parentid) {
			$rows = rows("SELECT ".$_POST['key']." FROM ".$_POST['table']." WHERE parent_id='".$parentid."'");
			foreach ($rows as $row) {
				DeleteSubcategories($row[$_POST['key']]);
				sql_delete($_POST['table'], array($_POST['key'] => intval($row['id'])));
			}
		}
	}
	$rows = str_replace(array('[',']','"'), '', $_POST['rows']);
	$rows = explode(',', $rows);
	$i = 0;
	foreach ($rows as $r) {
		$r = intval($r);
		if (sql_delete($_POST['table'], array($_POST['key'] => $r))) {
			$i++;
			if (isset($_POST['recursive']))
				DeleteSubcategories($r);
		}
	}
	echo json(array('success' => 1, 'del_count' => $i, 'message' => 'Записи удалены.'));
	out();
break;

case "subdelete":
	function DeleteSubcategories($parentid) {
		$parentid = intval($parentid);
		if ($parentid) {
			$rows = rows("SELECT ".$_POST['key']." FROM ".$_POST['table']." WHERE parent_id='".$parentid."'");
			foreach ($rows as $row) {
				DeleteSubcategories($row[$_POST['key']]);
				sql_delete($_POST['table'], array($_POST['key'] => intval($row['id'])));
			}
		}
	}
	$rows = str_replace(array('[',']','"'), '', $_POST['rows']);
	$rows = explode(',', $rows);
	$i = 0;
	foreach ($rows as $r) {
		$r = intval($r);
		DeleteSubcategories($r);
	}
	echo json(array('success' => 1, 'del_count' => $i, 'message' => 'Записи удалены.'));
	out();
break;


case "update":
	$row = row("SELECT * FROM ".$_POST['table']." WHERE ".$_POST['key']."='".@intval($_POST['keyID'])."'");
	if (!$row) {
    
        if (isset($_POST['field_node']) && strlen($_POST['value_node'])>0)    
        {
            $newid = insert($_POST['table'], array($_POST['field'] => $_POST['value'], $_POST['field_node'] => $_POST['value_node']));
        }
        else
        {
		    $newid = insert($_POST['table'], array($_POST['field'] => $_POST['value']));
        }
        
	} else {
        
		$newid = 0;

		if (isset($_POST['check_unique']) AND $_POST['check_unique']) {
			$row = row("SELECT COUNT(*) as count FROM ".$_POST['table']." WHERE ".$_POST['field']."='".mysql_escape_string($_POST['value'])."'");
			if ($row['count']) {
				echo json(array(
					'failure' => 1,
					'newID' => $newid,
					'message' => 'Страница с таким URL уже существует!',
					$_POST['field'] => $_POST['value']
				));
				exit;
			}
		}

		update($_POST['table'], array($_POST['key'] => $_POST['keyID']), array($_POST['field'] => $_POST['value']));
        
        
        /*if (isset($_POST['field_node']) && strlen($_POST['value_node'])>0)    
        {
            $newid = insert($_POST['table'], array($_POST['field'] => $_POST['value'], $_POST['field_node'] => $_POST['value_node']));
        }
        else
        {
		    update($_POST['table'], array($_POST['key'] => $_POST['keyID']), array($_POST['field'] => $_POST['value']));
        }*/

	}
    
        if (isset($_POST['field_node']) && strlen($_POST['value_node'])>0)    
        {
		    echo json(array('success' => 1, 'newID' => $newid, 'message' => "", $_POST['field'] => $_POST['value'], 'newNode' => $_POST['value_node']));
        }
        else
        {
		    echo json(array('success' => 1, 'newID' => $newid, 'message' => "", $_POST['field'] => $_POST['value']));
        }    

	out();
break;

endswitch;
endif;


if (isset($_GET['page'])) {
	$page = $_GET['page'];
	$action = isset($_GET['action']) ? $_GET['action'] : 'index';
	$f = 'modules/'.$page.'/'.$action.'.php';
	file_exists($f) ? require $f : print(json(array('failure' => 1, 'message' => 'Sorry! File not found.')));
	out();
}
 

// Ярлыки на рабочем столе  ===============================================
$shortcuts = array();
$shortcuts[] = array(
	'id' => 'pages',
	'img' => 'images/grid48x48.png',
	'text' => 'Страницы'
);

$shortcuts[] = array(
	'id' => 'tree',
	'img' => 'images/grid48x48.png',
	'text' => 'Рубрикатор'
);


$shortcuts[] = array(
	'id' => 'galleries',
	'img' => 'images/grid48x48.png',
	'text' => 'Фотогалереи'
);

$shortcuts[] = array(
	'id' => 'modules',
	'img' => 'images/grid48x48.png',
	'text' => 'Шаблоны'
);

$shortcuts[] = array(
	'id' => 'templates',
	'img' => 'images/grid48x48.png',
	'text' => 'Модули'
);

$shortcuts[] = array(
	'id' => 'articles',
	'img' => 'images/grid48x48.png',
	'text' => 'Статьи'
);


/**/
//==========================================================================
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Административная зона</title>
<link rel="stylesheet" type="text/css" href="js/ext/resources/css/ext-all.css">
<script type="text/javascript" src="js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="js/ext/ext-all.js"></script>
<script type="text/javascript" src="js/StartMenu.js"></script>
<script type="text/javascript" src="js/TaskBar.js"></script>
<script type="text/javascript" src="js/Desktop.js"></script>
<script type="text/javascript" src="js/App.js"></script>
<script type="text/javascript" src="js/Module.js"></script>

<script type="text/javascript" src="data-view-plugins.js"></script>
<script type="text/javascript" src="js/boxover.js"></script>

<script type="text/javascript" src="../?mod_name=engine"></script>
<!--script type="text/javascript" src="engine.js"></script-->

<link rel="stylesheet" type="text/css" href="data-view.css" />
<link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body scroll="no">

<div id="x-desktop">
	<dl id="x-shortcuts">
		<?foreach($shortcuts as $s):?>

			<dt class="shortcut" id="<?=$s['id']?>-win-shortcut">
				<a href="#"><img src="images/s.gif" style="background-image: url(<?=$s['img']?>); filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<?=$s['img']?>', sizingMethod='scale');">
				<div><?=$s['text']?></div></a>
			</dt>

		<?endforeach?>
	</dl>
</div>

<div id="ux-taskbar">
	<div id="ux-taskbar-start"></div>
	<div id="ux-taskbuttons-panel"></div>
	<div class="x-clear"></div>
</div>


<div id="ajax_loader" style="display:none;z-index:10000;border: 1px dotted black;background: #ffffff;"><a href="javascript:aj_load('hide','',0,0);" style="position:relative;background:#ffffff;float:right;margin-right:5px;"><img src="../god/images/shared/icons/fam/cross.gif" />Close</a><a href="javascript:aj_load('hide','',0,0);" id="img_viewer"><img src="img/ajax-loader.gif"/></a></div>

</body>
</html>
