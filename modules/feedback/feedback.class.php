<?php
include_once('modules/aModule.class.php');
require_once('lib/phpmailer/class.phpmailer.php');

class feedback extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        if (isset($arr['action']) && strlen($arr['action']) != 0)
            $action = $arr['action'];
        if (isset($arr['send_params']['action']) && strlen($arr['send_params']['action']) != 0) 
            $action = $arr['send_params']['action'];

		if ($action == 'send_message')
        {
			$subjectmsg = "Сообщение с сайта";
			$mailmsg = '
<body style="font-family: Arial, sans-serif; font-size: 12px;">
<h1 style="font-family: Trebuchet MS, Arial, sans-serif; font-size: 22px; font-weight: normal;">Сообщение с сайта</h1>
			';
			// Конвертируем все значения в кодировку письма (windows-1251)
			while (list($k, $v) = each($arr['send_params']))
			{
				if (substr($k, 0, strlen('feedbackForm_')) == 'feedbackForm_')
					$arr['send_params'][$k] = iconv("UTF-8", "windows-1251", $v);
			}
			//
			$mailmsg .= '

<strong>Контактное лицо:</strong>&nbsp;' . $arr['send_params']['feedbackForm_name'] . '<br />
<strong>E-mail или телефон:</strong>&nbsp;' . $arr['send_params']['feedbackForm_phone_email'] . '<br />
<strong>Сообщение:</strong>&nbsp;<br />' . nl2br($arr['send_params']['feedbackForm_message']) . '<br />
<br />
</body>
';
			$mailer = new PHPMailer();
			$mailer->SetFrom('internet@allvision.by', 'Сообщение @ AllVision');
			$mailer->AddAddress('info@allvision.by', 'Инфо @ AllVision');
			$mailer->Subject = $subjectmsg;
			$mailer->MsgHTML($mailmsg);
			$mailer->AltBody = str_replace('&nbsp;', ' ', strip_tags($mailmsg));
			$mailer->Send();
			$mailer->ClearAddresses();
			$mailer->ClearAttachments();

			$json = new Services_JSON();
			$feedback = array();
            $feedback['message'] = "<strong>Спасибо за проявленный интерес!</strong><br />Ваш сообщение отправлено и будет рассмотрено в ближайшее время.<br />";
            echo $json->encode($feedback);
        }
		$_SESSION['smarty']->assign('action' , $action);

		$this->mod_display($this->prot);
	}
}

?>