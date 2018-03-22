<?php
include_once('modules/aModule.class.php');

class login extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
        //echo "<pre>"; print_r($arr);echo "</pre>"; die();
        $json = new Services_JSON();
        
        $action = "";
        
        if (isset($arr['send_params']['action']) && strlen($arr['send_params']['action'])!=0) 
        {
            $action = $arr['send_params']['action'];
            if ($arr['action'] == "login_form")  $action = "login_form";
            if ($arr['send_params']['action'] == "registration_process")  
            {
                $response['content'] = "Регистрация прошла успешно. <br />Нажмите кнопку \"Войти\" справа в форме входа.";
                $response['login_email'] = $arr['send_params']['email'];
                $response['login_password'] = $arr['send_params']['password'];
        		$_SESSION['smarty']->assign('arr' , $json->encode($response));
                $action = $arr['send_params']['action'];
            }
            if ($arr['send_params']['action'] == "recovery_process")  
            {
                $response['content'] = "Пароль выслан на электронную почту.";
        		$_SESSION['smarty']->assign('arr' , $json->encode($response));
                $action = $arr['send_params']['action'];
            }
            if ($arr['send_params']['action'] == "login_process")  
            {
                //$response['content'] = "Пароль выслан на электронную почту.";
        		$_SESSION['smarty']->assign('arr' , $json->encode($response));
                $action = $arr['send_params']['action'];
            }

        }
        else
        {
            $action = $arr['action'];
        }

        //echo "<pre>"; print_r($arr); echo "</pre>"; //die();

        $_SESSION['smarty']->assign('action', $action);

        $arr['action'] = "";
        $arr['send_params']['action'] = "";
		$this->mod_display($this->prot);
	}

}

?>