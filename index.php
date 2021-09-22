<?php 
	include('inc/header.php');
	include('config2.php');
	include('Employee.php');
?>
<html>
	<head>
		<title>DT</title>
		<link rel="stylesheet" href="css/split-pane.css" />
		<script src="js/split-pane.js"></script>
		<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
		<script src="js/jquery-ui.min_1.js"></script>
		
		
		
		
		<script src="js/print.js"></script>
		<!--<script src="js/jquery.dataTables.min.js"></script>
			<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
		-->
		<script src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
		
		<script src="js/dataTables.bootstrap.min.js"></script>		
		<script src="js/data.js"></script> 
		
		
		
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
		<link href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css" rel="stylesheet" />
		<script src="https://cdn.datatables.net/rowreorder/1.2.8/js/dataTables.rowReorder.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
		<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
		<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
		
		<!--1908 -->
		<script src="js/video.js"></script>
		<script src="js/mobilemodal.js"></script>
		<link href="http://vjs.zencdn.net/4.12/video-js.css" rel="stylesheet">
		<link href="css/galleryvideo.css" rel="stylesheet">
		
		<!--<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.js"></script>
			<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css" />
			https://cdnjs.cloudflare.com/ajax/libs/datatables.net-buttons/1.7.1/js/buttons.print.js
			https://cdnjs.cloudflare.com/ajax/libs/datatables.net-buttons/1.7.1/js/buttons.print.min.js
			
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
			https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.js
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>-->
		
		
		<style type="text/css">
			html, body {
			height: 100%;
			min-height: 100%;
			margin: 0;
			padding: 0;
			}
			.split-pane-divider {
			background: red;
			}
			#left-component {
			width: 0em;
			}
			mark {
  background-color: yellow;
  color: black;
}
			.middlepath{
			text-align:center;
			font-size:36px;
			font-weight:bold;
			
			}
			.middlepathcue{
			text-align:center;
			font-size:36px;
			font-weight:bold;
			
			
			}
			.middlepathmedia{
			text-align:center;
			font-size:36px;
			font-weight:bold;
			
			}
			 
			#my-divider {
			left: 0em; /* Same as left component width */
			width: 5px;
			}
			#right-component {
			left: 0em;  /* Same as left component width */
			margin-left: 5px;  /* Same as divider width */
			}
			.modal-backdrop {
			z-index: -1;
			}
			table tr td {
			border:2px solid black;
			
			
			}
			#content {
            border: dashed 2px #CCC;
            padding: 10px;
            background-color: #FFF;
			}
			#content #table2 tr {
			background-color: #f1ebeb;
            }
			.modal .modal-content{
overflow:hidden;
}
.modal-body{
overflow-y:scroll; // to get scrollbar only for y axis
}
 .red {
          
            background-color: red;
        }
		  .hlrow
    {
     background-color:orange;
	 font-weight:bold;
	font-color:black;
    }  
	.hlred{
	background-color:red;
	font-weight:bold;
	color:yellow;
	}
	 .pgmfrom {
	 background-color:yellow;
	 }
	 .pgmdur {
	 background-color:lightgreen;
	 }
	 .navbarr {
  overflow: hidden;
  background-color: #8E960C;
  position: fixed;
  top: 0;
  width: 100%;
  z-index:10;
  
}



		</style>
		
		
	</head>	
	<script>
		$(function() {
			$('div.split-pane').splitPane();
		});
	</script>
	<body>
		<nav class=" ml-5 mr-5 navbar  navbar-expand-sm  bg-success navbar-dark ">
				
				<div class="container-fluid button mb-2">
				 <div class="nav navbar-nav navbar">
					<button type="button" class="btn btn-info btn-sm menubg1 mr-1">D M A M</button>
					<input type="date" class=" font-weight-bold btn-lg " id="idmycuedate" name="mydatetop"  value="<?php echo date('Y-m-d'); ?>"  >
					
							<ul class="  mynav btn-group " style="list-style-type:none; left:-14px; top:5px;" id="Allclassified">
								<li class=" ">
									<button class="btn btn-primary dropdown-toggle btn-lg font-weight-bold btncuesheet " name="selectedcuesheet" id="idcuesheet2" type="button" data-toggle="dropdown">Select Cuesheet
									<span class="caret"></span></button>
									<ul class="dropdown-menu  ">
										<li><a  id="0600to1400" class="btnsqll btn  font-weight-bolder btn-sm btn-danger mb-1 btncue text-left" href="#">0600 to 1400 </a></li>
										
										<li><a  id="1400to2200" class="btnsqll btn  font-weight-bolder btn-sm  btn-danger mb-1 btncue text-left" href="#">1400 to 2200 </a></li>
										
										<li><a  id="2200to0600" class="btnsqll btn  font-weight-bolder btn-sm  btn-danger mb-1 btncue text-left" href="#">2200 to 0600 </a></li>
										
										
										
									</ul>
								</li>
								
							</ul>
							<!--<fieldset>
                            <legend>Cuesheet Clickables</legend>
					<button type="button" name="load" id="loadlist" class="btn btn-success btn-sm mt-3">Load Cue sheet</button>
					<button type="button" name="add" id="addEmployee" class="btn btn-success btn-sm">Add PGM Row</button>
				    <select class="btn btn-warning btn-md" name="montage" id="montage" >  </select>
					<select class="btn btn-warning btn-md" name="newslist" id="newslist" ></select>
					<button type="button" name="add dummy" id="addDummy" class="btn btn-success btn-sm">Add Dummy Row</button>
					<button type="button" name="recalculate" id="recalculate" class="btn btn-success btn-sm">Recalculate time</button>
					<button onclick="$('div.split-pane').splitPane('firstComponentSize', 1000);">Show Cuesheet table</button>
					</fieldset>-->
					<button onclick="$('div.split-pane').splitPane('firstComponentSize', 1000);" type="button" name="load" id="loadlist" class="btn btn-success  btn-lg mt-3">Load Cue sheet</button>
					<button  class="btn btn-warning btn-lg mt-3" onclick="$('div.split-pane').splitPane('firstComponentSize',0);">Show Source table</button>
					<button type="button" name="recalculate" id="recalculate" class="btn btn-success btn-lg font-weight-bold">Recalculate time</button>
					<button type="button" name="totaltime" id="totaltime" class="btn btn-primary btn-lg font-weight-bold">Total Time</button>
					<button type="button" name="check Gaps" id="chkstatus" class="btn btn-success btn-lg font-weight-bold">Check Gap /Over run</button>
					</div>
				
				
			</nav>
		
		
		
		
		
		
		<?php include('inc/containerr.php');?>
		
		<div class="split-pane fixed-left">
			
			<div class="split-pane-component" id="left-component">	
				<!-- copied -->
				<div class="middlepathcue bg-success text-white"> CUESHEET TABLE </div><br/>
				
				<!-- copied-->
				<!-- Original starts here -->
				<div class="container ">	
					
					<div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">  
					
					
					
					<button type="button" name="add" id="addEmployee" class="btn btn-success btn-sm">Add PGM Row</button>
				    <select class="btn btn-warning btn-md" name="montage" id="montage" >  </select>
					<select class="btn btn-warning btn-md" name="newslist" id="newslist" ></select>
					<button type="button" name="add dummy" id="addDummy" class="btn btn-success btn-sm">Add Dummy Row</button>
					<!--<button type="button" name="recalculate" id="recalculate" class="btn btn-success btn-sm">Recalculate time</button>
					<button type="button" name="totaltime" id="totaltime" class="btn btn-primary btn-sm">Total Time</button>
					<button type="button" name="check Gaps" id="chkstatus" class="btn btn-success btn-sm">Check Gap /Over run</button>-->
						<table id="employeeList" class="table table-bordered table-striped employeelist">
							<thead>
								<tr  id = "header_row">
									<th>Sl No</th>
									<!--<th>Cue ID</th>-->
									<th>User</th>					
									<th>Program</th>
									<th>filename</th>
									<!--<th>Date</th>-->
									<th>From</th>					
									<th>To</th>
									<th>Duration</th>		
									<th>Remarks</th>
									<th class="hidden">slot</th>
									<th> <a id = "a9"></a> 	</th>
									<th></th>
								</tr>
							</thead>
						</table>
						<div id="employeeModal" class="modal fade">
							<div class="modal-dialog">
								<form method="post" id="employeeForm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title"><i class="fa fa-plus"></i> Edit User</h4>
										</div>
										<div class="modal-body">
											
											<div class="form-group">
												<label for="lastname" class="control-label">Sl NO</label>							
												<input type="text" class=" form-control"  id="slno" name="slno" placeholder="serial Number"  readonly>							
											</div>
											
											<div class="form-group">
												
												<label for="age" class="control-label">CueID</label>	
												<ul class="mynav btn-group" style="list-style-type:none;" id="Allclassified">
													<li class="mt-3 mr-2 ">
														<button class="btn btn-primary dropdown-toggle btn-sm font-weight-bold btncuesheet" id="idcuesheet" type="button" data-toggle="dropdown">Select CueID
														<span class="caret"></span></button>
														<ul class="dropdown-menu  ">
															<li><a  id="0600to1400" class="btnsql btn  font-weight-bold btn-sm btn-danger mb-1 btncue" href="#">0600 to 1400 </a></li>
															
															<li><a  id="1400to2200" class="btnsql btn  font-weight-bold btn-sm  btn-danger mb-1 btncue" href="#">1400 to 2200 </a></li>
															
															<li><a  id="2200to0600" class="btnsql btn  font-weight-bold btn-sm  btn-danger mb-1 btncue" href="#">2200 to 0600 </a></li>
															
															
															
														</ul>
													</li>
													
												</ul>
												
												<input type="text" class="form-control" id="CueID" name="cueID" placeholder="cueID" readonly  >		
											</div>	   	
											<div class="form-group">
												<label for="lastname" class="control-label">UserID</label>							
												<input type="text" class="form-control"  id="UserID" name="UserID" placeholder="producer" >							
											</div>	 
											<div class="form-group">
												<label for="address" class="control-label">Program</label>							
												<textarea class="form-control" rows="2" id="programname" name="programname"></textarea>							
											</div>
											<div class="form-group">
												<label for="address" class="control-label">Filename</label>							
												<textarea class="form-control" rows="1" id="filename" name="filename"></textarea>							
											</div>
											<div class="form-group">
												<label for="date" class="control-label">Date</label>
												
												<input type="text" class="form-control" id="myDate" name="myDate" placeholder="Date" readonly  >			
											</div>	
											<div class="form-group">
												<label for="lastname" class="control-label">IN</label>							
												<input type="text" class="form-control" id="IN" name="IN" placeholder="IN" value="01:00:00" readonly>			
											</div>	
											<div class="form-group">
												<label for="lastname" class="control-label">OUT</label>							
												<input type="text" class="form-control" id="OUT" name="OUT" placeholder="OUT" value="21:00:00" readonly>			
											</div>
											<div class="form-group">
												<label for="lastname" class="control-label">from</label>
												<input type="text" class="form-control" id="from" name="from" placeholder="Tx from" value="" readonly>			

												<!--<input type="time" class="form-control" id="from" name="from" placeholder="Tx from" value="00:00:00" readonly>-->			
											</div>	
											<div class="form-group">
												<label for="lastname" class="control-label">To</label>							
												<input type="text" class="form-control" id="to" name="to" placeholder="Tx to" value="" readonly>			
											</div>
											<div class="form-group">
												<label for="lastname" class="control-label">Duration</label>							
												<input type="text" class="form-control" id="Duration" name="Duration" placeholder="Designation" value="00:20:00" readonly>			
											</div>	
											<div class="form-group">
												<label for="lastname" class="control-label">Remarks</label>							
												<input type="text" class="form-control" id="Remarks" name="Remarks" placeholder="Remarks">			
											</div>	
											<div class="form-group hidden">
												<label for="lastname" class="control-label hidden">slot</label>							
												<input type="text" class="form-control hidden" id="slot" name="slot" placeholder="Slot type">			
											</div>	
										</div>
										<div class="modal-footer">
											<input type="hidden" name="pgmID" id="pgmID" />
											<input type="hidden" name="slotf" id="slotf" />
											<input type="hidden" name="action" id="action" value="" />
											<input type="submit" name="save" id="save" class="btn btn-info" value="Save" />
											<input type="submit" name="savenew" id="savenew" class="btn btn-info" value="Savenew" />
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>	
					
				</div>
				
				
				
			</div>
			<?php include('inc/footerr.php');?>
			
			<div class="split-pane-divider" id="my-divider"></div>
			<div class="split-pane-component" id="right-component">
			
			<!-- Player for mobile only copied -->
							<!--1908 -->
							<div class="  container">
							<div class="row">
							<div id="mymobileModalarea"  data-backdrop="false" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
											<h4 class="modal-title"><i class="fa fa-plus"></i> Player</h4>
										</div>
										
										<div class="modal-body ">

											
												<video id="MY_VIDEO_2" oncontextmenu="return 	false" class="MY_VIDEO_2 video-js vjs-default-skin " controls preload="auto" controlsList=”nodownload”  width="100%" height="300px" data-setup='{"poster":""}'>
													<source src="" type='video/mp4'>
													<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
												</video>
												
								
								
								<div class="row">
								<div class="col-md-6">	
												
											<button type="button" id="btnmarkin" class=" btn btn-block text-nowrap btn-primary  btn-sm mb-2 ">Mark IN</button>
											<input type="text" class="txtmarkin form-control input-sm mb-2 btn-outline-warning" id="markin" name="markin">
											<button type="button" id="btncuein" class="btn btn-block btn-danger text-nowrap btn-sm mb-2 mr-2 "> CUE</button>
									</div>
																		<div class="row">
								<div class="col-md-6">	
											<button type="button" id="btnmarkout" class=" btn btn-block text-nowrap btn-primary  btn-sm mb-2 ">Mark OUT</button>
											<input type="text" class="txtmarkout form-control input-sm mb-2 btn-outline-warning" id="markout" name="markout">
											<button type="button" id="btncueout" class="btn btn-block btn-danger text-nowrap btn-sm mb-2 mr-2 "> CUE</button>
										</div></div>
												
											
											

									</div>
									<button type="button" id="btnsaveinout" class="btn btn-block btn-primary text-nowrap btn-sm mb-2 mr-2 ">SAVE IN & OUT</button>
									<button id = "mymobileplayerclose" type="button" class="close mt-2" data-dismiss="modal" aria-hidden="true">CLOSE</button> 
												<div id="mymobileplayerstatus" ></div>
							</div>
							
							
							
								
							
						</div>
						</div>
						</div>
						
							
							<!-- Player for mobile only -->
				
                <!--<button onclick="$('div.split-pane').splitPane('firstComponentSize', 50);">Show Source table</button>
				<button onclick="$('div.split-pane').splitPane('firstComponentSize', 1000);">Show Cuesheet table</button>
				<ul class="mynav btn-group" style="list-style-type:none;" id="Allclassified">
					<li class="mt-3 mr-2 ">
						<button class="btn btn-primary dropdown-toggle btn-sm font-weight-bold btncuesheet3" id="idcuesheet3" type="button" data-toggle="dropdown">Select Cuesheet
						<span class="caret"></span></button>
						<ul class="dropdown-menu  ">
							<li><a  id="0600to1400" class="btnsql3 btn  font-weight-bold btn-sm btn-danger mb-1 btncue3" href="#">0600 to 1400 </a></li>
							
							<li><a  id="1400to2200" class="btnsql3 btn  font-weight-bold btn-sm  btn-danger mb-1 btncue3" href="#">1400 to 2200 </a></li>
							
							<li><a  id="2200to0600" class="btnsql3 btn  font-weight-bold btn-sm  btn-danger mb-1 btncue3" href="#">2200 to 0600 </a></li>
							
							
							
						</ul>
					</li>
					
				</ul>-->
				
				<div class="  container">
					<div class="  ml-20 bg-warning middlepathmedia text-white"> MEDIA TABLE </div><br/>
					<h3>1. Click on any column of<b><mark> Sl No</mark></b> to add that row to Cue sheet </h3>
					<h3>2. Click on any column of <b><mark>PgmID</mark></b> to edit-Save IN / OUT Points of that Video  </h3>
					<table class="table table-bordered thead-dark table2 " id="table2" >
						<thead class="thead-dark">
							<tr>
								<th width='5%'>Sl No</th>
								<!--<th width='1%'>CueID</th>-->
								<th width='3%'>PgmID</th>
								<!--<th width='3%'>User</th>-->
								<th width='10%'>Date</th>
								<th width='3%'>IN</th>
								<th width='3%'>OUT</th>
								<th width='23%'>Program</th>
								<th width='7%'>Duration</th>
								<th width='7%'>filename</th>
								<!--<th width='7%'>Path2</th>-->
								<th width='10%'>Remarks</th>
							</thead>
						</tr>
						<?php 
							$query = "select * from cuesheet2 order by myDate desc";
							$result = mysqli_query($con,$query);
							$count = 1;
							while($row = mysqli_fetch_array($result) ){
								//$cid = $row['cueID'];
								$id = $row['pgmID'];
								$username = $row['UserID'];
								$Date = $row['myDate'];
								$TimeFrom = $row['INpoint'];
								$TimeTo = $row['OUTpoint'];
								$Programname = $row['Programname'];
								$filename = $row['filename'];
								$Duration = $row['Duration'];
								//$ProxyPath = $row['ProxyPath'];
								$OrgMediaPath = $row['OrgMediaPath'];
								$Remarks = $row['Remarks'];
							?>
							<tr class="myrow" id="myrow">
								<td class="pgmclass" id="rowid" data-toggle="tooltip" title="Click to add to cuesheet!"><?php echo $count; ?></td>
								<!--<td> <div contentEditable='true' class='edit ' id='CueID_<?php echo $id; ?>'> <?php echo $cid; ?></div> </td>-->
								<td  class="pgmtoplayy" data-toggle="tooltip" title="Click to Play!" > <div contentEditable='true' class='edit ' id='pgmID_<?php echo $id; ?>'><?php echo $id; ?> </div> </td>
								<!--<td> <div contentEditable='true' class='edit' id='UserID_<?php echo $id; ?>'><?php echo $username; ?> </div> </td>-->
								
								<td> <div contentEditable='true' class='edit' id='myDate_<?php echo $id; ?>'> <?php echo $Date; ?></div> </td>
								<td> <div contentEditable='true' class='edit' id='TimeFrom_<?php echo $id; ?>'><?php echo $TimeFrom; ?> </div> </td>
								<td> <div contentEditable='true' class='edit' id='TimeTo_<?php echo $id; ?>'><?php echo $TimeTo; ?> </div> </td>
								<td> <div contentEditable='true' class='edit' id='Programname_<?php echo $id; ?>'><?php echo $Programname; ?> </div> </td>
								<td> <div contentEditable='true' class='edit' id='Duration_<?php echo $id; ?>'><?php echo $Duration; ?> </div> </td>
								<td> <div contentEditable='true' class='edit' id='filename<?php echo $id; ?>'><?php echo $filename; ?> </div> </td>
								<!--<td> <div contentEditable='true' class='edit' id='OrgMediaPath_<?php echo $id; ?>'><?php echo $OrgMediaPath; ?> </div> </td>-->
								<td class="remclass"> <div contentEditable='true' class='edit' id='Remarks_<?php echo $id; ?>'><?php echo $Remarks; ?> </div> </td>
								
							</tr>
							<?php
								$count ++;
							}
						?>  
					</table>
					
					
				</div>  
			</div>
		</div>
	</body>
