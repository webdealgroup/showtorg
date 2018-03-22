<?php


if (isset($_POST['task'])):

function updateSort($order) {
	$order = str_replace(array('[',']','"'), '', $order);
	$order = explode(',', $order);
	$i = 0;
	foreach ($order as $id) {
		update('tree', array('id' => $id), array('sort' => $i));
		$i++;
	}
}


switch ($_POST['task']):

case "editURL":
	$id = !empty($_POST['node_id']) ? intval($_POST['node_id']) : 0;
	$parent_id = !empty($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
	$name = $_POST['name'];
	if ($id AND $parent_id) {
		$row = row("SELECT COUNT(*) as count FROM tree WHERE name='".mysql_escape_string($name)."' AND parent_id='".$parent_id."'");
		if ($row['count']) {
			echo json(array('message' => 'Страница с таким URL уже есть в этом каталоге!'));
		} else {
			update('tree', array('id' => $id), array('name' => $name));
			echo json(array('success' => 1, 'message' => '', 'name' => $name));
		}
	}
	out();
break;


case "editTitle":
	$id = !empty($_POST['node_id']) ? intval($_POST['node_id']) : 0;
	$parent_id = !empty($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
	$name = $_POST['name'];
	if ($id AND $parent_id) {
		$row = row("SELECT COUNT(*) as count FROM tree WHERE title='".mysql_escape_string($name)."' AND parent_id='".$parent_id."'");
		if ($row['count']) {
			echo json(array('message' => 'Страница с таким URL уже есть в этом каталоге!'));
		} else {
			update('tree', array('id' => $id), array('title' => $name));
			echo json(array('success' => 1, 'message' => '', 'text' => $name));
		}
	}
	out();
break;
 
case "editNode":
	$node_id = intval($_POST['node_id']);
	$parent_id = intval($_POST['parent_id']);
	update('tree', array('id' => $node_id), array(
		'name' => $node_id,
		'parent_id' => $parent_id
	));
	updateSort($_POST['order']);
	echo json(array('success' => 1, 'message' => ''));
	out();
break;

case "saveOrder":
	$node_id = intval($_POST['node_id']);
	$parent_id = intval($_POST['parent_id']);
	update('tree', array('id' => $node_id), array('parent_id' => $parent_id));
	updateSort($_POST['order']);

//	Если в родительском каталоге появилось более одной страницы с одинаковым name, переименовываем перемещённую страницу и выводим сообщение
	$row = row("SELECT name FROM tree WHERE id='".$node_id."'");
	$check = row("SELECT COUNT(*) as count FROM tree WHERE name='".esc($row['name'])."'");
	if ($check['count'] > 1) {
		$newname = time();
		update('tree', array('id' => $node_id), array('name' => $newname));
		echo json(array('message' => 'Страница с таким URL уже существует в этой папке! Присвоен новый URL.', 'name' => $newname));
		out();
	}

	echo json(array('success' => 1, 'message' => ''));
	out();
break;

case "getNode":
	$node = isset($_POST['node']) ? intval($_POST['node']) : 0;
	$nodes = rows("SELECT id, name, title as text, parent_id, tpl, status FROM tree WHERE parent_id='".$node."' ORDER BY sort ASC");
    
    
	foreach ($nodes as $k=>$v) {
		list($children) = row("SELECT COUNT(*) as count FROM tree WHERE parent_id='".$v['id']."'", 'array');
	//	$nodes[$k]['leaf'] = $children ? false : true;
		$nodes[$k]['expanded'] = $children ? false : true;
	}
    
    //echo "<pre>"; print_r($nodes); echo "</pre>"; //die();
    //echo json($nodes);
	echo json_encode($nodes);
	out();
break;



if ($_POST['task'] == 'getData') {
	$limit = ' LIMIT '.(!empty($_POST['start']) ? intval($_POST['start']) : 0).','.(!empty($_POST['limit']) ? intval($_POST['limit']) : 10);
	$sorting = (!empty($_POST['dir']) AND in_array(strtoupper($_POST['dir']), array('ASC','DESC'))) ? $_POST['dir'] : ' ASC ';
	$orderby = !empty($_POST['sort']) ? $_POST['sort'] : $_POST['key'];
    if (isset($_POST['node']) && strlen($_POST['node'])>0 )
    {
        $where = ' WHERE items.node='.$_POST['node'].' ';
    }
    $data = rows("SELECT * FROM items ".$where." ORDER BY ".$orderby.' '.$sorting.' '.$limit);
  
		foreach ($data as $k => $v)
		{
			$r= rows("SELECT * FROM description WHERE id = ".$data[$k]["id"]." ");
			$data[$k]["param"] = $r[0]["description"];
		}
 
	list($counter) = row("SELECT COUNT(*) as count FROM ".$_POST['table']."",'array');
	$data = json_table($data,$counter);
	echo $data;
	exit;
}


endswitch;
endif;

?>