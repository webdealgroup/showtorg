<?php

$id = intval($_GET['id']);

if (!empty($_POST['edit'])) {
	$id = intval($_GET['id']);
	update('shops', array('id' => $id), $_POST['set']);
	echo json(array('success' => 1, 'message' => ''));
	exit;
}

$row = row("SELECT * FROM shops WHERE id='".$id."'");

?>

<form method="post" id="items_editform_<?=$id?>">
<input type="hidden" name="edit" value="1">
<input type="hidden" name="unique_id" value="<?=$id?>">
<div><textarea style="width:100%;height:100%;" name="set[css]"><?=htmlspecialchars($row['css'])?></textarea></div>
</form>