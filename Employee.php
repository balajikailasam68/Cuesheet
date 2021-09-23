
<?php
require('config.php');
	$refID;
class Employee extends Dbconfig {	

    protected $hostName;
    protected $userName;
    protected $password;
	protected $dbName;
	private $empTable = 'cuesheet';
	private $empTable2 = 'cuesheet2';
	//private $empTable = 'employee';
	private $dbConnect = false;
    public function __construct(){
        if(!$this->dbConnect){ 		
			$database = new dbConfig();            
            $this -> hostName = $database -> serverName;
            $this -> userName = $database -> userName;
            $this -> password = $database ->password;
			$this -> dbName = $database -> dbName;			
            $conn = new mysqli($this->hostName, $this->userName, $this->password, $this->dbName);
	//file_put_contents("sgkb1.txt", print_r("$dbName", true), FILE_APPEND);
      // file_put_contents('F:/Hyd/my_working_file.txt', "Balaji");
            if($conn->connect_error){
                die("Error failed to connect to MySQL: " . $conn->connect_error);
            } else{
                $this->dbConnect = $conn;
            }
        }
    }
	private function getData($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error());
		}
		$data= array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$data[]=$row;            
		}
		return $data;
	}
	private function getNumRows($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error());
		}
		$numRows = mysqli_num_rows($result);
		return $numRows;
	}   	
	public function employeeList(){		
		//$sqlQuery = "SELECT * FROM ".$this->empTable." ";
		$myd=$_POST["date"];
		$datetime = new DateTime($myd);
		$datetime->modify('+1 day');
		$nextdate=$datetime->format('Y-m-d ');
		$MyCutOffTime="06:00:00";
		 file_put_contents('F:/Hyd/mycue.txt', $_POST["selectedcuesheet"]);
		 if (($_POST["selectedcuesheet"]=="2200to0600")){
			 //$sqlQuery = "	SELECT * FROM ".$this->empTable." WHERE (myDate = '".$_POST["date"]."' || myDate ='".$nextdate."' ) &&   (CueID = '".$_POST["selectedcuesheet"]."') ";
 $sqlQuery = "  SELECT * FROM ".$this->empTable." WHERE (((myDate = '".$_POST["date"]."' )|| ( myDate ='".$nextdate."'  && INPoint < '".$MyCutOffTime."' ))  && (CueID = '".$_POST["selectedcuesheet"]."') )  ";
		 }
			 else {
			 $sqlQuery = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'   &&   CueID = '".$_POST["selectedcuesheet"]."' ";
			 }
	        file_put_contents('F:/Hyd/tomdate.txt', $sqlQuery);

		if(!empty($_POST["search"]["value"])){
			$sqlQuery .= '&& (pgmID LIKE "%'.$_POST["search"]["value"].'%" ';
			//$sqlQuery .= ' OR CueID LIKE "%'.$_POST["search"]["value"].'%" ';			
			$sqlQuery .= ' OR UserID LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Programname LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR filename LIKE "%'.$_POST["search"]["value"].'%" ';
			//$sqlQuery .= ' OR myDate LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR INpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR OUTpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			
			$sqlQuery .= ' OR Duration LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Remarks LIKE "%'.$_POST["search"]["value"].'%" ';
            $sqlQuery .= ' OR slot LIKE "%'.$_POST["search"]["value"].'%") ';			
		}
		if(!empty($_POST["order"])){
			$sqlQuery .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		} else {
			$sqlQuery .= 'ORDER BY myDate, fromreading ';
		}
		  file_put_contents('F:/Hyd/search.txt', $sqlQuery);
		if($_POST["length"] != -1){
			$sqlQuery .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
file_put_contents('D:/Hyd/search.txt', $sqlQuery);		
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		
		//$sqlQuery1 = "SELECT * FROM ".$this->empTable." ";
		 if (($_POST["selectedcuesheet"]=="2200to0600")){
			 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE (myDate = '".$_POST["date"]."' || myDate ='".$nextdate."' ) &&   (CueID = '".$_POST["selectedcuesheet"]."') ";
 $sqlQuery1 = "  SELECT * FROM ".$this->empTable." WHERE (((myDate = '".$_POST["date"]."' )|| ( myDate ='".$nextdate."'  && INPoint < '".$MyCutOffTime."' ))  && (CueID = '".$_POST["selectedcuesheet"]."') )  ";
		 }
			 else {
			 $sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'   &&   CueID = '".$_POST["selectedcuesheet"]."' ";
			 }
			 	        file_put_contents('F:/Hyd/tomdate1.txt', $sqlQuery);

					 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'   &&   CueID = '".$_POST["selectedcuesheet"]."' ";

			 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'";

		$result1 = mysqli_query($this->dbConnect, $sqlQuery1);
		$numRows = mysqli_num_rows($result1);
		$count=1;
		$employeeData = array();	
		while( $employee = mysqli_fetch_assoc($result) ) {		
			$empRows = array();			
			$empRows[] = $count;
			//$empRows[] = ucfirst($employee['CueID']);
			$empRows[] = $employee['UserID'];		
			$empRows[] = $employee['Programname']."\n <b> IN:</b>".$employee['INpoint']."\n <b>OUT</b>:".$employee['OUTpoint'];	
			$empRows[] = $employee['filename'];	
			//$empRows[] = $employee['myDate'];
			$empRows[] = $employee['fromreading'];		
			$empRows[] = $employee['toreading'];		
			$empRows[] = $employee['Duration'];		
			$empRows[] = $employee['Remarks'];	
            $empRows[] = $employee['slot'];			
			$empRows[] = '<button type="button" name="update" id="'.$employee["pgmID"].'" class="btn btn-warning btn-xs update">Update</button>';
			$empRows[] = '<button type="button" name="delete" id="'.$employee["pgmID"].'" class="btn btn-danger btn-xs delete" >Delete</button>';
			$employeeData[] = $empRows;
			$count++;
		}
		$output = array(
			"draw"				=>	intval($_POST["draw"]),
			"recordsTotal"  	=>  $numRows,
			"recordsFiltered" 	=> 	$numRows,
			"data"    			=> 	$employeeData
		);
		echo json_encode($output);
	}
	
	public function listmedia(){		
		//$sqlQuery = "  SELECT * FROM ".$this->empTable2;
		$sqlQuery = "  SELECT * FROM ".$this->empTable2." ORDER BY myDate Desc" ;
	        file_put_contents('F:/Hyd/listmedia1.txt', $sqlQuery);

		if(!empty($_POST["search"]["value"])){
			$sqlQuery .= '&& (pgmID LIKE "%'.$_POST["search"]["value"].'%" ';
			//$sqlQuery .= ' OR CueID LIKE "%'.$_POST["search"]["value"].'%" ';			
			//$sqlQuery .= ' OR UserID LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Programname LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR filename LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR myDate LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR INpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR OUTpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			
			$sqlQuery .= ' OR Duration LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Remarks LIKE "%'.$_POST["search"]["value"].'%") ';
            //$sqlQuery .= ' OR slot LIKE "%'.$_POST["search"]["value"].'%") ';			
		}
		/* if(!empty($_POST["order"])){
			$sqlQuery .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		} else {
			$sqlQuery .= 'ORDER BY myDate, fromreading ';
		} 
		  file_put_contents('F:/Hyd/search.txt', $sqlQuery);
		if($_POST["length"] != -1){
			$sqlQuery .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}*/
file_put_contents('D:/Hyd/listmedia2.txt', $sqlQuery);		
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		
		//$sqlQuery1 = "SELECT * FROM ".$this->empTable." ";
		
			 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE (myDate = '".$_POST["date"]."' || myDate ='".$nextdate."' ) &&   (CueID = '".$_POST["selectedcuesheet"]."') ";
 $sqlQuery1 = "  SELECT * FROM ".$this->empTable2;
		
			 	        file_put_contents('F:/Hyd/listmedia3.txt', $sqlQuery);

					 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'   &&   CueID = '".$_POST["selectedcuesheet"]."' ";

			 //$sqlQuery1 = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'";

		$result1 = mysqli_query($this->dbConnect, $sqlQuery1);
		$numRows = mysqli_num_rows($result1);
		$count=1;
		$employeeDatam = array();	
		//id='pgmID_<?php echo $id; 
		while( $employee = mysqli_fetch_assoc($result) ) {		
			$empRows = array();			
			$empRows[] = $count;
			//$empRows[] = ucfirst($employee['CueID']);
			//$empRows[] = 'class="bg-warning"'.$employee['Programname']."'from:'".$employee['INpoint']."'to:'".$employee['to'];
			//$empRows[] = 'id="pgmID_"'.$employee['pgmID'].''.$employee['pgmID'];
			//$empRows[] = '<span class="pgmtoplay" edit id="pgmID_'.$employee['pgmID'].'">'.$employee['pgmID'].'</span>';
			$empRows[] = $employee['pgmID'];
			//$empRows[] = $employee['UserID'];	
			$empRows[] = $employee['myDate'];
			$empRows[] = $employee['INpoint'];		
			$empRows[] = $employee['OUTpoint'];	
			$empRows[] = $employee['Programname'];	
			$empRows[] = $employee['Duration'];	
			$empRows[] = $employee['filename'];
			//$empRows[] = $employee['path2'];
			$empRows[] = $employee['Remarks'];	
            $empRows[] = $employee['slot'];			
			//$empRows[] = '<button type="button" name="update" id="'.$employee["pgmID"].'" class="btn btn-warning btn-xs update">Update</button>';
			//$empRows[] = '<button type="button" name="delete" id="'.$employee["pgmID"].'" class="btn btn-danger btn-xs delete" >Delete</button>';
			$employeeDatam[] = $empRows;
			$count++;
		}
		$output = array(
			"draw"				=>	intval($_POST["draw"]),
			"recordsTotal"  	=>  $numRows,
			"recordsFiltered" 	=> 	$numRows,
			"data"    			=> 	$employeeDatam
		);
		echo json_encode($output);
	}
	
	 public function loademployeeList(){	
	 $sqlQuery = "	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'";
	        file_put_contents('F:/Hyd/loadmedia.txt', $sqlQuery);

		if(!empty($_POST["search"]["value"])){
			$sqlQuery .= '&& (pgmID LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR CueID LIKE "%'.$_POST["search"]["value"].'%" ';			
			$sqlQuery .= ' OR UserID LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Programname LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR myDate LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR INpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			$sqlQuery .= ' OR OUTpoint LIKE "%'.$_POST["search"]["value"].'%" ';	
			
			$sqlQuery .= ' OR Duration LIKE "%'.$_POST["search"]["value"].'%" ';
			$sqlQuery .= ' OR Remarks LIKE "%'.$_POST["search"]["value"].'%") ';	
		}
		if(!empty($_POST["order"])){
			$sqlQuery .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
								file_put_contents('F:/Hyd/loadmediaif.txt', $sqlQuery);

		} else {
			$sqlQuery .= 'ORDER BY INpoint ASC ';
			file_put_contents('F:/Hyd/loadmediaelse.txt', $sqlQuery);
		}
		if($_POST["length"] != -1){
			$sqlQuery .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}	
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		
		$sqlQuery1 ="	SELECT * FROM ".$this->empTable." WHERE myDate = '".$_POST["date"]."'";
			        file_put_contents('F:/Hyd/loadlist.txt', $sqlQuery1);

		$result1 = mysqli_query($this->dbConnect, $sqlQuery1);
		$numRows = mysqli_num_rows($result1);
		$count=1;
		$employeeData = array();	
		while( $employee = mysqli_fetch_assoc($result) ) {		
			$empRows = array();			
			$empRows[] = $count;
			$empRows[] = ucfirst($employee['CueID']);
			$empRows[] = $employee['pgmID'];
            $empRows[] = $employee['UserID'];				
			$empRows[] = 'class="bg-warning"'.$employee['Programname']."'from:'".$employee['INpoint']."'to:'".$employee['to'];	
			$empRows[] = $employee['myDate'];
			$empRows[] = $employee['INpoint'];		
			$empRows[] = $employee['OUTpoint'];		
			$empRows[] = $employee['Duration'];		
			$empRows[] = $employee['Remarks'];		
			$empRows[] = '<button type="button" name="update" id="'.$employee["pgmID"].'" class="btn btn-warning btn-xs update">Update</button>';
			$empRows[] = '<button type="button" name="delete" id="'.$employee["pgmID"].'" class="btn btn-danger btn-xs delete" >Delete</button>';
			$empRows[] = '<button type="button" name="slot" id="'.$employee["slot"].'" class="btn btn-danger btn-xs slot hidden" >slot</button>';
			$employeeData[] = $empRows;
			$count++;
		}
		$output = array(
			"draw"				=>	intval($_POST["draw"]),
			"recordsTotal"  	=>  $numRows,
			"recordsFiltered" 	=> 	$numRows,
			"data"    			=> 	$employeeData
		);
		echo json_encode($output);
	} 
	
	/* public function getEmployee(){
		if($_POST["empId"]) {
			$sqlQuery = "
				SELECT * FROM ".$this->empTable." 
				WHERE id = '".$_POST["empId"]."'";
			$result = mysqli_query($this->dbConnect, $sqlQuery);	
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			echo json_encode($row);
		}
	} */
	public function getEmployee(){
	$refID=$_POST["empId"];
		if($_POST["empId"]) {
			$sqlQuery = "
				SELECT * FROM ".$this->empTable." 
				WHERE pgmID = '".$_POST["empId"]."'";
								
		file_put_contents('F:/Hyd/my_working_file.txt', $sqlQuery);
	
			$result = mysqli_query($this->dbConnect, $sqlQuery);	
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			echo json_encode($row);
		}
	}
	public function updateInOut(){
	if($_POST['empId']) {	
			$updateQuery = "UPDATE ".$this->empTable2." 
			SET   INpoint = '".$_POST["IN"]."', OUTpoint = '".$_POST["OUT"]."', Duration = '".$_POST["Duration"]."'
			WHERE pgmID ='".$_POST['empId']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('F:/Hyd/inoutupdate.txt', $updateQuery );

		}
	}
	public function getNewsvalues(){
	//$refID=$_POST["newsname"];
		if($_POST["newsname"]) {
			$sqlQuery = "
				SELECT * FROM news 
				WHERE pgmID = '".$_POST["newsname"]."'";
								
		file_put_contents('F:/Hyd/getnewsvalue.txt', $sqlQuery);
	
			$result = mysqli_query($this->dbConnect, $sqlQuery);	
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			echo json_encode($row);
		}
	}
	public function getMontagevalues(){
	//$refID=$_POST["newsname"];
		if($_POST["newsname"]) {
			$sqlQuery = "
				SELECT * FROM montages 
				WHERE pgmID = '".$_POST["newsname"]."'";
								
		file_put_contents('F:/Hyd/getnewsvalue.txt', $sqlQuery);
	
			$result = mysqli_query($this->dbConnect, $sqlQuery);	
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			echo json_encode($row);
		}
	}
	
	/* public function updateEmployee(){
	//file_put_contents("dragdrop.txt", print_r(PHP_EOL . $_POST['empId']  , true), FILE_APPEND);
	
		if($_POST['empId']) {	
			$updateQuery = "UPDATE ".$this->empTable." 
			SET name = '".$_POST["empName"]."', age = '".$_POST["empAge"]."', skills = '".$_POST["empSkills"]."', address = '".$_POST["address"]."' , designation = '".$_POST["designation"]."'
			WHERE id ='".$_POST["empId"]."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					//file_put_contents('F:/Hyd/my_working_file.txt', "kbempID");

		}
		//file_put_contents('F:/Hyd/my_working_file.txt', "empID");
	} */
	
	public function updateEmployee(){
					file_put_contents('F:/Hyd/updateid.txt', $_POST['empId'],FILE_APPEND );
	
		if($_POST['empId']) {	
			$updateQuery = "UPDATE ".$this->empTable." 
			SET Programname = '".$_POST["programname"]."',filename = '".$_POST["filename"]."', UserID = '".$_POST["UserID"]."', Remarks = '".$_POST["Remarks"]."', myDate = '".$_POST["myDate"]."' , INpoint = '".$_POST["IN"]."', OUTpoint = '".$_POST["OUT"]."', fromreading = '".$_POST["fromreading"]."', toreading = '".$_POST["toreading"]."', Duration = '".$_POST["Duration"]."'
			WHERE pgmID ='".$_POST['empId']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('F:/Hyd/updateend.txt', $updateQuery,FILE_APPEND );

		}
		//file_put_contents('F:/Hyd/my_working_file.txt', $_POST['empId']."////".$updateQuery);
	}
	public function updateoverrun(){
					file_put_contents('D:/Hyd/overrun.txt', $_POST['empId'] );
	
		if($_POST['empId']) {	
			$updateQuery = "UPDATE ".$this->empTable." 
			SET  Remarks = '".$_POST["Remarks"]."' 
			WHERE pgmID ='".$_POST['empId']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('D:/Hyd/overrun.txt', $updateQuery );

		}
		//file_put_contents('F:/Hyd/my_working_file.txt', $_POST['empId']."////".$updateQuery);
	}
	
	public function addEmployee(){

	$mydate=  date("Y/m/d");
	$date = date_create();
    $mydateid= date_format($date, 'U') ;
	$CueID=$_POST["cueID"];
	//$pgmID=$mydateid."-".$_POST["programname"];
	$pgmID=$mydateid."-".trim($_POST["programname"]);
	//$insertQuery = "INSERT INTO ".$this->empTable." (name, age, skills, address, designation) 
	//VALUES ('".$_POST["empName"]."', '".$_POST["empAge"]."', '".$_POST["empSkills"]."', '".$_POST["address"]."', '".$_POST["designation"]."')";
		$insertQuery = "INSERT INTO ".$this->empTable." (pgmID, cueID, UserID, Programname,filename, myDate,INpoint, OUTpoint,Duration,Remarks,fromreading,toreading) 
			VALUES ('".$pgmID."', '".$CueID."', '".$_POST["UserID"]."', '".$_POST["programname"]."','".$_POST["filename"]."', '".$_POST["myDate"]."', '".$_POST["IN"]."', '".$_POST["OUT"]."', '".$_POST["Duration"]."', '".$_POST["Remarks"]."', '".$_POST["fromreading"]."', '".$_POST["toreading"]."')";
		$isUpdated = mysqli_query($this->dbConnect, $insertQuery);
				file_put_contents('F:/Hyd/insertquery.txt', $insertQuery);

	}
	public function addNewsrow(){
file_put_contents('F:/Hyd/addnews.txt', $_POST["programname"]);
 $mydate=  date("Y/m/d");
	$date = date_create();
    $mydateid= date_format($date, 'U') ;
	$CueID=$_POST["cueID"];
	//$pgmID=$mydateid."-".$_POST["programname"];
	$pgmID=$mydateid."-".trim($_POST["programname"]);
	//$insertQuery = "INSERT INTO ".$this->empTable." (name, age, skills, address, designation) 
	//VALUES ('".$_POST["empName"]."', '".$_POST["empAge"]."', '".$_POST["empSkills"]."', '".$_POST["address"]."', '".$_POST["designation"]."')";
		$insertQuery = "INSERT INTO ".$this->empTable." (pgmID, cueID, UserID, Programname,filename, myDate,INpoint, OUTpoint,Duration,Remarks,slot,fromreading,toreading) 
			VALUES ('".$pgmID."', '".$CueID."', '".$_POST["UserID"]."', '".$_POST["programname"]."','".$_POST["filename"]."', '".$_POST["myDate"]."', '".$_POST["IN"]."', '".$_POST["OUT"]."', '".$_POST["Duration"]."', '".$_POST["Remarks"]."', '".$_POST["slot"]."', '".$_POST["fromreading"]."', '".$_POST["toreading"]."')";
		$isUpdated = mysqli_query($this->dbConnect, $insertQuery);
				file_put_contents('D:/Hyd/addnews.txt', $insertQuery);
 
	}
	public function addMontagerow(){
file_put_contents('F:/Hyd/addmon.txt', $_POST["programname"]);
 $mydate=  date("Y/m/d");
	$date = date_create();
    $mydateid= date_format($date, 'U') ;
	$CueID=$_POST["cueID"];
	//$pgmID=$mydateid."-".$_POST["programname"];
	$pgmID=$mydateid."-".trim($_POST["programname"]);
	if ($pgmID!="Add"){
	//$insertQuery = "INSERT INTO ".$this->empTable." (name, age, skills, address, designation) 
	//VALUES ('".$_POST["empName"]."', '".$_POST["empAge"]."', '".$_POST["empSkills"]."', '".$_POST["address"]."', '".$_POST["designation"]."')";
		$insertQuery = "INSERT INTO ".$this->empTable." (pgmID, cueID, UserID, Programname,filename, myDate,INpoint, OUTpoint,Duration,Remarks,fromreading,toreading) 
			VALUES ('".$pgmID."', '".$CueID."', '".$_POST["UserID"]."', '".$_POST["programname"]."','".$_POST["filename"]."', '".$_POST["myDate"]."', '".$_POST["IN"]."', '".$_POST["OUT"]."', '".$_POST["Duration"]."', '".$_POST["Remarks"]."', '".$_POST["fromreading"]."', '".$_POST["toreading"]."')";
		$isUpdated = mysqli_query($this->dbConnect, $insertQuery);
				file_put_contents('F:/Hyd/addmon.txt', $insertQuery);
 
	}
	}
	public function addNews(){
		
	$mydate=  date("Y/m/d");
	$date = date_create();
    $mydateid= date_format($date, 'U') ;
	$CueID=$_POST["cueID"];
	//$pgmID=$mydateid."-".$_POST["programname"];
	$pgmID=$mydateid."-".trim($_POST["programname"]);
	//$insertQuery = "INSERT INTO ".$this->empTable." (name, age, skills, address, designation) 
	//VALUES ('".$_POST["empName"]."', '".$_POST["empAge"]."', '".$_POST["empSkills"]."', '".$_POST["address"]."', '".$_POST["designation"]."')";
		$insertQuery = "INSERT INTO ".$this->empTable." (pgmID, cueID, UserID, Programname,filename, myDate,INpoint, OUTpoint,Duration,Remarks,fromreading,toreading) 
			VALUES ('".$pgmID."', '".$CueID."', '".$_POST["UserID"]."', '".$_POST["programname"]."','".$_POST["filename"]."', '".$_POST["myDate"]."', '".$_POST["IN"]."', '".$_POST["OUT"]."', '".$_POST["Duration"]."', '".$_POST["Remarks"]."', '".$_POST["fromreading"]."', '".$_POST["toreading"]."')";
		$isUpdated = mysqli_query($this->dbConnect, $insertQuery);
				file_put_contents('F:/Hyd/insertquery.txt', $insertQuery);

	}
	function loadNewsdata()	{
		$news="Add News";
	$sqlQuery = "SELECT pgmID FROM  news";
	$result = mysqli_query($this->dbConnect, $sqlQuery);
	//$mydata = array();
		$mydata.= "<option selected='true' disabled='disabled' value=" . $news. ">" . $news . "</option>";	

	while($row = $result->fetch_assoc()) {
					//$mydata .=  $row['pgmID'];
			//return  $mydata;
		$mydata .= "<option value=" . $row['pgmID']. ">" . $row['pgmID'] . "</option>";	
			//$mydata[]=  $row[pgmID];
	}
	echo $mydata;
	
	}
	function loadMontagedata()	{
		$montage="Add Montage";
		$sqlQuery = "SELECT pgmID FROM  montages";
	$result = mysqli_query($this->dbConnect, $sqlQuery);
	//$mydata = array();
	$mydata.= "<option selected='true' disabled='disabled' value=" . $montage. ">" . $montage . "</option>";	
	while($row = $result->fetch_assoc()) {
					//$mydata .=  $row['pgmID'];
			//return  $mydata;
		$mydata .= "<option value=" . $row['pgmID']. ">" . $row['pgmID'] . "</option>";	
			//$mydata[]=  $row[pgmID];
	}
	
	echo $mydata;
	
	}
	
	public function deleteEmployee(){
	
		if($_POST["empId"]) {
			$sqlDelete = "
				DELETE FROM ".$this->empTable."
				WHERE pgmID = '".$_POST["empId"]."'";		
			mysqli_query($this->dbConnect, $sqlDelete);		
		}
		file_put_contents('F:/Hyd/delete.txt', $sqlDelete );
	}
	public function updateEmployeetime(){
					file_put_contents('F:/Hyd/my_working_file.txt', $_POST['empId'] );
	
		if($_POST['empId']) {	
			$updateQuery = "UPDATE ".$this->empTable." 
			SET Programname = '".$_POST["programname"]."',filename = '".$_POST["filename"]."', UserID = '".$_POST["UserID"]."', Remarks = '".$_POST["Remarks"]."', myDate = '".$_POST["myDate"]."' , INpoint = '".$_POST["IN"]."', OUTpoint = '".$_POST["OUT"]."', Duration = '".$_POST["Duration"]."'
			WHERE pgmID ='".$_POST['empId']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('F:/Hyd/my_working_file.txt', $updateQuery );

		}
		//file_put_contents('F:/Hyd/my_working_file.txt', $_POST['empId']."////".$updateQuery);
	}
	
	public function recalculate() {
	
	echo $_POST["myid"];
						file_put_contents('F:/Hyd/recall.txt', $_POST['myid'], FILE_APPEND );

	if($_POST['myid']) {	
		$updateQuery = "UPDATE ".$this->empTable." 
			SET  myDate = '".$_POST["mydate"]."' , fromreading = '".$_POST["from"]."', toreading = '".$_POST["to"]."', Duration = '".$_POST["dur"]."', Remarks = '".$_POST["Remarks"]."'
			WHERE pgmID ='".$_POST['myid']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('F:/Hyd/recal.txt', $updateQuery, FILE_APPEND );
		}
	}
	public function statuscheck() {
	
	echo $_POST["myid"];
						file_put_contents('F:/Hyd/status.txt', $_POST['myid'], FILE_APPEND );

	if($_POST['myid']) {	
		$updateQuery = "UPDATE ".$this->empTable." 
			SET   Remarks = '".$_POST["Remarks"]."'
			WHERE pgmID ='".$_POST['myid']."'";
			$isUpdated = mysqli_query($this->dbConnect, $updateQuery);	
					file_put_contents('F:/Hyd/status.txt', $updateQuery, FILE_APPEND );
		}
	}
	
	
}
?>