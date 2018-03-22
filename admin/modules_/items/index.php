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



function mysql_evaluate_array($query) {
    $result = mysql_query($query);
    $num = mysql_num_fields($result);

	//echo mysql_num_rows($result);

	$rows = array();
    for ($i=0; $i < mysql_num_rows($result); ++$i)
	{
	    for ($j=0; $j < $num; ++$j)
		{
	        $row[mysql_field_name($result, $j)] = mysql_result($result,$i,$j);
	    	
		}
		$rows[] = $row;

	}
	return $rows;
}


if ($_POST['task'] == 'getData') {


	//$limit = ' LIMIT '.(!empty($_POST['start']) ? intval($_POST['start']) : 0).','.(!empty($_POST['limit']) ? intval($_POST['limit']) : 10);
	$sorting = (!empty($_POST['dir']) AND in_array(strtoupper($_POST['dir']), array('ASC','DESC'))) ? $_POST['dir'] : ' ASC ';
	$orderby = !empty($_POST['sort']) ? $_POST['sort'] : $_POST['key'];
    if (isset($_POST['node']) && strlen($_POST['node'])>0 )
    {
        $where = ' WHERE items.node='.$_POST['node'].' ';
    }



	$query = "SELECT * FROM items ".$where." ORDER BY id ASC ";

	
    $data = mysql_evaluate_array($query);
    
   
   /*
		foreach ($data as $k => $v)
		{
			if (isset($data[$k]["id"]) && strlen($data[$k]["id"])>0)
			{ 
				$r= row("SELECT LENGTH(`description`.`description`) as len FROM `description`.`description` WHERE id = ".$data[$k]["id"]." ");
				$data[$k]["param"] = count($r);
			
				$r= row("SELECT LENGTH(description) as len FROM info WHERE id = ".$data[$k]["id"]." ");
				$data[$k]["descr"] = count($r);
			}
		}
    */   
    
	//echo "<pre>"; print_r($data); echo "</pre>"; die();
 
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
	echo json(array('success' => 1, 'del_count' => $i, 'message' => 'Р—Р°РїРёСЃРё СѓРґР°Р»РµРЅС‹.'));
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

/* Обрезка текста - excerpt
maxchar = количество символов.
text = какой текст обрезать (по умолчанию берется excerpt поста, если его нету, то content, если есть тег <!--more-->, то maxchar игнорируется и берется все, что до него, с сохранением HTML тегов )
save_format = Сохранять перенос строк или нет. По умолчанию сохраняется. Если в параметр указать определенные теги, то они НЕ будут вырезаться из обрезанного текста (пример: save_format=<strong><a> )
echo = выводить на экран или возвращать (return) для обработки.
П.с. Шоткоды вырезаются. Минимальное значение maxchar может быть 22.
*/
function kama_excerpt($args=''){
	global $post;
		parse_str($args, $i);
		$maxchar 	 = isset($i['maxchar']) ?  (int)trim($i['maxchar'])		: 350;
		$text 		 = isset($i['text']) ? 			trim($i['text'])		: '';
		$save_format = isset($i['save_format']) ?	trim($i['save_format'])			: false;
		$echo		 = isset($i['echo']) ? 			false		 			: true;

	if (!$text){
		$out = $post->post_excerpt ? $post->post_excerpt : $post->post_content;
		$out = preg_replace ("!\[/?.*\]!U", '', $out ); //убираем шоткоды, например:[singlepic id=3]
		// для тега <!--more-->
		if( !$post->post_excerpt && strpos($post->post_content, '<!--more-->') ){
			preg_match ('/(.*)<!--more-->/s', $out, $match);
			$out = str_replace("\r", '', trim($match[1], "\n"));
			$out = preg_replace( "!\n\n+!s", "</p><p>", $out );
			$out = "<p>". str_replace( "\n", "<br />", $out ) ."</p>";
			if ($echo)
				return print $out;
			return $out;
		}
	}

	$out = $text.$out;
	if (!$post->post_excerpt)
		$out = strip_tags($out, $save_format);

	if ( iconv_strlen($out, 'utf-8') > $maxchar ){
		$out = iconv_substr( $out, 0, $maxchar, 'utf-8' );
		$out = preg_replace('@(.*)\s[^\s]*$@s', '\\1 ...', $out); //убираем последнее слово, ибо оно в 99% случаев неполное
	}

	if($save_format){
		$out = str_replace( "\r", '', $out );
		$out = preg_replace( "!\n\n+!", "</p><p>", $out );
		$out = "<p>". str_replace ( "\n", "<br />", trim($out) ) ."</p>";
	}

	if($echo) return print $out;
	return $out;
}


?>