<?php
include_once('modules/aModule.class.php');

class banner_epson extends aModule
{
	var $mod_name=null;
	var $disp_tpl=null;
	var $prot=null;

	function execute($arr)
	{
		$query_string = $_SERVER["QUERY_STRING"];
		@parse_str($query_string, $q_arr);
		$banner_epson_type = 'none';
		if (count($q_arr) == 0) // index page
			$banner_epson_type = 'home';
		else if (isset($q_arr['mod_name']) && $q_arr['mod_name'] == 'page' && isset($q_arr['id']))
		{
			if ($q_arr['id'] == '7310')
				$banner_epson_type = 'home';
			if ($q_arr['id'] == '7323')
				$banner_epson_type = 'new_word';
			else if ($q_arr['id'] == '7324')
				$banner_epson_type = 'cartriges';
		}
		$_SESSION['smarty']->assign('banner_epson_type',$banner_epson_type);

		$this->mod_display($this->prot);
	}
}

?>