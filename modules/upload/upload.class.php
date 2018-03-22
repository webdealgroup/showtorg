<?php
include_once('modules/aModule.class.php');


class upload extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;
	
//-------------------	
	function execute($arr)
	{	
      //echo "<pre>";	print_r($arr);	echo "</pre>";
	
		$rez=1;
		if ($arr['send_params']['action']!="") {$arr['action']=$arr['send_params']['action'];}
		if($arr['send_params']['dir']!="")
		{
			$dir=$arr['send_params']['dir'];
			$arr['send_params']['adres']=base64_encode(base64_decode($arr['send_params']['adres']).$dir."/"); 
		}
			
		if($arr['send_params']['id']!=""){$id=$arr['send_params']['id'];}
		
		switch ($arr['action'])
		{
			case 'view': $arr=($this->addform($arr));  break;
			case 'view_dir': $arr=($this->view_dir($arr)); break;
			case 'view_dir2': $arr=($this->view_dir2($arr)); break;
			case 'add': $arr=($this->add($arr)); break;
			case 'add_dir': $arr=($this->add_dir($arr)); break;
			case 'add_group': $arr=($this->add_group($arr)); break;
			case 'rdfile': $arr=($this->rdfile($arr)); break;
			case 'rddir': $arr=($this->rddir($arr)); break;
			default : $arr=($this->add($arr));
		}
        
        
		$query="SELECT * FROM `tree` WHERE `parent_id` = 92 ORDER BY `sort` ASC ";
   		$res=$this->executeDBQuery($query);
		$_SESSION['smarty']->assign('catalog',$res);
        
		$_SESSION['smarty']->assign('adres',$arr['send_params']['adres']);
		$_SESSION['smarty']->assign('adres2',$arr['send_params']['dir']);
		$_SESSION['smarty']->assign('action',$arr['action']);
		$_SESSION['smarty']->assign('type',$arr['send_params']['type']);
		$this->mod_display($this->prot);
	}
//---------------------------
	function add_group($arr)
	{
	
	$what_dir=base64_decode($arr['send_params']['adres']);
	////////////root to file///////
	$str=base64_decode($arr['send_params']['adres']);
				$str_exp=explode("/",$str);
				$count=count($str_exp);
				unset ($str_exp[0]);
				unset ($str_exp[1]);
				unset ($str_exp[2]);
				unset ($str_exp[3]);
				unset ($str_exp[4]);
				unset ($str_exp[5]);
				$new_str=implode("/",$str_exp);
				$str=$new_str;
	///////////////////
	 $olddir=getcwd();
	 chdir($what_dir);
	 if ($handle = opendir($what_dir))
	  {
	   while (false !== ($filename = readdir($handle)))
		{
		 if (($filename==".")||($filename=="..")) continue;
		 if (is_file($filename))
		 {
		 	
			$filename1=$filename;
			$filename=$filename.".";	$len=strlen($filename);
			while($len!==$pos+1)
			{
				$pos=strpos($filename,".");
				$filename=substr_replace($filename,"_",$pos,1);
				$array[$filename1][]=$pos;
			}
			$filename=substr($filename,0,$len-1	);
					
			if ($arr['send_params'][$filename]=='on')
				{
			///////////////////////////////////////////////
				$filename=$filename."_";
				$len=strlen($filename);
				foreach ($array[$filename1] as $i=>$value)
				{	$filename=substr_replace($filename,".",$array[$filename1][$i],1);	}
				$filename=substr($filename,0,$len-1	);
				
				$t= $str."$filename";
				$t1= $arr['send_params']['spisok'];
				$sql = "INSERT INTO `group` SET p_root = '".$t."' , p_group = '".$t1."' ";

				$this->executeDBQuery($sql);
				
                usleep(100);
                
			//////////////////////////////////////////////////////
			}
			
		 } 
		}
	   closedir($handle);
	  }
	   else echo "Не могу открыть каталог ".$what_dir;
 	 chdir($olddir);
  
    $arr=($this->view_dir($arr));
	return $arr;
	}	
