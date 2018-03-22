<?php

if (isset($_POST['task'])):

function updateSort($order) {
	$order = str_replace(array('[',']','"'), '', $order);
	$order = explode(',', $order);
	$i = 0;
	foreach ($order as $id) {
		update('modules', array('id' => $id), array('sort' => $i));
		$i++;
	}
}


switch ($_POST['task']):

case "editURL":
	$id = !empty($_POST['node_id']) ? intval($_POST['node_id']) : 0;
	$parent_id = !empty($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
	$name = $_POST['name'];
	if ($id AND $parent_id) {
		$row = row("SELECT COUNT(*) as count FROM modules WHERE name='".mysql_escape_string($name)."' AND parent_id='".$parent_id."'");
		if ($row['count']) {
			echo json(array('message' => 'Страница с таким URL уже есть в этом каталоге!'));
		} else {
			update('modules', array('id' => $id), array('name' => $name));
			echo json(array('success' => 1, 'message' => 'Изменения сохранены.', 'name' => $name));
		}
	}
	out();
break;

case "editNode":
	$node_id = intval($_POST['node_id']);
	$parent_id = intval($_POST['parent_id']);
	update('modules', array('id' => $node_id), array(
		'name' => $node_id,
		'parent_id' => $parent_id
	));
	updateSort($_POST['order']);
	echo json(array('success' => 1, 'message' => 'Изменения сохранены.'));
	out();
break;

case "saveOrder":
	$node_id = intval($_POST['node_id']);
	$parent_id = intval($_POST['parent_id']);
	update('modules', array('id' => $node_id), array('parent_id' => $parent_id));
	updateSort($_POST['order']);

//	Если в родительском каталоге появилось более одной страницы с одинаковым name, переименовываем перемещённую страницу и выводим сообщение
	$row = row("SELECT name FROM modules WHERE id='".$node_id."'");
	$check = row("SELECT COUNT(*) as count FROM modules WHERE name='".esc($row['name'])."'");
	if ($check['count'] > 1) {
		$newname = time();
		update('modules', array('id' => $node_id), array('name' => $newname));
		echo json(array('message' => 'Страница с таким URL уже существует в этой папке! Присвоен новый URL.', 'name' => $newname));
		out();
	}

	echo json(array('success' => 1, 'message' => 'Изменения сохранены.'));
	out();
break;

case "getNode":
	$node = isset($_POST['node']) ? intval($_POST['node']) : 0;
	$nodes = rows("SELECT id, name, title as text, parent_id, tpl, status FROM modules WHERE parent_id='".$node."' ORDER BY sort ASC");
	foreach ($nodes as $k=>$v) {
		list($children) = row("SELECT COUNT(*) as count FROM modules WHERE parent_id='".$v['id']."'", 'array');
	//	$nodes[$k]['leaf'] = $children ? false : true;
		$nodes[$k]['expanded'] = $children ? false : true;
	}
	echo json_encode($nodes);
	out();
break;

endswitch;
endif;

?>