</html>
<script>
	$(document).ready(function(){
	$("#mymobileModalarea").draggable({
      handle: ".modal-header"
  });
    var selid;
	var selid2;
	var selid3;
	
    $(".btnsql").click(function() {
        
		try {
			selid = $(this).attr("id");
            } catch (err) {
			alert(err.message);
		}
        switch (selid) {		  
            case '0600to1400':
            $("#CueID").val(selid);
            break;
            case '1400to2200':
            $("#CueID").val(selid);
            break;
            case '2200to0600':
            $("#CueID").val(selid);
            break;
		}
        
	});
	$(".btncue").click(function() {
		try {
			selid2 = $(this).attr("id");
            } catch (err) {
			alert(err.message);
		}
        switch (selid2) {		  
            case '0600to1400':
			$("#idcuesheet2").text(selid2);
            break;
            case '1400to2200':
            $("#idcuesheet2").text(selid2);
            break;
            case '2200to0600':
            $("#idcuesheet2").text(selid2);
            break;
		}
        
	});
	
	$(".btncue3").click(function() {
		try {
			selid3 = $(this).attr("id");
            } catch (err) {
			alert(err.message);
		}
        switch (selid3) {		  
            case '0600to1400':
			$("#idcuesheet3").text(selid2);
            break;
            case '1400to2200':
            $("#idcuesheet3").text(selid2);
            break;
            case '2200to0600':
            $("#idcuesheet3").text(selid2);
            break;
		}
        
	});
	
	
	$("#table22 tr").on('click', function(e) {
		
		var newTr = $(this).closest("tr").clone().removeClass("highlight");
		newTr.appendTo($("#employeeList"));
	});
	
	
	$(".myroww").click(function() {
		var lvrownum = $(this).attr('id');
		var currentRow=$(this).closest("tr"); 
		//alert(lvrownum+"  /" +currentRow);
		var cueid=selid3;
		var pgmid=currentRow.find("td:eq(2)").text();
		var userid=currentRow.find("td:eq(3)").text();
		var mydate=currentRow.find("td:eq(4)").text();
		var from=currentRow.find("td:eq(5)").text();
		var to=currentRow.find("td:eq(6)").text();
		var programname=currentRow.find("td:eq(7)").text();
		var duration=currentRow.find("td:eq(8)").text();
		var remarks=currentRow.find("td:eq(11)").text();
		alert("cueid="+cueid+" userid=" +userid+"date="+mydate+" from" +from+" to=" +to+"pname="+programname+" duration" +duration+" remarks=" +remarks);
		
		
		var action = 'addEmployee';
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				//programname:programname+"from:"+from +"--to:"+to,
				programname:programname,
				UserID:userid,
				IN:from,
				OUT:to,
				myDate:mydate,
				Remarks:remarks,
				Duration:duration,
			action:action},
			
			success:function(data){
				employeeData.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
			
		})
		//$("#mycontent").html(myid+"/n"+myext);
	});
	});
</script>

