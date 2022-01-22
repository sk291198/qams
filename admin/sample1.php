<?php


include('includes/config.php');
error_reporting(0);

//$sql = "SELECT tblleaves.id as lid,tblemployees.FirstName,tblemployees.LastName,tblemployees.EmpId,tblemployees.id,tblleaves.QutName,tblleaves.Emailid,tblleaves.QutBlock from tblleaves join tblemployees on tblleaves.empid=tblemployees.id where status= order by lid desc";
$sql="SELECT * from  tblleaves where empid=tblleaves.empid";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
{         
      
$toemail=" $result->Emailid";
$message= "			
	

	Quarters Allotment Management System



  $result->empid  
  $result->EmpName
  $result->Emailid  
  $result->QutBlock
  $result->QutName


  Rules:
  			Kindly submit ur documents in department...
  			Make sure do not apply for second quarters until first one leaves...




";

 }
}
$headers ='From: <nickholous@gmail.com>';
mail($toemail,"Employee Registration",$message,$headers);

  ?>