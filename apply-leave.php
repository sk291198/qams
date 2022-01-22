<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['emplogin'])==0)
    {   
header('location:index.php');
}
else{
if(isset($_POST['apply']))
{
$empid=$_SESSION['eid'];
$empname=$_POST['empname'];
$qutblock=$_POST['qutblock'];
 $qutname=$_POST['qutname'];
 $email=$_POST['email'];
 
$fromdate=$_POST['fromdate'];  
$todate=$_POST['todate'];
$description=$_POST['description'];  
$status=0;
$isread=0;
if($fromdate > $todate){
                $error=" ToDate should be greater than FromDate ";
           }
$sql="INSERT INTO tblleaves(EmpName,QutBlock,QutName,Emailid,ToDate,FromDate,Description,Status,IsRead,empid) VALUES(:empname,:qutblock,:qutname,:email,:todate,:fromdate,:description,:status,:isread,:empid)";
$query = $dbh->prepare($sql);
$query->bindParam(':empname',$empname,PDO::PARAM_STR);
$query->bindParam(':qutblock',$qutblock,PDO::PARAM_STR);
$query->bindParam(':qutname',$qutname,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':fromdate',$fromdate,PDO::PARAM_STR);
$query->bindParam(':todate',$todate,PDO::PARAM_STR);
$query->bindParam(':description',$description,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->bindParam(':isread',$isread,PDO::PARAM_STR);
$query->bindParam(':empid',$empid,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$msg="Request applied successfully";
}
else 
{
$error="Something went wrong. Please try again";
}

}




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


 
  EmpName: $result->EmpName 
  Email Id: $result->Emailid  
  Quarters Block: $result->QutBlock
  Quarters Name: $result->QutName


            YOU HAVE APPLIED QUARTERS SUCCESSFULLY...
            
  Rules:
            Kindly submit ur documents in department...
            Make sure do not apply for second quarters until first one leaves...




";

 }
}
$headers ='From: <nickholous@gmail.com>';
mail($toemail,"Employee Application",$message,$headers);

    ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Employe | Apply Request</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet"> 
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
  <style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
 


    </head>
    <body>
  <?php include('includes/header.php');?>
            
       <?php include('includes/sidebar.php');?>
   <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title" style="color: green;">Apply for Quarters</div>
                    </div>
                    <div class="col s12 m12 25">
                        <div class="card">
                            <div class="card-content">
                                <form id="example-form" method="post" name="addemp">
                                    <div>
                                        <section>
                                            <div class="wizard-content">
                                                <div class="row">
                                                    <div class="col m12">
                                                        <div class="row">
     <?php if($error){?><div class="errorWrap"><strong>ERROR </strong>:<?php echo htmlentities($error); ?> </div><?php } 
                else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>

<div class="input-field col m12 s12">
<label for="birthdate">Employee Name</label>    

<input type="text" id="textarea1" name="empname" class="materialize-textarea" length="500" required>
</div>

<div class="input-field col m12 s12">
<label for="birthdate">Email Id</label>    

<input type="text" id="mask1" name="email" class="materialize-textarea" length="500" required>
</div>
<div class="input-field col m6 s12">
<label for="fromdate">From  Date</label>
<input placeholder="" id="mask1" name="fromdate" class="masked" type="text" data-inputmask="'alias': 'date'" required>
</div>
<div class="input-field col m6 s12">
<label for="todate">To Date</label>
<input placeholder="" id="mask1" name="todate" class="masked" type="text" data-inputmask="'alias': 'date'" required>
</div>
<!--<div class="input-field col  s12">
<select  name="leavetype" autocomplete="off">
<option value="">Select leave type...</option>
<?php $sql = "SELECT  LeaveType from tblleavetype";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{   ?>                                            
<option value="<?php echo htmlentities($result->LeaveType);?>"><?php echo htmlentities($result->LeaveType);?></option>
<?php }} ?>
</select> -->
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Quarters Block</label>    

<input type="text" id="mask1" name="qutblock" class="materialize-textarea" length="500" required>
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Quarters Name</label>    

<input type="text" id="mask1" name="qutname" class="materialize-textarea" length="500" required>
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Description (Reason Behind)</label>    

<input type="text" id="mask1" name="description" class="materialize-textarea" length="500" required>
</div>

</div>
<div align="center">
      <button type="submit" name="apply" id="apply" class="waves-effect waves-light btn indigo m-b-xs">Apply</button>                                             

                                                </div>
                                            </div>
                                        </section>
                                     
                                    
                                        </section>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/js/alpha.min.js"></script>
        <script src="assets/js/pages/form_elements.js"></script>
          <script src="assets/js/pages/form-input-mask.js"></script>
                <script src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
    </body>
</html>
<?php } ?> 