<?php

header('Content-Type: text/html; charset=windows-1251');
q("SET NAMES 'cp1251'");

$id = !empty($_GET['id']) ? intval($_GET['id']) : 0;
if (!$id) die(json(array('failure' => 'Не указан ID страницы.')));

$saved = false;
if (!empty($_POST['editnode'])) {
	update('tree', array('id' => $id), array('content' => $_POST['content']));
	$saved = true;
}

require_once('js/editor/config.php');
require_once('js/editor/editor_class.php');

$data = row("SELECT * FROM tree WHERE id='".$id."'");

$editor = new wysiwygPro();
$editor->set_name("content");
$editor->set_code($data['content']);
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
<?=$textarea?>
</form>

</body>
</html>