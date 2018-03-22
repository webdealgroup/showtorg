<?php
if (isset($_POST['task'])):
switch ($_POST['task']):

case "updateValue":
	$id = 1;
	$name = $_POST['name'];

			update('currency', array('id' => $id), array('value' => $name));
			echo json(array('success' => 1, 'message' => '', 'name' => $name));

	out();
break;

case "updateShowing":
	$id = 2;
	$name = $_POST['name'];

			update('currency', array('id' => $id), array('value' => $name));
			echo json(array('success' => 1, 'message' => '', 'name' => $name));

	out();
break;

case "getCurrency":

        $row = row("SELECT value FROM currency WHERE id=1 ");
		echo json(array('success' => 1, 'message' => '', 'name' => $row['value']));

    out();
break;

endswitch;
endif;

?>