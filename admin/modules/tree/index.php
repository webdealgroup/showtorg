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


case "insertRows":
	$node_id = intval($_POST['node_id']);
   
    $d = array();
    $items = array();
    $m =  array();
    
    $data = base64_decode($_POST['data']);

    $tok = strtok($data, "\n");
    while ($tok) {
        $items[] = $tok;
        $tok = strtok("\n");
    }

    foreach ($items as $item)
    {
        list($name, $cost) = explode("\t", $item);
        
        $m['node'] = $node_id; 
        $m['name'] = $name; 
        $m['cost'] = $cost; 
        
        $d[] = $m;
    }


    foreach($d as $dd)
    {
        insert('items', $dd);
    }

//echo "<pre>"; print_r($d); echo "</pre>"; //die();
 /**/
	//insert('items', $d));
    //updateSort($_POST['order']);
    
	echo json(array('success' => 1, 'message' => '', 'data' => serialize($d)));
	out();
break;


case "updateImage":
    $node_id = intval($_POST['node_id']);
	update('tree', array('id' => $node_id), array(
		'image' => $_POST['name']
	));
	echo json(array('success' => 1, 'message' => ''));
	out();
break;


case "saveOrder":
	$node_id = intval($_POST['node_id']);
	$parent_id = intval($_POST['parent_id']);
	update('tree', array('id' => $node_id), array('parent_id' => $parent_id));
	updateSort($_POST['order']);

//===================== move folder

$conn_id = @ftp_connect('localhost', 21, 5); // ����������� � ������� FTP
if($conn_id) // ���� ���������� � �������� ������ ������, ����������
{
    $login_result = @ftp_login($conn_id, 'allvision', 'HzBpHuLn'); // ������ ���� ����� � ������ ��� FTP
    if($login_result) // ���� ������ ������ ����� ������, ���� ������
    {
            
        // ������ ����� �������� � ��������� �������, �������� ��� ��� ���������(TRUE, FALSE)
        // ���� ���������� ������� ftp ����� �������� �� ���������, �������� ������ ���� �������� (TRUE ��� FALSE)
        ftp_pasv ($conn_id, TRUE); // � ������ ������ ��������� ����� �������
        
        ftp_rename($conn_id, $_POST['dir']."/".$_POST['node_id'], $_POST['new_dir']."/".$_POST['node_id']);
    }
    else echo "login or password error";
}
ftp_close($conn_id); // � ��������� ������� � FTP

//=======================


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
	$nodes = rows("SELECT id, name, title as text, parent_id, tpl, status FROM tree WHERE parent_id='".$node."' ORDER BY sort ASC");//AND status = 2 ORDER BY sort ASC");
    
//echo "<pre>"; print_r($nodes); echo "</pre>"; // die();
    
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

endswitch;
endif;

?>