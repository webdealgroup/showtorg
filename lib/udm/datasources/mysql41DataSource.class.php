<?
/**
 * Class to execute MySQL4.1/5 queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */
include_once('aDataSource.class.php');

/**
 * Class to execute MySQL4.1/5 queries
 */
class mysql41DataSource extends aDataSource {
	var $prep_stat = null;
	var $connection = null;
	var $ifclose=0;
	
	/**
	 * Class constructor
	 */		
	function mysql41DataSource() {
		$this->db = DB_NAME;
		$this->host = DB_HOST;
		$this->user = DB_USER;
		$this->pass = DB_PASS;
		$this->def_charset='cp1251';
		$this->connect();
	}
	
	/**
	 * Performs connection to MySQL 
	 */		
	function connect() {
		$this->connection = mysqli_connect($this->host, $this->user, $this->pass, $this->db);
		mysqli_query($this->connection,'SET CHARACTER SET '.$this->def_charset) or die('con');
		mysqli_query($this->connection,'Set character_set_connection='.$this->def_charset) or die('con');
		mysqli_query($this->connection,'Set character_set_results='.$this->def_charset) or die('con');
		mysqli_query($this->connection,'Set character_set_client='.$this->def_charset) or die('con');
	}
	
	/**
	 * Performs disconnection from MySQL 
	 */	
	function disconnect() {
		mysqli_close($this->connection);
	}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($statement) {
		$this->prep_stat = mysqli_stmt_init($this->connection);
		mysqli_stmt_prepare($this->prep_stat, $statement);
		//$this->prep_stat = mysqli_stmt_prepare($this->connection,$statement) or die($statement);
		//echo $this->prep_stat;
	}
	
	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params = array()) {

		if($params[0])
		{
			$txtstr='';
			$varstr='';
			for($i=0; $i<count($params); $i++)
			{
				$txtstr.='s';
				if($i<(count($params)-1)) $varstr.="\$"."val[".$i."],";
				else $varstr.="\$"."val[".$i."]";
			}

			eval("mysqli_stmt_bind_param(\$this->prep_stat,'".$txtstr."',".$varstr.");");

			for($i=0; $i<count($params); $i++)
			{
				$val[$i]=$params[$i];
			}
		}

		$this->res=mysqli_stmt_execute($this->prep_stat);
	}
	
	/**
	 * Returns the result array of the query
	 *
	 * @param integer $limit_low - not compulsory param, index of result array from which output starts
	 * @param integer $limit_high - not compulsory param, quantity of elements of the result array to output
	 * @return array - result associated array
	 */	
	function getRecords($limit_low=0,$limit_high=0)
	{
		mysqli_stmt_store_result($this->prep_stat);
		$result = mysqli_stmt_result_metadata($this->prep_stat);
		$field = mysqli_fetch_fields($result);//$result->fetch_fields();

		//$field = mysqli_num_fields($this->res);
		$col=array();
		$str='';
		for($i=0; $i<count($field); $i++)
		{
			if($i<(count($field)-1)) $str.="$"."col[".$i."],";
			else $str.="\$"."col[".$i."]";
		}

		eval("mysqli_stmt_bind_result(\$this->prep_stat,".$str.");");


		if($limit_low < 0){
			echo ('Error: limit_low less then 0<br>');
			$limit_low=0;
		}
		if($limit_low>=mysqli_stmt_num_rows($this->prep_stat)){
			echo ('Error: limit_low bigger then total result<br>');
			$limit_low=0;
		}

		mysqli_stmt_data_seek($this->prep_stat,$limit_low);

		$k=0;
		$arr=array();
		while(mysqli_stmt_fetch($this->prep_stat))
		{
			for($i=0; $i<count($field);$i++)
			{
				$arr[$k][$field[$i]->name]=$col[$i];
			}

			$k++;
			if( $limit_high !=0 && $limit_high == $k ) break;
		}
		return ($limit_high==1)?$arr[0]:$arr;
	}
}
?>