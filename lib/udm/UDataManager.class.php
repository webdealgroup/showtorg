<?
/**
 * Abstract layer class to execute SQL queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */
class UDataManager {
	/**
	* DataSource object
	*/
	var $dataSource;

	/**
	 * Class constructor, selects from config what db class to use and creates object
	 */	
	function UDataManager() {
		global $DATA_SOURCE;
		include_once('lib/udm/datasources/'.$DATA_SOURCE.'.class.php');// or die('not included');
		$this->dataSource = new $DATA_SOURCE or die('obj not created');
	}

	/**
	* Performs connection to DB 
	*/	
	function connect()
	{
		$this->dataSource->connect();
	}

	/**
	* Performs disconnection from DB 
	*/	
	function disconnect()
	{
		$this->dataSource->disconnect();
	}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($sql) {
		$this->dataSource->prepare($sql);
	}

	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params = array()) {
		$this->dataSource->execute($params);
	}

	/**
	 * Returns the result array of the query
	 *
	 * @param integer $limit_low - not compulsory param, index of result array from which output starts
	 * @param integer $limit_high - not compulsory param, quantity of elements of the result array to output
	 * @return array - result associated array
	 */	
	function getRecords($limit_low=0, $limit_high=0){
		return $this->dataSource->getRecords($limit_low,$limit_high);// or die('??');
	}
}
?>