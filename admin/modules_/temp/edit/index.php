<?php

if ($_POST['task'] == 'getData') {
	$limit = ' LIMIT '.(!empty($_POST['start']) ? intval($_POST['start']) : 0).','.(!empty($_POST['limit']) ? intval($_POST['limit']) : 10);
	$sorting = (!empty($_POST['dir']) AND in_array(strtoupper($_POST['dir']), array('ASC','DESC'))) ? $_POST['dir'] : ' ASC ';
	$orderby = !empty($_POST['sort']) ? $_POST['sort'] : $_POST['key'];
	$data = rows("SELECT * FROM ".$_POST['table']." ORDER BY ".$orderby.' '.$sorting.' '.$limit);
	list($counter) = row("SELECT COUNT(*) as count FROM ".$_POST['table']."",'array');
	$data = json_table($data,$counter);
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

if ($_POST['task'] == 'update') {
	$row = row("SELECT * FROM ".$_POST['table']." WHERE ".$_POST['key']."='".@intval($_POST['keyID'])."'");
	if (!$row) {
		$newid = insert($_POST['table'], array($_POST['field'] => $_POST['value']));
	} else {
		$newid = 0;
		update($_POST['table'], array($_POST['key'] => $_POST['keyID']), array($_POST['field'] => $_POST['value']));
	}
	echo json(array('success' => 1, 'newID' => $newid, 'message' => 'Изменения сохранены!'));
	exit;
}

?>