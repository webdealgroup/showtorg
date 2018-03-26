<?php
include_once('modules/aModule.class.php');

class items extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{

		if ($arr['node']=="") {$arr['node']=$arr['send_params']['page'];}
        $node = $arr['node'];

        $res = rows("SELECT * FROM tree WHERE id !=1"); // берем все ветки без корневой
        $tree = array();
        // расставить ключи в массиве tree
        foreach($res as $k=>$v) $tree[$res[$k]['id']] = $v;

        // для каждой записи делаем цикл восхождения до корневого узла
        $conditions = array();

        foreach($tree as $k=>$v)
        {
            $id = $tree[$k]['id']; // берем текущий id в дереве
            $tmp = array();
            do
            {
                $tmp[] = $id; // пишем его во временный массив
                $parent_id = $tree[$id]['parent_id']; // определяем родителя
                if ($parent_id == $node) // если родитель наш узел, то добавляем в условие
                {
                    $conditions = array_merge($conditions, $tmp);
                    break; // и покидаем цикл do while
                }
                else
                {
                    $id = $parent_id; // переопределяем i на родителя
                }
            }while($parent_id != 1);
        }

		$where = $arr['node'];//"1"; // корневой узел включаем в выборку !!!!
		$i = 0;
		foreach($conditions as $k=>$v)
		{
			$where .= ", ".$conditions[$k];
		}

		$query="SELECT * FROM items WHERE  node IN (".$where.") ";

		$this->show_items($arr, $remark, $path, $currency, $query); 

        $_SESSION['smarty']->assign('tree',$tree);
        $_SESSION['smarty']->assign('node',$node);

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




		$order_by_query = ' ORDER BY  cost ASC, name ASC ';
		$page_view_block = '<table width="100%" cellspacing="0" cellpadding="0" class="page_view"><tbody><tr><td width="250" class="sortby">Сортировать по: ';
		unset ($q_arr['dir']);
		if ($sortby == 'price')
		{
            $order_by_query = '';
            
			if ($dir == 'desc')
			{
				$order_by_query .= " ORDER BY items.cost DESC, items.name ASC";
				$q_arr['dir'] = 'asc';
			}
			else
			{
				$order_by_query .= " ORDER BY items.cost ASC, items.name ASC";
				$q_arr['dir'] = 'desc';
			}
		}
		$q_arr['sortby'] = 'price';
		$page_view_block .= '<a href="/?' . @http_build_query($q_arr) . '" class="' . (isset($q_arr['dir']) ? $q_arr['dir'] . ' active' : '') . '">Цене</a>';
		unset ($q_arr['dir']);
		if ($sortby == 'name')
		{
            $order_by_query = '';
			$q_arr['sortby'] = 'name';
			if ($dir == 'desc')
			{
				$order_by_query .= " ORDER BY items.name DESC";
				$q_arr['dir'] = 'asc';
			}
			else
			{
				$order_by_query .= " ORDER BY items.name ASC";
				$q_arr['dir'] = 'desc';
			}
		}
		$q_arr['sortby'] = 'name';
		$page_view_block .= '<a href="/?' . @http_build_query($q_arr) . '" class="' . (isset($q_arr['dir']) ? $q_arr['dir'] . ' active' : '') . '">Названию</a>';
		if (strlen($order_by_query) == 0)
			$order_by_query .= " ORDER BY items.cost ASC";
		$query .= $order_by_query;

		$res = rows($query);
		$_SESSION['smarty']->assign('count',count($res));

		$res = rows($query);

		$_SESSION['smarty']->assign('items',$res);
		//$_SESSION['smarty']->assign('list',$list);
	}
}

?>