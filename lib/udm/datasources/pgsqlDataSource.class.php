<?php
/**
 * Class to execute PostgreSQL queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */
include_once('aDataSource.class.php');

/**
 * Class to execute PostgreSQL queries
 */
class pgsqlDataSource extends aDataSource {
	var $prep_stat;
	var $connection;
	var $result_link;

	/**
	 * Class constructor
	 */		
	function pgsqlDataSource() {
		$this->db = DB_NAME;
		$this->host = DB_HOST;
		$this->user = DB_USER;
		$this->port = PG_PORT;
		$this->pass = DB_PASS;
		if($this->pass=='') $this->pass='1';//!!
		$this->def_charset='cp1251';
		$this->connection_string="host=".$this->host." port=".$this->port." dbname=".$this->db." user=".$this->user." password=".$this->pass;
		$this->connect();
	}

	/**
	* Performs connection to PostgreSQL 
	*/	
	function connect(){
		$this->connection=pg_connect($this->connection_string) or die('Cant connect to POstgreSQL');
	}
	
	/**
	 * Performs disconnection from PostgreSQL 
	 */	
	function disconnect(){
		pg_close($this->connection);
	}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($statement){
		$this->unique_name='name_'.time();
		$cnt=substr_count($statement,'?');
		for($i=1; $i<=$cnt;$i++)
		{
			$rep="\$".$i." ";
			$statement=substr_replace( $statement, $rep, strpos($statement,'?'),(strlen($rep)-1));
		}
		$this->prep_stat = pg_prepare($this->connection,$this->unique_name,$statement) or die('123');
	}
	
	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params=array()){
		for($i=0; $i<count($params); $i++)
		$params[$i]=addslashes($params[$i]);

		$this->result_link=pg_execute($this->connection,$this->unique_name,$params);		
	}

   /**
	 * Returns the result array of the query
	 *
	 * @param integer $limit_low - not compulsory param, index of result array from which output starts
	 * @param integer $limit_high - not compulsory param, quantity of elements of the result array to output
	 * @return array - result associated array
	 */	
	function getRecords($limit_low=0, $limit_high=0){

		if($limit_low < 0){
			echo ('Error: limit_low less then 0<br>');
			$limit_low=0;
		}
		if($limit_low>=pg_num_rows($this->result_link)){
			echo ('Error: limit_low bigger then total result<br>');
			$limit_low=0;
		}

		pg_result_seek($this->result_link,$limit_low);
		
		$result=array();
		$count=0;
		while($row = pg_fetch_assoc($this->result_link)){
			foreach($row as $id => $value){
				$row[$id] = stripslashes($value);
			}

			$result[] = $row;
			if( $limit_high !=0 && $limit_high == ++$count ) break;
		}

		return ($limit_high==1)?$result[0]:$result;

	}
}

?>

