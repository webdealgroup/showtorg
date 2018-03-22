<?php

if ($_POST['task'] == 'getData') {
	$limit = ' LIMIT '.(!empty($_POST['start']) ? intval($_POST['start']) : 0).','.(!empty($_POST['limit']) ? intval($_POST['limit']) : 10);
	$sorting = (!empty($_POST['dir']) AND in_array(strtoupper($_POST['dir']), array('ASC','DESC'))) ? $_POST['dir'] : ' ASC ';
	$orderby = !empty($_POST['sort']) ? $_POST['sort'] : $_POST['key'];
    if (isset($_POST['node']) && strlen($_POST['node'])>0 )
    {
        $where = ' WHERE node='.$_POST['node'];
    }

	$data = rows("SELECT images.id,images.node,images.name,items.node as url FROM images images INNER JOIN items items ON (images.node = items.id) WHERE images.node= ".$_POST['node']."  ORDER BY ".$orderby.' '.$sorting.' '.$limit);
    foreach ($data as $k => $v)
    {
            $i = $data[$k]['url'];
            $path = "";
            $kk = 0;
            while ($i != 1)
            {
                $node = rows("SELECT * FROM tree WHERE id =".$i);
                $path = $node[0]['id']."/".$path;
                $i = $node[0]['parent_id'];
                $kk++;
                if ($kk>10) break;
                
            } 
            $data[$k]['url'] = "/1/".$path;
    }
    
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
		$newid = insert($_POST['table'], array($_POST['field'] => $_POST['value'] ));//$_POST['field_node'] => $_POST['value_node'] ));
	} else {
		$newid = 0;
		update($_POST['table'], array($_POST['key'] => $_POST['keyID']), array($_POST['field'] => $_POST['value']));
	}
	echo json(array('success' => 1, 'newID' => $newid, 'message' => ''));
	exit;
}

if ($_POST['task'] == 'insert') {

        if (isset($_POST['field_node']) && strlen($_POST['value_node'])>0)    
        {
            $newid = insert($_POST['table'], array($_POST['field'] => $_POST['value'], $_POST['field_node'] => $_POST['value_node']));
        }
        else
        {
		    $newid = insert($_POST['table'], array($_POST['field'] => $_POST['value']));
        }

        if (isset($_POST['field_node']) && strlen($_POST['value_node'])>0)    
        {
		    echo json(array('success' => 1, 'newID' => $newid, 'message' => "", $_POST['field'] => $_POST['value'], 'newNode' => $_POST['value_node']));
        }
        else
        {
		    echo json(array('success' => 1, 'newID' => $newid, 'message' => "", $_POST['field'] => $_POST['value']));
        }  
        
	exit;
}


?>