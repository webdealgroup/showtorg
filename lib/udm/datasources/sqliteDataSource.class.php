<?php
/**
 * Class to execute SQLite queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */
include_once('aDataSource.class.php');

/**
 * Class to execute SQLite queries
 */
class sqliteDataSource extends aDataSource {
	private $prep_stat = null;
	public $connection = null;
	private $result_link=null;

	/**
	 * Class constructor
	 */		
	function sqliteDataSource(){
		$this->db = DB_NAME;
		$this->host = DB_HOST;
		$this->user = DB_USER;
		$this->pass = DB_PASS;
		$this->def_charset='cp1251';
		$this->connect();
	}

	/**
	* Performs connection to SQLite 
	*/	
	function connect(){
		$this->connection=sqlite_open($this->db);
	}

	/**
	 * Performs disconnection from SQLite 
	 */	
	function disconnect(){
		sqlite_close($this->connection);
	}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($statement){
		$this->prep_stat = $statement;
	}

	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params=array()){
		foreach ($params as $param ) {

			$param = str_replace('?','_question_',$param);
			$this->prep_stat = preg_replace('/\?/','\''.sqlite_escape_string(stripslashes($param)).'\'', $this->prep_stat, 1);
		}
		$this->prep_stat = str_replace('_question_','?', $this->prep_stat);

		$this->result_link=sqlite_query($this->prep_stat, $this->connection);
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
		if($limit_low>=sqlite_num_rows($this->result_link)){
			echo ('Error: limit_low bigger then total result<br>');
			$limit_low=0;
		}

		sqlite_seek($this->result_link,$limit_low);

		$result=array();
		$count=0;
		while($row = sqlite_fetch_array($this->result_link,1)){
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