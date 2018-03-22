<?
/**
 * Class to execute MySQL4 queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */

include_once('aDataSource.class.php');

/**
 * Class to execute MySQL4 queries
 */
class mysql40DataSource extends aDataSource {
	var $prep_stat;
	var $result_link;

	/**
	 * Class constructor
	 */		
	function mysql40DataSource() {
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
		$this->connection = mysql_connect($this->host, $this->user, $this->pass) or die('connect');
		mysql_select_db($this->db, $this->connection);
		mysql_query('SET CHARACTER SET '.$this->def_charset);
		mysql_query('Set character_set_connection='.$this->def_charset);
		mysql_query('Set character_set_results='.$this->def_charset);
		mysql_query('Set character_set_client='.$this->def_charset);
	}

	/**
	 * Performs disconnection from MySQL 
	 */		
	function disconnect() {
		mysql_close($this->connection);
	}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($statement) {
		$this->prep_stat = $statement;
	}

	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params = array()) {
		$statement = $this->prep_stat;
		foreach ($params as $param ) {

			$param = str_replace('?','_question_',$param);
			$statement = preg_replace('/\?/','\''.mysql_escape_string(stripslashes($param)).'\'', $statement, 1);
		}
		$statement = str_replace('_question_','?', $statement);
			//echo $statement;	
		$result = mysql_query($statement) or die(mysql_error());

		$this->result_link=$result;
	}

	/**
	 * Returns the result array of the query
	 *
	 * @param integer $limit_low - not compulsory param, index of result array from which output starts
	 * @param integer $limit_high - not compulsory param, quantity of elements of the result array to output
	 * @return array - result associated array
	 */	
	function getRecords($limit_low = 0, $limit_high = 0) {

		if(mysql_num_rows($this->result_link))
		{
			if($limit_low < 0){
				echo ('Error: limit_low less then 0<br>');
				$limit_low=0;
			}
			if($limit_low>=mysql_num_rows($this->result_link)){
				echo ('Error: limit_low bigger then total result<br>');
				$limit_low=0;
			}

			mysql_data_seek($this->result_link,$limit_low);

			$result = array();
			$count = 0;

			while($row = mysql_fetch_assoc($this->result_link)){
				foreach($row as $id => $value){
					$row[$id] = stripslashes($value);
				}


				$result[] = $row;
				if( $limit_high !=0 && $limit_high == ++$count ) break;
			}
			return $result;
			//return ($limit_high==1)?$result[0]:$result;
		}else return 0;
	}
}
?>