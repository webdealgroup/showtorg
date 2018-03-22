<?php
include("JSON.php");
$json = new Services_JSON();

//$dir = "../img/";
$dir = "../img/".$_POST['dir']."";

//if ($_POST['dir'] == "/1") $dir = "../img/";

$images = array();
$d = dir($dir);

//echo "<pre>"; print_r($d); echo "</pre>"; //die();

while($name = $d->read()){
    if(!preg_match('/\.(jpg|gif|png|JPG|GIF|PNG)$/', $name)) continue;
    //$size = filesize($dir.$name);
    //$lastmod = filemtime($dir.$name)*1000;
    $images[] = array('name'=>$name, //'size'=>$size, 
			//'lastmod'=>$lastmod, 
            'url'=>$_POST['dir']."/".$name);
}
$d->close();
sort($images);
$o = array('images'=>$images);

$output = $json->encode($o);
print($output);
?>