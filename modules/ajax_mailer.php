<?php
require_once('../lib/phpmailer/class.phpmailer.php');
$address = trim($_GET["address"]);
$org = trim($_GET["org"]);
$name = trim($_GET["name"]);
$phone = trim($_GET["phone"]);
$mail = trim($_GET["mail"]);
$msg = $address."\r\n<br />";
$msg .= $org."\r\n<br />";
$msg .= $name."\r\n<br />";
$msg .= $phone."\r\n<br />";
$msg .= $mail;
$msg = mb_convert_encoding($msg, 'Windows-1251');

//�������� �����
$mailer = new PHPMailer();
$mailer->SetFrom('site@lagoda.by', '����� @ ������');
$mailer->AddAddress('lagodaby@gmail.com', '���� @ REFER');
$mailer->Subject = "�������� �������";
$mailer->MsgHTML($msg);
$mailer->AltBody = str_replace('&nbsp;', ' ', strip_tags($mailmsg));

if($mailer->Send()) {
    echo "ok";
}
$mailer->ClearAddresses();
$mailer->ClearAttachments();
?>