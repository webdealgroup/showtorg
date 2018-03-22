<?php
include_once('modules/aModule.class.php');

class search extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die(); 
		if ($arr['node']=="") {$arr['node']=$arr['send_params']['page'];}
		if ($arr['node']=="") {$arr['node']=1;}
        
            $Page = new Page();
            $i = $arr['node'];
            $remark = array();
            $path = "";
            
            while ($i != 1)
            {
                $node = $Page->getNode($i);
                $path = $node[0]['id']."/".$path;
                $remark[] = array('title'=>$node[0]['title'], 'url'=>$node[0]['id']);
                $i = $node[0]['parent_id'];
            } 
            
            //$path = "/1/".$path;
            $path = $arr['node'];
            
    		$_SESSION['smarty']->assign('remark',array_reverse($remark));
    		$_SESSION['smarty']->assign('path',$path);
       
       
		$query="SELECT * FROM currency WHERE id = 1 ";
		$res=rows($query);
        $_SESSION['smarty']->assign('currency',$res[0]['value']);
        $currency = $res[0]['value'];
        
/*
		$query="SELECT items.* , description.*
		FROM items LEFT JOIN description ON (items.id=description.id)  
		WHERE 
            items.hide <> 0 
			AND (items.name like '%".$arr['send_params']['searchword']."%' OR description.description like '%".$arr['send_params']['searchword']."%') 
        GROUP BY items.id
        ORDER BY  items.qty DESC, items.cost DESC ";
*/

		$query="SELECT i.*
		FROM items as i
		WHERE 
            i.hide <> 0 
			AND (i.name like '%".$arr['send_params']['searchword']."%') 
        
        
        UNION
        
        SELECT items.* 
		FROM items LEFT JOIN description ON (items.id=description.id)  
		WHERE 
            items.hide <> 0 
			AND (description.description like '%".$arr['send_params']['searchword']."%') 
        GROUP BY items.id";

		$this->show_items($arr, $remark, $path, $currency, $query); 
		$this->mod_display($this->prot);
	}


	function show_items($arr, $remark, $path, $currency, $query)
	{
		$pn = (isset($arr['send_params']['pn']) && strlen($arr['send_params']['pn']) > 0) ? $arr['send_params']['pn'] : 1;
		$listview = (isset($arr['send_params']['listview']) && strlen($arr['send_params']['listview']) > 0) ? $arr['send_params']['listview'] : 0;
		//$s=$arr['send_params']['s'];
		//$gn=$arr['send_params']['gn'];
		$sortby = (isset($arr['send_params']['sortby']) && strlen($arr['send_params']['sortby'])) ? $arr['send_params']['sortby'] : '';
		$dir = (isset($arr['send_params']['dir']) && strlen($arr['send_params']['dir'])) ? $arr['send_params']['dir'] : 'asc';

		$query_string = $_SERVER["QUERY_STRING"];
		@parse_str($query_string, $q_arr);

		$order_by_query = '';
		$page_view_block = '<table width="100%" cellspacing="0" cellpadding="0" class="page_view"><tbody><tr><td width="250" class="sortby">Сортировать по: ';
		unset ($q_arr['dir']);
		if ($sortby == 'price')
		{
			if ($dir == 'desc')
			{
				$order_by_query .= " ORDER BY cost DESC, name ASC";
				$q_arr['dir'] = 'asc';
			}
			else
			{
				$order_by_query .= " ORDER BY cost ASC, name ASC";
				$q_arr['dir'] = 'desc';
			}
		}
		$q_arr['sortby'] = 'price';
		$page_view_block .= '<a href="/?' . @http_build_query($q_arr) . '" class="' . (isset($q_arr['dir']) ? $q_arr['dir'] . ' active' : '') . '">Цене</a>';
		unset ($q_arr['dir']);
		if ($sortby == 'name')
		{
			$q_arr['sortby'] = 'name';
			if ($dir == 'desc')
			{
				$order_by_query .= " ORDER BY name DESC";
				$q_arr['dir'] = 'asc';
			}
			else
			{
				$order_by_query .= " ORDER BY name ASC";
				$q_arr['dir'] = 'desc';
			}
		}
		$q_arr['sortby'] = 'name';
		$page_view_block .= '<a href="/?' . @http_build_query($q_arr) . '" class="' . (isset($q_arr['dir']) ? $q_arr['dir'] . ' active' : '') . '">Названию</a>';
		if (strlen($order_by_query) == 0)
			$order_by_query .= " ORDER BY young DESC, name ASC";
		$query .= $order_by_query;

		$res = rows($query);
		$_SESSION['smarty']->assign('count',count($res));
		$page_nav_html = "";
		$page_view_block .= '</td><td>&nbsp;</td>';

		unset ($q_arr);
		@parse_str($query_string, $q_arr);
		//
		if ($listview == '1')
		{ // Одностраничный список
			$_SESSION['smarty']->assign('listview', 1);
			unset ($q_arr['listview']);
			$page_view_block .= '<td class="pageview"><a href="/?' . @http_build_query($q_arr) . '" class="row_view">Развернутый вид списка</a></td><td class="pageview"><span class="list_view">Одностраничный список</span></td>';
			$query .= " LIMIT 10000";
		}
		else
		{ // Развернутый вид списка
			$_SESSION['smarty']->assign('listview', 0);
			$res_num = count($res);

			//----------------------
			// Навигационная панель
			//----------------------
			// Вычисляем общее количество страниц, на каждой странице максимум по 10 позиций
			$items_per_page_cnt = 10;
			$pages_show_nav_cnt = 5;
			$page_cnt = ceil($res_num / $items_per_page_cnt);
			if ($pn < 1)
				$pn = 1;
			if ($pn > $page_cnt)
				$pn = $page_cnt;
			// Составляем навигационную панель
			$page_nav_html .= '<table width="100%" cellspacing="0" cellpadding="0" class="page_links"><tbody><tr><td width="180" align="left">';
			// В начало, Предыдущая страница
			if ($pn > 1)
			{
				$q_arr['pn'] = $pn - 1;
				$page_nav_html .= '<a href="/?' . @http_build_query($q_arr) . '" title="Предыдущая страница">&larr;предыдущая</a>';
			}
			else
				$page_nav_html .= '<span>&larr;предыдущая</span>';
			$page_nav_html .= '</td><td width="100%" style="text-align: center;">';

			// Список ссылок на номера страниц
			$min_page = $pn - $pages_show_nav_cnt;
			$max_page = $pn + $pages_show_nav_cnt;
			if ($min_page < 1)
			{
				$max_page = min($max_page - $min_page, $page_cnt);
				$min_page = 1;
			}
			if ($max_page > $page_cnt)
			{
				$min_page = max($min_page + $page_cnt - $max_page, 1);
				$max_page = $page_cnt;
			}
			if ($min_page > 1)
			{
				$q_arr['pn'] = 1;
				$page_nav_html .= '<a href="/?' . @http_build_query($q_arr) . '">1</a>';
				if ($min_page > 2)
					$page_nav_html .= '<b>...</b>';
			}
			for ($ipn = $min_page; $ipn <= $max_page; $ipn++)
			{
				if ($ipn == $pn)
					$page_nav_html .= '<b>' . $ipn . '</b>';
				else
				{
					$q_arr['pn'] = $ipn;
					$page_nav_html .= '<a href="/?' . @http_build_query($q_arr) . '">' . $ipn . '</a>';
				}
			}
			if ($max_page < $page_cnt - 1)
			{
				if ($max_page < $page_cnt - 2)
					$page_nav_html .= '<b>...</b>';
				$q_arr['pn'] = $page_cnt;
				$page_nav_html .= '<a href="/?' . @http_build_query($q_arr) . '">' . $page_cnt . '</a>';
			}
			$page_nav_html .= '</td><td width="180" align="right">';
			// Следующая страница, В конец
			if ($pn < $page_cnt)
			{
				$q_arr['pn'] = $pn + 1;
				$page_nav_html .= '<a href="/?' . @http_build_query($q_arr) . '" title="Следующая страница">следующая&rarr;</a>';
			}
			else
				$page_nav_html .= '<span>следующая&rarr;</span>';
			$page_nav_html .= '</td></tr></tbody></table>';
			//-------------------

			$query .= " LIMIT " . (($pn - 1) * $items_per_page_cnt) . ", " . $items_per_page_cnt;
		
			unset ($q_arr);
			@parse_str($query_string, $q_arr);
			$q_arr['listview'] = 1;
			$page_view_block .= '<td class="pageview"><span class="row_view">Развернутый вид списка</span></td><td class="pageview"><a href="/?' . @http_build_query($q_arr) . '" class="list_view">Одностраничный список</a></td>';
		}
		$page_view_block .= '</tr></tbody></table>';

		$res = rows($query);

        $Page = new Page();  
        
		foreach ($res as $k => $v)
		{
            $i = $res[$k]["node"];
            $path = "";
            
            while ($i != 1)
            {
                $node = $Page->getNode($i);
                $path = $node[0]['id']."/".$path;
                $i = $node[0]['parent_id'];
            } 
            
            //$path = "1/".$path;            
            $path = $res[$k]["node"];
        
            //$q="SELECT * FROM images WHERE node = ".$res[$k]["id"]." ";
            //$r=q($q);
            
            $res[$k]["dir"] = $path;
            
            $url = "docs/".$res[$k]["id"].".pdf";
            if (file_exists($url)) {
                $res[$k]["pdf"] = $url;
            }
            
            /*//$res[$k]["image"] = $r[0]["name"];
            
            $image = imagecreatefromjpeg("img/".$path."/".$res[$k]["image"]);
    		$res[$k]["x"] = imagesx($image)/2;
    		$res[$k]["y"] = imagesy($image)/2;
            
            if($res[$k]["x"]>250) {$res[$k]["x"] = 250; $res[$k]["y"] = $res[$k]["y"] * ( 250/$res[$k]["x"] ); }
            if($res[$k]["y"]>250) {$res[$k]["y"] = 250; $res[$k]["x"] = $res[$k]["x"] * ( 250/$res[$k]["y"] ); }*/
            
            //$res[$k][cost] = number_format($res[$k][cost] * $currency, 0, '', ' ');

            $credit = ($res[$k][cost]* $currency)/10;
            if ($res[$k]["cost"] >300000 && $res[$k]["cost"] < 5000000) $res[$k]["credit"] = number_format($credit, 0, '', ' ');
            
            $res[$k]["cost"] = number_format($res[$k]["cost"] * $currency, 0, '', ' ');  


            $q="SELECT * FROM description WHERE id = ".$res[$k]["id"]." ";
            $r=rows($q);
            
            //$res[$k]['param'] = substr($r[0]["description"], 0, strpos($r[0]["description"], '<br />')); 
            $res[$k]["param"] = $r[0]["description"];            
    	}

        //echo "<pre>"; print_r($res); echo "</pre>"; //die();
		
		$_SESSION['smarty']->assign('items',$res);
		$_SESSION['smarty']->assign('page_view_block',$page_view_block);
		$_SESSION['smarty']->assign('page_nav_html',$page_nav_html);
		$_SESSION['smarty']->assign('searchword',$arr['send_params']['searchword']);
		//$_SESSION['smarty']->assign('list',$list);
	}
}
?>