//---------------------------
	function view_dir2($arr)
	{	
		$str=base64_decode($arr['send_params']['adres']);
		/////////////////////////////////////////////////////////////////
		if ($str!=="/var/www/html/msv.by/")
		{
		$str_exp=explode("/",$str);
		$count=count($str_exp);
		$cnt=$count-2;
		unset ($str_exp[$cnt]);
		$new_str=implode("/",$str_exp);
		$str=$new_str;
		}
		////////////////////////////////////////////////////////////
		$arr['send_params']['adres']=base64_encode($str);
		$arr=($this->view_dir($arr));
		return $arr;
	}
//---------------------------------	
	function view_dir($arr)
	{	

	$str=base64_decode($arr['send_params']['adres']);
				$str_exp=explode("/",$str);
				$count=count($str_exp);
				unset ($str_exp[0]);
				unset ($str_exp[1]);
				unset ($str_exp[2]);
				unset ($str_exp[3]);
				unset ($str_exp[4]);
				unset ($str_exp[5]);
				$new_str=implode("/",$str_exp);
				$str=$new_str;
				$arr['send_params']['adres2']=$str;
	$what_dir=base64_decode($arr['send_params']['adres']);
	 $olddir=getcwd();
	 chdir($what_dir);
	 if ($handle = opendir($what_dir))
	  {
	   while (false !== ($filename = readdir($handle)))
		{
		 if (($filename==".")||($filename=="..")) continue;
		 if (is_file($filename))
		 {
			 $a[]=$filename;
			 $a[]=filesize($filename);
			 $a[]=date("Y.m.d H:i:s",filectime($filename)); 
			///////////// 
			 $valid_types=array('gif','jpg','png','jpeg','jpe','JPG','GIF','BMP','PNG');  // допустимые расширения
			 $str_ex=explode(".",$filename);
			 $cnt=count($str_ex);
			// print_r($str_ex);
			 if (!in_array($str_ex[$cnt-1], $valid_types)) {  $a[]=2;}else {$a[]=1;}
			//////////////////
			 $a[]=$filename;
		 }
		  elseif (is_dir($filename))
		   {
			$arr1[]=$filename;		$arr1[]="(dir)";		$arr1[]="";		
////////////////////////////////
			 if ($handle1 = opendir($what_dir.$filename."/"))
			  {
				$tt=0;			  
			   while (false !== ($filename1 = readdir($handle1)))
				{ 
	     		 if (($filename1==".")||($filename1=="..")) continue;
			    $tt=$tt+1;
				}
			   closedir($handle1);
			  }
			   else echo "Не могу открыть каталог ".$what_dir.$filename."/";
		////////////////////////////////
			if ($tt==0)
			{	$arr1[]="";	$arr1[]="Удалить";}
			else
				{$arr1[]="";$arr1[]="";}
		    }
		}
	   closedir($handle);
	  }
	   else echo "Не могу открыть каталог ".$what_dir;

 	 chdir($olddir);
	 ///////////папки//////////////
	  $t=count($arr1)/5;
	  for($i=0; $i<$t;$i++)
		{	
			$r=5*$i;
			$item[p_1] = $arr1[$r];
			$item[p_2] = $arr1[$r+1];
			$item[p_3] = $arr1[$r+2];
			$item[p_4] = $arr1[$r+3];
			$item[p_5] = $arr1[$r+4];
			$data[] =$item; 
		}
	/////////////файлы////////////////	
	  $t=count($a)/5;
	  for($i=0; $i<$t;$i++)
		{	
			$r=5*$i;
			$item2[p_1] = $a[$r];
			$item2[p_2] = $a[$r+1];
			$item2[p_3] = $a[$r+2];
			$item2[p_4] = $a[$r+3];
			$item2[p_5] = $a[$r+4];
			
			$data2[] =$item2; 
		}
	///////////////////////////
	  $_SESSION['smarty']->assign('data', $data);
	  $_SESSION['smarty']->assign('data2', $data2);
	  return $arr;
	}
