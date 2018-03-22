<?
/**
 * Abstract parent class to execute SQL queries
 *
 * @author ShamkoKonstantin <ka_shamko@tut.by>
 * @version 0.0.1 Tue Aug 16 20:12:22 EET 2006
 */

/**
 * Abstract parent class to execute SQL queries
 */
class aDataSource {
	var $host;
	var $user;
	var $pass;
	var $name;
	var $def_charset;
	var $connection;


	/**
	* Performs connection to DB 
	*/		
	function connect(){}

	/**
	* Performs disconnection from DB 
	*/			
	function disconnect(){}

	/**
	 * Preparing statement for executing
	 *
	 * @param string $statement - query to prepare
	 */	
	function prepare($statement){}

	/**
	 * Executes prepared statement
	 *
	 * @param array $params - not compulsory param, array of values to insert in prepared statement
	 */	
	function execute($params = array()){}

	/**
	 * Returns the result array of the query
	 *
	 * @param integer $limit_low - not compulsory param, index of result array from which output starts
	 * @param integer $limit_high - not compulsory param, quantity of elements of the result array to output
	 */	
	function getRecords($limit_low=0,$limit_high=0){}
}
?>