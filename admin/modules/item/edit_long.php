<?php



$id = !empty($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
if (!$id) die(json(array('failure' => 'Не указан ID товара.')));

$order   = array("\r\n", "\n", "\r");
$replace = '';

$saved = false;
if (!empty($_POST['editnode'])) {

    $row = row("SELECT COUNT(*) as count FROM info WHERE id='".$id."'");
    
    //echo "<pre>"; print_r($row); echo "</pre>"; //die();
		if (!$row['count']) {
            insert('info', array('id' => $id, 'description' => str_replace($order, $replace, $_REQUEST['description'])));
            //sleep(1);
		} else {
            update('info', array('id' => $id), array('description' => str_replace($order, $replace, $_REQUEST['description'])));
		}
	$saved = true;
}


require_once('js/editor/config.php');
require_once('js/editor/editor_class.php');

//echo "<pre>"; print_r($_REQUEST); echo "</pre>"; //die();

$data = row("SELECT * FROM info WHERE id=".$id);

//echo "<pre>"; print_r($data); echo "</pre>"; //die();


$editor = new wysiwygPro();
$editor->set_name("description");
$editor->set_code($data['description']);
//$editor->set_stylesheet("../../style.css");
$editor->set_savebutton('save');
$textarea = $editor->return_editor('100%', '450');

?>
<html>
<head>
<style type="text/css">
html,body {height:100%;}
body { background-color: #ffffff; margin: 0px; padding: 0px; color: #000000}
td, body { font-family: Arial, Verdana, Helvetica; font-size: 11px; color: #666666; padding: 0px; }
p { margin: 0px 0px 0px 0px; }
img { border: 0px; }
table { border: 0px; border-collapse: collapse; }
form { margin: 0px; }
#content_container { height: 100%; }
#content_container td { vertical-align: top; }
#content_container iframe { height: 87%; }
#content_tab_one, #content_tab_two, #content_tab_three { height: 95%; }
#content_tab_table { height: 20px; }
</style>
</head>
<body>
<form method="post">
<input type="hidden" name="editnode" value="1">
<input type="hidden" name="id" value="<?=$id?>">
<?=$textarea?>
</form>

</body>
</html>