//---------------------------
	function addform($arr)
	{
		$arr['send_params']['adres']=base64_encode("/var/www/html/promkras.by/");
		$arr=($this->view_dir($arr));
		return $arr;
	}	
//---------------------------
	function rdfile($arr)
	{	
		$dir=base64_decode($arr['send_params']['adres']);
		$name=$arr['send_params']['id'];
		if (is_file("$dir/$name")) unlink ("$dir/$name");  // УДАЛЯЕМ изображение
		$arr=($this->view_dir($arr));
		return $arr;
	}	
//---------------------------
	function rddir($arr)
	{
		$dir=base64_decode($arr['send_params']['adres']);
		$name=$arr['send_params']['id'];
		if (is_dir("$dir/$name")) {rmdir ("$dir/$name");}  // УДАЛЯЕМ папку
		$arr=($this->view_dir($arr));
		return $arr;
	}	
//---------------------------
	function add_dir($arr)
	{	
		$datadir=base64_decode($arr['send_params']['adres']); 
		$dir=$arr['send_params']['newgrup'];
		$datadir1=$datadir.$dir;
		if (!is_dir($datadir1)) mkdir($datadir1); 
		$arr=($this->view_dir($arr));
		return $arr;
	}	
//---------------------------
	function add($arr)
	{ 
/*
| ERRORS:
| 1: No upload
| 2: Not valid upload type
| 3: Upload exceeds $max_file_size
| 4: Could not move uploaded file, upload deleted
| 5: file yze est	
+--------------------------------------------------------------------------
*/
	$valid_types=array('gif','jpg','png','jpeg','jpe','xls','doc','docx','xlsx','rar','zip','txt');  // допустимые расширения
	$max_file_size="2050000"; // Максимально допустимый размер загружаемого фото
	$datadir=base64_decode($arr['send_params']['adres']); // Каталог с фото и комментариями/оценками
	//-----------------
		$fotoname=$_FILES['file']['name']; // определяем имя файла
		$fotosize=$_FILES['file']['size']; // Запоминаем размер файла
				// проверяем расширение файла
		$ext = strtolower(substr($fotoname, 1 + strrpos($fotoname, ".")));
		if (!in_array($ext, $valid_types)) { $arr['send_params']['error']=2;exit;}
		// 2. если в имени есть .php, .html, .htm - свободен! 
		if (preg_match("/\.php/i",$fotoname))  { $arr['send_params']['error']=2;exit;}
		if (preg_match("/\.html/i",$fotoname)) { $arr['send_params']['error']=2;exit;}
		if (preg_match("/\.htm/i",$fotoname))  { $arr['send_params']['error']=2;exit;}
		// 3. Проверяем, может быть файл с таким именем уже есть на сервере
		if (file_exists("$datadir/$fotoname"))  { $arr['send_params']['error']=5;exit;}
		// 4. Размер
		$fotomax=round($max_file_size/10.24)/100; // максимальный размер фото в Кб.
		if ($fotoksize>$fotomax) { $arr['send_params']['error']=3;exit;}
		if   ($fotosize>"0" and $fotosize<$max_file_size) { copy($_FILES['file']['tmp_name'],$datadir."/".$fotoname);}
		 else { $arr['send_params']['error']=1;exit;}
		//  закачиваем прикреплённый файл на сервер
		if (isset($_POST['file'])) 	{if (!copy($file, $file.'.bak')) { $arr['send_params']['error']=3;}	}
			else
			{
			$arr=($this->view_dir($arr));
			$str=base64_decode($arr['send_params']['adres']);
				{
				$str_exp=explode("/",$str);
				$count=count($str_exp);
				unset ($str_exp[0]);
				unset ($str_exp[1]);
				unset ($str_exp[2]);
				unset ($str_exp[3]);
				unset ($str_exp[4]);
				unset ($str_exp[5]);
				$new_str=implode("/",$str_exp);
				$str=$new_str;
				}
			$arr['send_params']['$fotoname']=$str;
			}
			
		return $arr;	
	}
}
?>