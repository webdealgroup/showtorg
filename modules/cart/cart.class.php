<?php
include_once('modules/aModule.class.php');
//require_once('lib/phpmailer/class.phpmailer.php');

class cart extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		//echo "<pre>";print_r($arr);echo "<pre>";die();
        //unset($_SESSION['cart']);
        
        
        if (isset($_SESSION['cart']['message'])) unset($_SESSION['cart']['message']);
        
        if (isset($arr['action']) && strlen($arr['action']) != 0)
            $action = $arr['action'];
        if (isset($arr['send_params']['action']) && strlen($arr['send_params']['action']) != 0)
            $action = $arr['send_params']['action'];

		if ($action == 'show_cart_short') {
			$cart_short = $this->getCartShortArray();
			$_SESSION['smarty']->assign('cart_short_count' , $cart_short['count']);
			$_SESSION['smarty']->assign('cart_short_sum', $cart_short['sum']);
		}
        else if ($action == 'show_cart') {
			$this->show_cart($arr); 
        }
        else if ($action == 'add_cart') {
            $cart = $_SESSION['cart']['items'];
            /*
            $exist = false;
            if(!empty($cart)){
                foreach($cart as $k=>$v) {
                    if ($cart[$k]['id'] == $arr['send_params']['id'])
        			{
        				$exist = true;
        				break;
        			}
        		}                
            }
            if ($exist) {
                $_SESSION['cart']['message'] = 'Такой товар уже есть в корзине.<br /><a href="/?mod_name=cart_page">Перейти к оформлению заказа</a>';
            }
            else {*/
                $item = array();
                $item['id'] =  $arr['send_params']['id'];
                $item['qty'] = $arr['send_params']['qty'];
            
                $_SESSION['cart']['items'][] =  $item;
				$cart_short = $this->getCartShortArray();
				$_SESSION['cart']['cart_short_count'] = $cart_short['count'];
				$_SESSION['cart']['cart_short_sum'] = $cart_short['sum'];
                $_SESSION['cart']['message'] = 'Товар добавлен в корзину.<br /><a href="/?mod_name=cart_page">Перейти к оформлению заказа</a>';
            /*}*/

            $json = new Services_JSON();
            echo $json->encode($_SESSION['cart']);
        } else if ($action == 'cart_process') {
            $json = new Services_JSON();

            $account = array();
            $account["real_name"] = $arr['send_params']['name'];
            $account["phone"] = $arr['send_params']['phone'];
            $account["email"] = $arr['send_params']['email'];
            $account["street_address"] = $arr['send_params']['address'];
            
            $account_id = insert("accounts", $account);
            $_SESSION['cart']['account_id'] = $account_id;

            $cart = array();
            $cart = $_SESSION['cart']['items'];

			$result = rows("SELECT * FROM currency WHERE id = 1 ");
			$currency = $result[0]['value'];


			$subjectmsg = "Заказ # " . $account_id;
			$mailmsg = '
<body style="font-family: Arial, sans-serif; font-size: 12px;">
<h1 style="font-family: Trebuchet MS, Arial, sans-serif; font-size: 22px; font-weight: normal;">Заказ № ' . $account_id . '</h1>
			';
			$total_cost = 0;
            foreach ($cart as $k=>$v)
            { 
                $cart_items = array();
                $cart_items["item_id"] = $cart[$k]['id'];
                $cart_items["qty"] = $cart[$k]['qty']; 
                $cart_items["account_id"] = $account_id;

                $_SESSION['cart']['cart_items'][] = insert("cart", $cart_items);
                sleep(1);
				
				$item_cost = $this->getCostById($cart[$k]['id']);
				$item_sum = $item_cost * intval($cart[$k]['qty']);
				$total_cost += $item_sum;
				$item_cost = number_format($item_cost * $currency, 0, '', ' ');
				$item_sum = number_format($item_sum * $currency, 0, '', ' ');
				$mailmsg .= '
<a href="http://x-light.by/?mod_name=item&id=' . $cart[$k]['id'] . '" style="color: #76B013; font-weight: bold;">' . $this->getNameById($cart[$k]['id']) . '</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<strong><font style="color: #C83B00;">' . $item_cost . '</font></strong>&nbsp;бел.руб.&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<strong>' . $cart[$k]['qty'] . '&nbsp;шт.</strong>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Сумма:&nbsp;<strong><font style="color: #C83B00;">' . $item_sum . '</font></strong>&nbsp;бел.руб.<br />';
            }
			$pay = $_SESSION['cart']['pay'];
			$mailmsg .= '';
			$delivery = $_SESSION['cart']['delivery'];
			$cost_delivery_home = $this->getCostDeliveryHome();
			if ($delivery == 'home')
			{
				$total_cost += $cost_delivery_home;
			}
			$cost_delivery_home = number_format($cost_delivery_home * $currency, 0, '', ' ');
			$total_cost = number_format($total_cost * $currency, 0, '', ' ');
			
            /* Конвертируем все значения в кодировку письма (windows-1251)
			while (list($k, $v) = each($arr['send_params']))
			{
				if (substr($k, 0, strlen('cartForm_')) == 'cartForm_')
					$arr['send_params'][$k] = iconv("windows-1251", "UTF-8", $v);
			}
			*/
			$mailmsg .= '

<br /><strong>' . ($pay == 'cash' ? 'Наличный расчет' : 'Безналичный расчет')  . '</strong>

<h2 style="font-family: Trebuchet MS, Arial, sans-serif; font-size: 18px; font-weight: normal;">Итого:&nbsp;&nbsp;&nbsp;<font style="color: #C83B00;">' . $total_cost . '</font>&nbsp;&nbsp;бел.руб.</h2>

<strong>Контактное лицо:</strong>&nbsp;' . $arr['send_params']['cartForm_name'] . '<br />
<strong>Телефон для связи:</strong>&nbsp;' . $arr['send_params']['cartForm_phone'] . '<br />
<strong>E-mail:</strong>&nbsp;' . $arr['send_params']['cartForm_email'] . '<br />
<strong>Адрес доставки:</strong>&nbsp;' . $arr['send_params']['cartForm_address'] . '<br />
<strong>Примечания:</strong>&nbsp;<br />' . nl2br($arr['send_params']['cartForm_comment']) . '<br />
' . ($pay == 'invoice' ? '
<br /><strong>Юридическое название организации:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgname'] . '<br />
<strong>Юридический адрес организации:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgaddress'] . '<br />
<strong>Должность, ФИО руководителя:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgdirectorname'] . '<br />
<strong>Телефон руководителя:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgdirectorphone'] . '<br />
<strong>Телефон бухгалтерии:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgaccountantphone'] . '<br />
<strong>Расчетный счет:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgbankaccount'] . '<br />
<strong>Банк:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgbankname'] . '<br />
<strong>Код банка:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgbankcode'] . '<br />
<strong>Город организации:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgcity'] . '<br />
<strong>УНН:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgunn'] . '<br />
<strong>ОКПО:</strong>&nbsp;' . $arr['send_params']['cartForm_invoice_orgokpo'] . '<br />
' : '') . '
<br />
</body>
';



/*


			$mailer = new PHPMailer();
            $mailer->CharSet="utf-8";
			$mailer->SetFrom('site@lagoda.by', 'Zakaz @ lagoda');
			$mailer->AddAddress('info@refer.by', 'Info @ REFER');
			$mailer->Subject = $subjectmsg;
			$mailer->MsgHTML($mailmsg);
			$mailer->AltBody = str_replace('&nbsp;', ' ', strip_tags($mailmsg));
			$mailer->Send();
			$mailer->ClearAddresses();
			$mailer->ClearAttachments();


            

            $mail_body =  "Название организации: ".$post["Registrant"]."\n";
            $mail_body .= "ФИО руководителя: ".$post["RChief"]."\n";
            $mail_body .= "Юридический адрес --------------- \n";
            $mail_body .= "Индекс: ".$post["JurIndex"]."\n";
            $mail_body .= "Страна: ".$post["JurCountry"]."\n";
            $mail_body .= "Область, район: ".$post["JurDistrict"]."\n";
            $mail_body .= "Населенный пункт: ".$post["JurCity"]."\n";
            $mail_body .= "Улица: ".$post["JurStreet"]."\n";
            $mail_body .= "Дом: ".$post["JurBuilding"]."\n";
            $mail_body .= "№ помещения: ".$post["JurRoom"]."\n"; 
            $mail_body .= "УНП: ".$post["regUNP"]."\n"; 
            $mail_body .= "Почтовый адрес совпадает с юридическим: ".$post["PostalAddressEqualWithjuridical"]."\n";
            $mail_body .= "Почтовый адрес --------------- \n";
            $mail_body .= "Индекс: ".$post["regIndex"]."\n";
            $mail_body .= "Страна: ".$post["regCountry"]."\n";
            $mail_body .= "Область, район: ".$post["regDistrict"]."\n";
            $mail_body .= "Населенный пункт: ".$post["regCity"]."\n";
            $mail_body .= "Улица: ".$post["regStreet"]."\n";
            $mail_body .= "Дом: ".$post["regBuilding"]."\n";
            $mail_body .= "№ помещения: ".$post["regRoom"]."\n";
            $mail_body .= "Контактное лицо: ".$post["RContact"]."\n";
            $mail_body .= "Телефон: ".$post["regPhone"]."\n";
            $mail_body .= "Факс: ".$post["regFax"]."\n";
            $mail_body .= "E-mail: ".$post["regEmail"]."\n";
            $mail_body .= "Расчетный счет: ".$post["regAccount"]."\n";
            $mail_body .= "Наименование банка: ".$post["regBankName"]."\n";
            $mail_body .= "Код банка: ".$post["regBankCode"];
*/
            
            
            include("lib/mailer/class.phpmailer.php");
            include("lib/mailer/class.smtp.php");
            
            
            $mail=new PHPMailer();
            $mail->CharSet="utf-8";
            
            $mail->IsSMTP();
            $mail->SMTPAuth   = true;                  // enable SMTP authentication
            $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
            $mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
            $mail->Port       = 465;                   // set the SMTP port 
            
            $mail->Username   = "mail@1info.by";  // GMAIL username
            $mail->Password   = "q1w2e3asd3";            // GMAIL password
            
            $mail->From       = "mail@1info.by";
            $mail->FromName   = "Cart";
            $mail->Subject    = "New";
            $mail->Body       = nl2br($mailmsg);                      //HTML Body
            $mail->AltBody    = "This is the body when user views in plain text format"; //Text Body
            
            $mail->WordWrap   = 50; // set word wrap
            
            //$mail->AddAddress("mail@1info.by","");
            $mail->AddAddress("artzvuk@mail.ru","");
            
            if(isset($arr['send_params']['cartForm_email'])&&strlen($arr['send_params']['cartForm_email'])>0)
            {
                $mail->AddAddress($arr['send_params']['cartForm_email'],"");//cartForm_email
            }
            
            //$mail->AddReplyTo("info@bountytravel.by","Форма обратной связи");
            //$mail->AddAttachment("/path/to/file.zip");             // attachment
            //$mail->AddAttachment("/path/to/image.jpg", "new.jpg"); // attachment
            
            $mail->IsHTML(true); // send as HTML
            
            //echo "<pre>";print_r($mail);echo "<pre>";//die();
            
            
            if(!$mail->Send()) {
                $message = "Ошибка отправки: " . $mail->ErrorInfo;
               //echo "Mailer Error: " . $mail->ErrorInfo;
            } else {
                $message = "Данные на отправлены на модерацию, по окончании проверки Вам будет выслан ответ на ".$post["regEmail"];
                $_SESSION['smarty']->assign('registration_complete', 1);
            }


            unset($_SESSION['cart']['items']);

			$_SESSION['cart']['cart_short_count'] = '0';
			$_SESSION['cart']['cart_short_sum'] = '0';

            $_SESSION['cart']['message'] = "<strong>Спасибо!</strong> Ваш заказ принят.<br /><br /><h2>Заказ № " . $account_id . "</h2>";
//            $_SESSION['cart']['message'] = "<strong>үᲨ⮡</strong> à衧᫠硯ᩭಮ<br /><br /><h2>Ƞ롧 ٠" . $account_id . "</h2>";
            echo $json->encode($_SESSION['cart']);
        }        
        else if ($action == 'cart_change_value') 
        { 
            $json = new Services_JSON();
            $cart = $_SESSION['cart']['items'];
			$cost_total = 0;
			$sum = 0;
			$cart_short_count = 0;
            foreach($cart as $k=>$v)
            {
				$cost = $this->getCostById($_SESSION['cart']['items'][$k]['id']);
                if ($cart[$k]['id'] == $arr['send_params']['id'])
                {
                    $_SESSION['cart']['items'][$k]['id'] = $cart[$k]['id'];
                    $_SESSION['cart']['items'][$k]['qty'] = intval($arr['send_params']['qty']) > 0 ? $arr['send_params']['qty'] : 1;
					$sum = $cost * intval($_SESSION['cart']['items'][$k]['qty']);
                }
				$cost_total += $cost * intval($_SESSION['cart']['items'][$k]['qty']);
				$cart_short_count += intval($_SESSION['cart']['items'][$k]['qty']);
            }
			$result = rows("SELECT * FROM currency WHERE id = 1 ");
			$currency = $result[0]['value'];
			$cart_short_sum = number_format($cost_total * $currency, 0, '', ' ');
			$delivery = $_SESSION['cart']['delivery'];
			if ($delivery == 'home')
			{
				$cost_total += $this->getCostDeliveryHome();
			}
			$cost_total = number_format($cost_total * $currency, 0, '', ' ');
			$sum = number_format($sum * $currency, 0, '', ' ');
			$_SESSION['cart']['cart_short_count'] = '' . $cart_short_count;
			$_SESSION['cart']['cart_short_sum'] = $cart_short_sum;
			$_SESSION['cart']['cost_total'] = $cost_total;
			$_SESSION['cart']['change_sum'] = $sum;
             echo $json->encode($_SESSION['cart']);
        }
        else if ($action == 'cart_delete_value') 
        {
            $json = new Services_JSON();
            $cart = $_SESSION['cart']['items'];
            unset($_SESSION['cart']['items']);
			$cost_total = 0;
			$cart_short_count = 0;
            foreach($cart as $k=>$v)
            {
                if ($cart[$k]['id'] != $arr['send_params']['id'])
                {
					$_SESSION['cart']['items'][] =  $cart[$k];
					$cost_total += $this->getCostById($cart[$k]['id']) * intval($cart[$k]['qty']);
					$cart_short_count += intval($cart[$k]['qty']);
                }
            }
			$result = rows("SELECT * FROM currency WHERE id = 1 ");
			$currency = $result[0]['value'];
			$cart_short_sum = number_format($cost_total * $currency, 0, '', ' ');
			$_SESSION['cart']['cart_short_count'] = '' . $cart_short_count;
			$_SESSION['cart']['cart_short_sum'] = $cart_short_sum;
			if ($cost_total > 0)
			{
				$delivery = $_SESSION['cart']['delivery'];
				if ($delivery == 'home')
				{
					$cost_total += $this->getCostDeliveryHome();
				}
				$cost_total = number_format($cost_total * $currency, 0, '', ' ');
				$_SESSION['cart']['cost_total'] = $cost_total;
			}
            else
			{
				$_SESSION['cart']['message'] = 'Нет товаров в корзине.<br /><br />Для выбора товаров воспользуйтесь меню.';
			}
            echo $json->encode($_SESSION['cart']);
        }
        else if ($action == 'cart_change_pay') 
        {
            $json = new Services_JSON();
            $cart = $_SESSION['cart']['items'];
			$cost_total = 0;
            foreach($cart as $k=>$v)
            {
				$cost = $this->getCostById($_SESSION['cart']['items'][$k]['id']);
				$cost_total += $cost * intval($_SESSION['cart']['items'][$k]['qty']);
            }
			$pay = $arr['send_params']['pay'];
			$delivery = $_SESSION['cart']['delivery'];
			if ($pay == 'invoice')
				$delivery = 'none';
			if ($delivery == 'home')
			{
				$cost_total += $this->getCostDeliveryHome();
			}
			$result = rows("SELECT * FROM currency WHERE id = 1 ");
			$currency = $result[0]['value'];
			$cost_total = number_format($cost_total * $currency, 0, '', ' ');
			$_SESSION['cart']['pay'] = $pay;
			$_SESSION['cart']['delivery'] = $delivery;
			$_SESSION['cart']['cost_total'] = $cost_total;
             echo $json->encode($_SESSION['cart']);
        }
        else if ($action == 'cart_change_delivery') 
        {
            $json = new Services_JSON();
            $cart = $_SESSION['cart']['items'];
			$cost_total = 0;
            foreach($cart as $k=>$v)
            {
				$cost = $this->getCostById($_SESSION['cart']['items'][$k]['id']);
				$cost_total += $cost * intval($_SESSION['cart']['items'][$k]['qty']);
            }
			$delivery = $arr['send_params']['pay'];
			if ($delivery == 'home')
			{
				$cost_total += $this->getCostDeliveryHome();
			}
			$result = rows("SELECT * FROM currency WHERE id = 1 ");
			$currency = $result[0]['value'];
			$cost_total = number_format($cost_total * $currency, 0, '', ' ');
			$_SESSION['cart']['delivery'] = $delivery;
			$_SESSION['cart']['cost_total'] = $cost_total;
             echo $json->encode($_SESSION['cart']);
        }
        $_SESSION['smarty']->assign('action' , $action);

		$this->mod_display($this->prot);
	}
    
    function show_cart($arr)
    {
        $cart = $_SESSION['cart']['items'];

        $where = '';
        if (count($cart)>0) 
        {
            foreach ($cart as $k=>$v)
            {
                if (strlen($where) > 0)
                    $where .= ', ';
                $where .= $cart[$k]['id'];
            }

            
            $cost_total = 0;
            if (strlen($where) != 0)
            {
                $where = "AND id IN (".$where.") ";
                $query = "SELECT * FROM items WHERE hide <> 0 " . $where;
                $res = rows($query);
            
                $result = rows("SELECT * FROM currency WHERE id = 1 ");
                $currency = $result[0]['value'];
    
                foreach ($res as $rk=>$rv)
                {
                    foreach ($cart as $ck=>$cv)
                    {
                        if ($cv['id'] == $rv['id'])
                        {
                            $res[$rk]['path'] = $this->getImagePath($cv['id']);
                            $res[$rk]['qty'] = $cv['qty'];
                            $res[$rk]['sum'] = $res[$rk]['cost'] * $res[$rk]['qty'];
                            break;
                        }
                    }
                    $cost_total += $res[$rk]['sum'];
                    $res[$rk]['cost'] = number_format($res[$rk]['cost'] * $currency, 0, '', ' ');
                    $res[$rk]['sum'] = number_format($res[$rk]['sum'] * $currency, 0, '', ' ');
                }
            }
            

                $cost_delivery_home = 0;

            
            
            if (!isset($_SESSION['cart']['pay']))
                $_SESSION['cart']['pay'] = 'cash';
            if (!isset($_SESSION['cart']['delivery']))
                $_SESSION['cart']['delivery'] = 'home';
            if ($_SESSION['cart']['delivery'] == 'home')
                $cost_total += $cost_delivery_home;
            $cost_total = number_format($cost_total * $currency, 0, '', ' ');
            $cost_delivery_home = number_format($cost_delivery_home * $currency, 0, '', ' ');
            //echo "<pre>"; print_r($res); echo "</pre>"; //die();
        }	
        
        $_SESSION['smarty']->assign('items' , $res);
		$_SESSION['smarty']->assign('cost_total' , $cost_total);
		$_SESSION['smarty']->assign('currency', $currency);
		$_SESSION['smarty']->assign('pay', $_SESSION['cart']['pay']);
		$_SESSION['smarty']->assign('delivery', $_SESSION['cart']['delivery']);
		$_SESSION['smarty']->assign('cost_delivery_home', $cost_delivery_home);
    }

	function getCostById($id=0)
    {
		$result = rows("SELECT cost FROM items WHERE id = ". $id . " LIMIT 1");
		$i = $result[0]['cost'];
        
        
 		return $i;
   }
	
	function getNameById($id=0)
    {
		$result = rows("SELECT name FROM items WHERE id = ". $id . " LIMIT 1");
		return $result[0]['name'];
    }
	
	function getCostDeliveryHome()
	{
		$result = rows("SELECT cost FROM items WHERE id = 4675 LIMIT 1");
		return $result[0]['cost'];
	}
	
	function getCartShortArray()
	{
		$cart = $_SESSION['cart']['items'];
		$cart_short = array();
		$cart_short_count = 0;
		$cart_short_sum = 0;
        if (count($cart)>0) 
        {
            foreach ($cart as $k=>$v)
            {
                $cart_short_sum += $this->getCostById($cart[$k]['id']) * intval($cart[$k]['qty']);
                $cart_short_count += intval($cart[$k]['qty']);
            }
        }
		$cart_short['count'] = '' . $cart_short_count;
		$result = rows("SELECT * FROM currency WHERE id = 1 ");
		$currency = $result[0]['value'];
		$cart_short_sum = number_format($cart_short_sum * $currency, 0, '', ' ');
		$cart_short['sum'] = $cart_short_sum;
		return $cart_short;
	}
    
    function getImagePath($id)
    {
		//echo "<pre>";print_r($arr);echo "<pre>";die();
		$query="SELECT items.*
		FROM items 
		WHERE items.id = ".$id." ";

        $res=rows($query);

		if ($arr['node']=="") {$arr['node']=$res[0]['node'];}
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
            
        return $path;
    }    
    
}

?>