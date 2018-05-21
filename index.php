<?php
    
    //header("Content-type: text/html;charset=utf-8");
    session_start();
    require_once('site/libs/mysql.php'); // порядок подключения обязателен


    require_once('site/libs/smarty/Smarty.class.php');
    require_once('site/modules/aModule.class.php');

    function getRequest()
    {
        $params = array_merge($_GET, $_POST);
        reset($params);
        while(list($key,$value) = each($params)){
            if (gettype($params[$key]) != "array"){
                if (get_magic_quotes_gpc()){
                    $value = stripslashes(trim($value));
                }
                $params[$key] = $value;
            }
        } 
        return $params; 
    }


    if($_POST['send_msg']=='true')
    { 
        
        //echo "<pre>"; print_r($_POST); echo "</pre>"; //die(); 
        
        $message = array();
        $k = 0;
        foreach($_POST as $n=>$v)
        {
            if ($k>0)
            {
                
                if($n == 'day')
                {
                    $message[$k]['name'] = $n;
                    $message[$k]['txt'] = "1 день";
                }
                elseif($n == 'hour')
                {
                    $message[$k]['name'] = $n;
                    $message[$k]['txt'] = "1 час";
                }
                else
                {
                    $message[$k]['name'] = $n;
                    $message[$k]['txt'] = $v;

                }
            }
            $k++;
        }

        $uploaddir = '/var/www/html/shtampovik.ru/upload/';
        $uploadfile = $uploaddir . basename($_FILES['my_filename']['name']);

        if (move_uploaded_file($_FILES['my_filename']['tmp_name'], $uploadfile)) {
            //echo "Файл корректен и был успешно загружен.\n";
        } else {
            echo "Возможная атака с помощью файловой загрузки!\n";
        }

        $_SESSION['smarty']->assign('uploadfile', '/upload/'.basename($_FILES['my_filename']['name']));
        $_SESSION['smarty']->assign('message', $message);

        require_once "site/libs/SendMailSmtpClass.php"; // подключаем класс
         
        $mailSMTP = new SendMailSmtpClass('mail@webdeal.group', 'HzBpHuLn', 'ssl://smtp.yandex.ru', 'штамповик.рф', 465);
        // $mailSMTP = new SendMailSmtpClass('логин', 'пароль', 'хост', 'имя отправителя');
         
        // заголовок письма
        /**/
        $headers= "MIME-Version: 1.0\r\n";
        $headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
        $headers .= "From: MAIL <mail@webdeal.group>\r\n"; // от кого письмо
        
        $result =  $mailSMTP->send(
                                        '4999732707@mail.ru', 
                                        'Заказ штамповик.рф', 
                                        $_SESSION['smarty']->fetch('mail.tpl'), 
                                        $headers
        ); // отправляем письмо
        // $result =  $mailSMTP->send('Кому письмо', 'Тема письма', 'Текст письма', 'Заголовки письма');
        if($result === true){
            //echo "ok2"; die();
        }else{
            echo "Письмо не отправлено. Ошибка: " . $result;
        }
    }

    class router extends aModule{
        function execute($arr)
        {
            
            if (empty($arr['q']))
            {
                $arr['q']='/index';
            } // если пусто, считаем что это index
            $alias = split("[\/]+", $arr['q']); // разбираем строку
            foreach($alias as $a)   {if($a!='') {$post[] = $a; $aliases[] = $a;}}
            $page = "";
            
            foreach($post as $k=>$v) {if ($k==0) {$page .= $v;}else{$page .= "/".$v;}}

            $dir = $post;                    // $dir[0] - алиас модуля
            $post = array_reverse($post);    // $post[0] - алиас запрашиваемой страницы

            if(isset($arr['mod_name']) && strlen($arr['mod_name']) > 0) // если идет непосредственное обращение к модулю
            {
                $_SESSION['smarty']->assign('post', $arr);
                print ($_SESSION['smarty']->fetch('str:'.$arr['mod_name'])); // передаем управление модулю
                exit (0);           
            }

            $res['get_tree'] = $this->get_data('get_tree', array());  // поучаем меню каталога
            $node = set_menu_cat($post, $res);

                if(isset($dir[0]) && strlen($dir[0])>0)
                {
                    switch ($dir[0]) {

                        case 'page':            print ($_SESSION['smarty']->fetch('str:page'));             exit (0); break; 
                        case 'cart':            print ($_SESSION['smarty']->fetch('str:cart'));             exit (0); break;    
                        case 'index':           print($_SESSION['smarty']->fetch('index.tpl'));             exit (0); break;                                                      

                        default:

                            header("HTTP/1.1 404 Not Found"); 
                            //print ($_SESSION['smarty']->fetch('404.tpl'));
                            
                            break;
                    }
                }


        }
    }

    $rout = new router();
    $rout->execute(getRequest());



function set_menu_cat($post, $res)
{

    $menu = array();
    foreach ($res['get_tree'] as $v) {  // перебираем меню с целю проставить ключи
        $menu[$v['id']] = $v;
        $menu[$v['id']]['child'] = 0;
    }
    foreach ($menu as $v)
    {
        if ($menu[$v['id']]['parent'] != 0) {  // проставляем наличие детей родителям
            $menu[$v['parent']]['child'] = 1;
        }

        if ($menu[$v['id']]['name'] == $post[0]) { // ищем текущую страницу в меню
            $node = $v;
        }
    }

    $_SESSION['menu'] = $menu;
    $_SESSION['smarty']->assign('menu', $menu);

    if (!empty($node)) // если пункт меню обнаружен, получаем его свойства
    {
        $node['path'] = $post['path'];
        $node['post'] = $post;

        $remark = array(); // путь к странице
        $i = $node['id'];
        while ($i != 0)
        {
            $n = $menu[$i];
            $remark[] = $menu[$i];
            $i = $n['parent'];
        }

        $node['breadcrumbs'] = array_reverse($remark);
        //$node['params'] = $arr;

        // получить все id узлов, которые подчинены данному узлу
        $condition = array();
        foreach($menu as $m)
        {
            if($m['parent']==0) continue;
            $i = $m['id'];
            do
            {
                if($i==$node['id'])
                {
                    $condition[] = $m['id'];
                    break;
                }
                $i = $menu[$i]['parent'];
            }while($i!=0);
        }
        $condition[] = $node['id'];
        $node['nodes'] = implode(",", $condition);

    }
    else
    {
        $node = null;
    }


    return $node;
}
?>