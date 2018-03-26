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

		$query="SELECT * FROM items WHERE  active = 1 AND node IN (".$where.") ";

		$this->show_items($arr, $remark, $path, $currency, $query); 

        $_SESSION['smarty']->assign('tree',$tree);
        $_SESSION['smarty']->assign('node',$node);

		$this->mod_display($this->prot);
	}

	function show_items($arr, $remark, $path, $currency, $query)
	{
        $s=$arr['send_params']['s'];
        $gn=$arr['send_params']['gn'];
        $all=$arr['send_params']['all'];


        $res = rows($query);


        $_SESSION['smarty']->assign('count_list',count($res));

//page
        $num_disp=5;
        $group_num=0;
        $page_start=0;
        $page_long=16;

        if (isset($s) && strlen($s)>0)
        {
            $page_start=$s;
            $group_num=$gn;
        }

        $n = count($res);

//=======================
        $list = "&nbsp;";
        $num = $n;
        $num = $num / $page_long;
        $page=$group_num*$num_disp;

        $root_url="index.php?page=".$arr['send_params']['page'];

        while($page<$num)
        {
            $list .="|&nbsp;<a href='".$root_url."&s=".$page*$page_long."&gn=".$group_num ;
            $list .="' target='_self'>";

            if ($page==($page_start / $page_long) && $all!=1)
            { $list .="<font color=\"#FF0000\">";}

            $list .=$page+1;

            if ($page==($page_start / $page_long) && $all!=1)
            { $list .="</font>";}
            $list .="</a>&nbsp;";
            $page++;

            if (is_int($page/(($group_num+1)*$num_disp)))
            {
                break;
            }
        }

        $list .="";

        if ($s > 0)
        {   // (120/8-1)*8 < (15*8*1)   112<120
            if (($s/$page_long-1)*$page_long < ($num_disp*$page_long*$group_num)) {$gr2=$group_num-1;}else{$gr2=$group_num;}
            $list .="&nbsp;<a href='".$root_url."&s=".($s/$page_long-1)*$page_long."&gn=".$gr2 ;
            $list .="' target='_self'><<</a>&nbsp;";
        }

        if (($s/$page_long+1)*$page_long < $n && $all!=1)
        {      // (112/8+1)*8 > (8*15+15*8*0)-1    120 > 119
            if (($s/$page_long+1)*$page_long > ($page_long*$num_disp+$num_disp*$page_long*$group_num)-1) {$gr2=$group_num+1;}else{$gr2=$group_num;}
            $list .="&nbsp;<a href='".$root_url."&s=".($s/$page_long+1)*$page_long."&gn=".$gr2 ;
            $list .="' target='_self'>>> Далее ..</a>&nbsp;";
        }

        if ($group_num > 0)
        {
            $list .="&nbsp;<a href='".$root_url."&s=".($page_long*$num_disp*($group_num - 1))."&gn=".($group_num - 1) ;
            $list .="' target='_self'> ".$num_disp." <<</a>&nbsp;";
        }

        if ($n > ($page_long*$num_disp+1+$num_disp*$page_long*$group_num))
        {
            $list .="&nbsp;<a href='".$root_url."&s=".($page_long*$num_disp*($group_num + 1))."&gn=".($group_num + 1) ;
            $list .="' target='_self'>>> ".$num_disp." </a>&nbsp;";
        }
        if ($n > $page_long)
        {
            if ($all!=1) {$list .="&nbsp; <a href='".$root_url."&all=1'> Показать все </a>&nbsp;";}
            else {$list .="&nbsp; <a href='".$root_url."&all=1'> <font color='#FF0000'>Показать все</font> </a>&nbsp;";}
        }


//============

        if ($all!=1) $query.=" LIMIT ".$page_start.", ".$page_long;

        $res = rows($query);

        $_SESSION['smarty']->assign('items',$res);
        $_SESSION['smarty']->assign('list',$list);


    }
}

?>