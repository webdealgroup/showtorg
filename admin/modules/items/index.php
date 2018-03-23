<?php


function updateSort($order) {
	$order = str_replace(array('[',']','"'), '', $order);
	$order = explode(',', $order);
	$i = 0;
	foreach ($order as $id) {
		update('items', array('id' => $id), array('sort' => $i));
		$i++;
	}
}

if ($_POST['task'] == 'getData') {
	$limit = ' LIMIT '.(!empty($_POST['start']) ? intval($_POST['start']) : 0).','.(!empty($_POST['limit']) ? intval($_POST['limit']) : 10);
	$sorting = (!empty($_POST['dir']) AND in_array(strtoupper($_POST['dir']), array('ASC','DESC'))) ? $_POST['dir'] : ' ASC ';
	$orderby = !empty($_POST['sort']) ? $_POST['sort'] : $_POST['key'];
    if (isset($_POST['node']) && strlen($_POST['node'])>0 )
    {
        $where = ' WHERE items.node='.$_POST['node'].' ';
    }
    $data = rows("SELECT * FROM items ".$where." ORDER BY ".$orderby);
    $sql = "SELECT * FROM items ".$where." ORDER BY ".$orderby;
		foreach ($data as $k => $v)
		{
			$data[$k]['title'] = str_replace("'", "`", $data[$k]['title']); 

			//$r= rows("SELECT * FROM description WHERE id = ".$data[$k]["id"]." ");
			//$data[$k]["param"] = $r[0]["description"];
		}

	list($counter) = row("SELECT COUNT(*) as count FROM ".$_POST['table']."",'array');
	$data = json_table($data,$counter,$sql);
	echo $data;
	exit;
}

if ($_POST['task'] == 'delete') {
	$rows = str_replace(array('[',']','"'), '', $_POST['rows']);
	$rows = explode(',', $rows);
	$i = 0;
	foreach ($rows as $r) {
		if (sql_delete($_POST['table'], array($_POST['key'] => intval($r))))
			$i++;
	}
	echo json(array('success' => 1, 'del_count' => $i, 'message' => 'Записи удалены.'));
	exit;
}

if ($_POST['task'] == 'saveOrder') {

	$id = intval($_POST['id']);
	$node = intval($_POST['node']);

    $order = $_POST['order'];
	$order = str_replace(array('[',']','"'), '', $order);
	$order = explode(',', $order);
    
	$i = 0;
	foreach ($order as $id) {
		update('items', array('id' => $id), array('sort' => $i));
		$i++;
	}
	echo json(array('success' => 1, 'message' => ''));
	out();

}



?>