$(document).ready(function(){
	$("#Savenew").hide();
	    var date=$("#idmycuedate").val();
		var inittime="0600to1400";
		var tottime;
		loadnews();
		loadmontage();
		loadmymedia();
		 //var selectedcuesheet=$("#idcuesheet2").text();
		 $("#idcuesheet2").text("0600to1400");
		loadmycuesheet(date,"0600to1400");
		
		 var employeeData;
		 var employeeData2;
	
		 function loadmycuesheet(date,selectedcuesheet) {
	employeeData = $('#employeeList').DataTable({
	
		"lengthChange": true,
		"processing":true,
		"serverSide":true,
		"order":[],
		
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{date:date, selectedcuesheet:selectedcuesheet, action:'listEmployee'},
			dataType:"json"
		},
		 
         dom: 'lBfrtip',
         /* buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],   */
        buttons: [
            /* {
                extend: 'copyHtml5',
                exportOptions: {
                    columns: [ 0, ':visible' ]
                }
            },
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            }, */
			{
                text: 'Cal time',
				attr:  {
                title: 'recal',
                id: 'recalculated'
            }
                /* action: function ( e, dt, node, config ) {
                    alert( 'Button activated' );
                } */
            },
			{ extend: 'print',
			title:"Cuesheet:"+date +"</br> for:"+ selectedcuesheet+"</br> Duration:"+tottime,
                exportOptions: {
                    columns: [ 0, 6 ,7, 3 , 2,9]
                }
            },
            {
                extend: 'pdfHtml5',
				text:'Export to PDF',
				 title: 'My title' + '\n' + 'a new line',
  customize: function(doc) {
    doc.styles.title = {
      color: 'red',
      fontSize: '20',
      background: 'blue',
      alignment: 'center'
    }   
  } , 
                exportOptions: {
                    columns: [ 0, 2, 3,  5, 6 ,7 ]
                }
            }
        ],
		"createdRow": function ( row, data, index ) {
		 //console.log( 'DATA WAS ' + data[4]);
        /*  if ( data[4] == "Promos" ) {
            $('td', row).eq(4).addClass('red');
			 // $(row).find("td").eq(4).addClass( 'hlrow' ); // another way to highlight
        }  */
		 if (( data[4] == "dummy"  ) || (data[4] == "Promos" )) {
            $('td', row).eq(4).addClass('red');
			 // $(row).find("td").eq(4).addClass( 'hlrow' ); // another way to highlight
        }
		if ( data[9] == "overrun" ) {
            $('td', row).eq(9).addClass('hlrow');
			 // $(row).find("td").eq(4).addClass( 'hlrow' ); // another way to highlight
        }
   } ,
   
   
		/* buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ], */
		
		"columnDefs":[
		    /* {
                "targets": [ 10 ],
                "visible": false,
               
            }, */
			
			{ className: "pgmclass", targets: 0 },
    {  className: "pgmfrom", targets: 6 },
	{  className: "pgmto", targets: 7 },
	{  className: "pgmdur", targets: 8 },
	{
				"targets":[0, 6, 7],
				"searchable": true, 
				"orderable":false,
			},
			
		],
		"pageLength": 10
		  
	});
		 } 
		 /* function loadmycuesheet(date,selectedcuesheet) {
			 employeeData = $('#employeeList').DataTable({
			
			 "serverSide":true,
		"order":[],
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{date:date, selectedcuesheet:selectedcuesheet, action:'listEmployee'},
			dataType:"json"
		},
		"columnDefs":[
			{
				"targets":[0, 6, 7],
				"orderable":false,
			},
		],
		"pageLength": 10
		 
		 });
		 } */
	 function loadmymedia() {
	 employeeData2 = $('#table2').DataTable({
		"processing":true ,
		columnDefs: [
    { className: "pgmclass", targets: 0 },
    {  className: "pgmtoplayedit", targets: 2 },
	{  className: "pgmtoplay3", targets: 3 },
	{  className: "my_second_class", targets: 4 }
],
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{ action:'listmedia'},
			dataType:"json"
		}  
	});	
	 }
	
	 function addnews() {
	 
	 var empId = myempID;
		var action = 'addnews';
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:empId,
				programname:$('#programname').val(),
				UserID:$('#UserID').val(),
				IN:$('#IN').val(),
				OUT:$('#OUT').val(),
				myDate:$('#myDate').val(),
				Remarks:$('#Remarks').val(),
				Duration:$('#Duration').val(),
				action:action},
			
			success:function(data){
				//employeeData.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	 
	 }
	 
	 function loadnews() {
		var action = 'loadnews';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{
				action:action},
			success:function(data){
				var list_html = "<ol>";
                for( var i=0; i <data.length; i++) {
                   list_html += "<li>" + data[i] + "</li>";
                 }
                list_html += "</ol>"
                $("#newslist").html(data);
				 //$("#playlist").html(data[0]);
				 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	 }
	 function loadmontage() {
		var action = 'loadmontage';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{
				action:action},
			success:function(data){
				var list_html = "<ol>";
                for( var i=0; i <data.length; i++) {
                   list_html += "<li>" + data[i] + "</li>";
                 }
                list_html += "</ol>"
                $("#montage").html(data);
				 //$("#playlist").html(data[0]);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	 }
	$('#newslist').on('change',addnewsrow);
	$('#montage').on('change',addmontagerow);
		try {
			//$('#optmodalunits').val(selstateid);
			} catch (exception) {
		}
		var newsin;
		var newsout;
		var newsdur;
		var newsfrom;
		var newsto;
		var newsname;
		var newsslot;
		
		var mnewsin;
		var mnewsout;
		var mnewsdur;
		var mnewsfrom;
		var mnewsto;
		var mnewsname;
		var mfilename="montage.mp4";
	function addnewsrow()
	{
	 newsname=$('#newslist').val();
	var cueidselected=$("#idcuesheet2").text();
		getnewsvalues(newsname);
	
	}
	function addmontagerow()
	{
	 mnewsname=$('#montage').val();
	var cueidselected=$("#idcuesheet2").text();
		getmontagevalues(mnewsname);
	
	}
	function addnewstocuesheet()
	{
	
	/* var newsname=$('#newslist').val();
	getnewsvalues(newsname); */
			var cueidselected=$("#idcuesheet2").text();

		var action = 'addrowofnews';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueidselected,
				programname:newsname,
				UserID:"News",
				IN:newsin,
				OUT:newsout,
				myDate:$('#idmycuedate').val(),
				Remarks:"rem news 14",
				slot:newsslot,
				Duration:newsdur,
				fromreading:newsfrom,
				toreading:newsto,
				action:action},
			
			success:function(data){
			
			employeeData.ajax.reload();
				gettotaltime(); 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	}
	
	function addmontagetocuesheet()
	{
			var cueidselected=$("#idcuesheet2").text();
alert(mnewsfrom+"//"+mnewsto);
		var action = 'addrowofmontage';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueidselected,
				programname:mnewsname,
				filename:mfilename,
				UserID:"News",
				IN:mnewsin,
				OUT:mnewsout,
				myDate:$('#idmycuedate').val(),
				Remarks:"rem news 14",
				Duration:mnewsdur,
				fromreading:mnewsfrom,
				toreading:mnewsto,
				action:action},
			
			success:function(data){
			
			employeeData.ajax.reload();
				gettotaltime(); 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	}
	
	
	
	function getnewsvalues(newsname) {
	alert(newsname);
	var action = 'getNewsvalues';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{newsname:newsname, action:action},
			dataType:"json",
			success:function(data){
			
				
				newsin=data.INpoint;
				newsout=data.OUTpoint;
				newsdur=data.Duration;
				newsfrom=data.fromreading;
				newsto=data.toreading;
				newsslot=data.slot;
				/* $('#CueID').val(data.CueID);
				$('#UserID').val(data.UserID);
				$('#programname').val(data.Programname);
				$('#myDate').val(data.myDate);				
				$('#IN').val(data.INpoint);
				$('#OUT').val(data.OUTpoint);	
				$('#Duration').val(data.Duration);
				$('#Remarks').val(data.Remarks);	 */
				addnewstocuesheet();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	
	}
	function getmontagevalues(mnewsname) {
		alert(mnewsname);
	var action = 'getMontagevalues';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{newsname:mnewsname, action:action},
			dataType:"json",
			success:function(data){
			
				
				mnewsin=data.INpoint;
				mnewsout=data.OUTpoint;
				mnewsdur=data.Duration;
				mnewsfrom=data.fromreading;
				mnewsto=data.toreading;
				/* $('#CueID').val(data.CueID);
				$('#UserID').val(data.UserID);
				$('#programname').val(data.Programname);
				$('#myDate').val(data.myDate);				
				$('#IN').val(data.INpoint);
				$('#OUT').val(data.OUTpoint);	
				$('#Duration').val(data.Duration);
				$('#Remarks').val(data.Remarks);	 */
				addmontagetocuesheet();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	
	}
	
	  $("#loadlist").click(function(){
			
		 var date=$("#idmycuedate").val();
		 var selectedcuesheet=$("#idcuesheet2").text();
		//alert(date +"////"+selectedcuesheet);
	  employeeData.destroy();
		loadmycuesheet(date,selectedcuesheet);
		gettotaltime();
		}); 
	$('#addEmployeee').click(function(){
			
		$('#employeeModal').modal('show');
		$('#employeeForm')[0].reset();
	    var setdate=$("#idmycuedate").val();
		$("#myDate").val(setdate);
		var cueidselected=$("#idcuesheet2").text();
		$("#CueID").val(cueidselected);
		alert(cueidselected);
		$('.modal-title').html("<i class='fa fa-plus'></i> Add Row");
		$('#action').val('addEmployee');
		$('#save').val('Add');
		
	});		
	$('#addEmployee').click(function(){
			$("#savenew").show();
			$("#save").hide();
		$('#employeeModal').modal('show');
		$('#employeeForm')[0].reset();
	    var setdate=$("#idmycuedate").val();
		$("#myDate").val(setdate);
		var cueidselected=$("#idcuesheet2").text();
		$("#CueID").val(cueidselected);
		alert(cueidselected);
		$('.modal-title').html("<i class='fa fa-plus'></i> Add Row");
		//$('#action').val('addEmployee');
		//$('#save').val('Add');
	});		
		$('#savenew').click(function(){
		var rowCount = $('#employeeList tr').length;
    var rowCountdata=  employeeData.rows().count();
   rowCount1=parseInt(rowCount);
   //alert(rowCount+"//"+rowCountdata);
   if (rowCountdata>0) {
	var to=$("#employeeList tr:nth-child("+(rowCount-1)+") td:nth-child(8)").text();// 8th column is to time
	var from=to;
	alert(from);
   } else  {
   	//var to="06:00:00";// 8th column is to time
	var from="06:00:00";
alert(from);
   }
	$("#displayhtml").text(to);
	 var setdate=$("#idmycuedate").val();	
	var cueid=$("#idcuesheet2").text();
	var programname=$("#programname").val();
	var filename=$("#filename").val();
    var userid=$("#UserID").val();	
	var mydate=setdate;
    var myinpt=$("#IN").val();
	var myoutpt=$("#OUT").val();
	var duration=$("#Duration").val();
	var newto=addDuration(from,duration);
	var remarks=$("#Remarks").val();

				//var mydate=currentRow.find("td:eq(4)").text();
				
				//var from=to;
				
				
				alert("cueid="+cueid+" userid=" +userid+"date="+mydate+" from=" +from+" to=" +newto+"pname="+programname+"fname="+filename+" duration" +duration+" remarks=" +remarks +" inpt=" +myinpt +" outpt=" +myoutpt);
				
				var action = 'addEmployeenew';

				
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				programname:programname,
				//programname:programname,
				UserID:userid,
				IN: myinpt,
				OUT: myoutpt,
				myDate:mydate,
				fromreading:from,
				toreading:newto,
				filename:filename,
				Remarks:remarks,
				Duration:duration,
				action:action},
			
			success:function(data){
				employeeData.ajax.reload();
				//gettotaltime();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
		
		$("#employeeModal").modal('hide');
		$("#savenew").hide();
		$("#save").show();
	});		
	
	$('#addDummy').click(function(){
		var rowCount = $('#employeeList tr').length;
    var rowCountdata=  employeeData.rows().count();
   rowCount1=parseInt(rowCount);
   //alert(rowCount+"//"+rowCountdata);
   if (rowCountdata>0) {
	var to=$("#employeeList tr:nth-child("+(rowCount-1)+") td:nth-child(8)").text();// 8th column is to time
	var from=to;
	alert(from);
   } else  {
   	//var to="06:00:00";// 8th column is to time
	var from="06:00:00";
alert(from);
   }
	$("#displayhtml").text(to);
	 var setdate=$("#idmycuedate").val();	
	var cueid=$("#idcuesheet2").text();
	var programname="dummy";
	var filename="dummy";
    var userid="dummy";	
	var mydate=setdate;
    var myinpt="00:00:00";
	var myoutpt="00:30:00";
	var duration="00:30:00";
	var newto=addDuration(from,duration);
	var remarks=" Fill with actual Pgm";

				//var mydate=currentRow.find("td:eq(4)").text();
				
				//var from=to;
				
				
				alert("cueid="+cueid+" userid=" +userid+"date="+mydate+" from=" +from+" to=" +newto+"pname="+programname+"fname="+filename+" duration" +duration+" remarks=" +remarks +" inpt=" +myinpt +" outpt=" +myoutpt);
				
				var action = 'addEmployeenew';

				
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				programname:programname,
				//programname:programname,
				UserID:userid,
				IN: myinpt,
				OUT: myoutpt,
				myDate:mydate,
				fromreading:from,
				toreading:newto,
				filename:filename,
				Remarks:remarks,
				Duration:duration,
				action:action},
			
			success:function(data){
				employeeData.ajax.reload();
				gettotaltime();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
		
		$("#employeeModal").modal('hide');
		$("#savenew").hide();
		$("#save").show();
	});
	//1908
	var myeditin;
	var myeditout;
	var mypgmtoedit;
	//$('.pgmtoplay').click(function(){
	//$('.pgmtoplayedit').click(function(){	
		$('#table2').on('click', '.pgmtoplayedit', function() {
		//alert("clik pgm to play edit");
			
			
		       var lvrownum = $(this).attr('id');
				var currentRow=$(this).closest("tr"); 
				
				var cueid=$("#idcuesheet2").text();
				var pgmid=currentRow.find("td:eq(2)").text();
				mypgmtoedit=currentRow.find("td:eq(2)").text();
				mypgmtoedit=$.trim(mypgmtoedit);;
				var userid=currentRow.find("td:eq(3)").text();
				//var mydate=currentRow.find("td:eq(4)").text();
				//var mydate=setdate;

				var from=currentRow.find("td:eq(5)").text();
				var to=currentRow.find("td:eq(6)").text();
				var programname=currentRow.find("td:eq(7)").text();
				var filename=currentRow.find("td:eq(9)").text();
				var duration=currentRow.find("td:eq(8)").text();
				var remarks=currentRow.find("td:eq(11)").text();
				//alert("cueid="+cueid+" userid=" +userid+"pgmid="+pgmid+" from=" +from+" to=" +to+"pname="+programname+"fname="+filename+" duration" +duration+" remarks=" +remarks);
				filename= $.trim(filename);
						//alert("C:/inetpub/wwwroot/dd/myvideos/"+filename);
	
			$('#mymobileModalarea').modal('show');
			videojs('MY_VIDEO_2').ready(function () {
			myPlayer = this;
			$("#mymobileplayerstatus").html("Preview Player");
			myPlayer.src("sgmvideos//"+filename);
			//myPlayer.src("videos/02.HEADLINES NEW.mp4");
				myPlayer.load();
				myPlayer.play();
			});
			
	});
	
	
	/* $('#table2').on('click', '.pgmtoplayedit', function() {
    //function code here
	alert("clik pgm to playedit");
}); */
	$("#mymobileplayerclose").click(function () {
			//myPlayer2.pause();
			myPlayer.load("");
			videojs('MY_VIDEO_2').load("");
			
			
		});
		var actsecondsin;
		var actsecondsout;
		$("#btnmarkin").click(function(){
			var seconds = myPlayer.currentTime();
			//alert(seconds);
			actsecondsin=seconds;
			var myArr = seconds.toString().split('.');
seconds=parseInt(myArr[0]);
var milliseconds=myArr[1];
milliseconds=milliseconds.substr(0, 3);
milliseconds=parseInt(milliseconds);
			 var totalSeconds = seconds;
var hours = Math.floor(totalSeconds / 3600);
totalSeconds %= 3600;
var minutes = Math.floor(totalSeconds / 60);
seconds = totalSeconds % 60; 
console.log("hours: " + hours);
console.log("minutes: " + minutes);
console.log("seconds: " + seconds);
console.log("milliseconds: " + milliseconds);
// If you want strings with leading zeroes:
minutes = String(minutes).padStart(2, "0");
hours = String(hours).padStart(2, "0");
seconds = String(seconds).padStart(2, "0");
milliseconds = String(milliseconds).padStart(2, "0");
console.log(hours + ":" + minutes + ":" + seconds+ "." + milliseconds);
			
			
			
			$("#markin").val(hours + ":" + minutes + ":" + seconds+ "." + milliseconds);
		});
		
		$("#btnmarkout").click(function(){
			var seconds = myPlayer.currentTime();
			
			//alert(seconds);
			actsecondsout=seconds;
			var myArr = seconds.toString().split('.');
seconds=parseInt(myArr[0]);
var milliseconds=myArr[1];
milliseconds=milliseconds.substr(0, 3);
milliseconds=parseInt(milliseconds);
			 var totalSeconds = seconds;
var hours = Math.floor(totalSeconds / 3600);
totalSeconds %= 3600;
var minutes = Math.floor(totalSeconds / 60);
seconds = totalSeconds % 60; 
console.log("hours: " + hours);
console.log("minutes: " + minutes);
console.log("seconds: " + seconds);
console.log("milliseconds: " + milliseconds);
// If you want strings with leading zeroes:
minutes = String(minutes).padStart(2, "0");
hours = String(hours).padStart(2, "0");
seconds = String(seconds).padStart(2, "0");
milliseconds = String(milliseconds).padStart(2, "0");
console.log(hours + ":" + minutes + ":" + seconds+ "." + milliseconds);
			
			
			
			$("#markout").val(hours + ":" + minutes + ":" + seconds+ "." + milliseconds);
			//var editptok = iseditpointok(seconds,"markout");
		});
		
		$("#btncuein").click(function(){
			/* var seconds = $("#markin").val();
			mymediaduration=myPlayer.duration();
			if ((isNaN(seconds)) || (seconds < 0) || (seconds > mymediaduration) ) {
				//alertmy("Improper cue point", "In Point =" + inpoint);
				return;
			} */
			//alert(actsecondsin);
			myPlayer.currentTime(actsecondsin);
			myPlayer.pause();
		});
		
		$("#btncueout").click(function(){
			/* var seconds = $("#markout").val();
		
			mymediaduration=myPlayer.duration();
			if ((isNaN(seconds)) || (seconds < 0) || (seconds > mymediaduration) ) {
				//alertmy("Improper cue point", "In Point =" + inpoint);
				return;
			}
			 */
			myPlayer.currentTime(actsecondsout);
			myPlayer.pause();
			
		});
	
		
/* 	var $sortable = $( "#employeeList > tbody" );
  $sortable.sortable({
      stop: function ( event, ui ) {
          var parameters = $sortable.sortable( "toArray" );
           $.post("studentPosition.php",{value:parameters},function(result){
             // alert(result);
          });
      }
  }); */
	
	 /* $("#employeeList").on('click', '.update', function(){
		var empId = $(this).attr("id");
		var action = 'getEmployee';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:empId, action:action},
			dataType:"json",
			success:function(data){
				$('#employeeModal').modal('show');
				$('#empId').val(data.id);
				$('#empName').val(data.name);
				$('#empAge').val(data.age);
				$('#empSkills').val(data.skills);				
				$('#address').val(data.address);
				$('#designation').val(data.designation);	
				$('.modal-title').html("<i class='fa fa-plus'></i> Edit Employee");
				$('#action').val('updateEmployee');
				$('#save').val('Save');
			}
		})
	 });  */
	var myempID;
	 $("#employeeList").on('click', '.update', function(){
	
	           $("#from").prop("readonly",true);
				$("#to").prop("readonly",true);
	            $("#IN").prop("readonly",true);
				$("#OUT").prop("readonly",true);
				$("#Duration").prop("readonly",true);
	 
	 $("#save").show();
	  $("#savenew").hide();
		var empId = $(this).attr("id");
		
		//$("#name").prop("readonly",true);
		
		myempID=empId;
		var action = 'getEmployee';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:empId, action:action},
			dataType:"json",
			success:function(data){
			
				 $('#employeeModal').modal('show');
				
				$('#CueID').val(data.CueID);
				$('#UserID').val(data.UserID);
				$('#programname').val(data.Programname);
				$('#filename').val(data.filename);
			   var chkdummy= data.filename;
				$('#myDate').val(data.myDate);				
				$('#IN').val(data.INpoint);
				$('#OUT').val(data.OUTpoint);
				$('#from').val(data.fromreading);
				$('#to').val(data.toreading);	
				$('#Duration').val(data.Duration);
				$('#Remarks').val(data.Remarks);	
				if ((chkdummy==="dummy" ) || (chkdummy==="Promos" )){
				//alert(chkdummy);
				$("#from").prop("readonly",false);
	$("#to").prop("readonly",false);
	$("#Duration").prop("readonly",false);
				}
				$('.modal-title').html("<i class='fa fa-plus'></i> Edit Row");
				$('#action').val('updateEmployee');
				$('#save').val('Update'); 
			}
		})
		//$("#recalculate").trigger("click");
		gettotaltime();
	 });  
	$('#save').click(function(){
		var empId = myempID;
		var action = 'updateEmployee';
		var fromreading=$('#from').val();
		var toreading=$('#to').val();
		var Duration=getDuration(fromreading,toreading);
		//alert(fromreading+"//"+toreading+"//"+Duration);
		//return;
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:empId,
				programname:$('#programname').val(),
				filename:$('#filename').val(),
				UserID:$('#UserID').val(),
				IN:$('#IN').val(),
				OUT:$('#OUT').val(),
				fromreading:fromreading,
				toreading:toreading,
				myDate:$('#myDate').val(),
				Remarks:$('#Remarks').val(),
				//Duration:$('#Duration').val(),
				Duration:Duration,
				action:action},
			
			success:function(data){
				employeeData.ajax.reload();
				gettotaltime();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	gettotaltime();
	});
	
	
	$('#btnsaveinout').click(function(){
		//var empId = myempID;
		//alert("savinout");
		 employeeData2.destroy();
		var action = 'updateInOut';
		var mynewin=$("#markin").val();
		var mynewout=$("#markout").val();
		   // var duration =getDuration(mynewin,mynewout);   
		   
			 var duration =getDuration(mynewin,mynewout);    
		//alert(mypgmtoedit+"//"+mynewin+"//"+mynewout+"//"+duration);
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:mypgmtoedit,
				IN:mynewin,
				OUT:mynewout,
				Duration:duration,
			    action:action},
			
			success:function(data){
				alert("data in");
				
				
				loadmymedia();
				employeeData2.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	
	});
	 function gettotaltime(){
	
	 var rowCount = ($("#employeeList tr").length)-1;
	 var init_time="06:00:00";
	 //var init_time=$('#employeeList').find("tr:eq(1)").find("td:eq(6)").html();
	 var lat_time=$('#employeeList').find("tr:eq("+rowCount+")").find("td:eq(7)").html();
	var total= getDuration(init_time,lat_time);
	tottime=parseInt(total);
	$("#totaltime").text(total);
	 //$("#recalculate").trigger("click");
	 
	 }
	//old recalculate
	$('#recalculateold').click(function(){
	var action = 'recalculate';
	var rowCount = ($("#employeeList tr").length)-1;
	for (let i = 1; i <= rowCount; i++) {
	var myslottype=$('#employeeList').find("tr:eq("+i+")").find("td:eq(10)").html();
	
	if ((i===1) || (myslottype=="fixed")){
		 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();

	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 
	 
	
	}  else if  (myslottype!="fixed") {
	var prevto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html(prevto);
			 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();

	var myfrom=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html();
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var  newto= addDuration(myfrom,mydur);
	}
   $.ajax({
			url:'action.php',
			method:"POST",
			data:{myid:id,
			mydate:mydate,
				from:myfrom,
				to:newto,
				dur:mydur,
				Remarks:"",
				action:action},
			 async: false,
			success:function(data){
				employeeData.ajax.reload();
				//alert("returns:"+data);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	}) 
   if (i>1) {
	
	var preto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	var ctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();	

if (ctfrom>preto)
{
	//alert(ctfrom+"is not equla to "+ preto);
	adddummyrow(preto,ctfrom);
}
if (ctfrom<preto)
{
//alert("Over Run at Row:"+ (i-1));
	 var id= $('#employeeList').find("tr:eq("+(i-1)+")").find('.update').attr("id");
	 //alert(id);
		var action = 'updateoverrun';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:id, Remarks:"overrun",action:action},
			
			success:function(data){
				//alert("updated");
				employeeData.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
}
//employeeData.ajax.reload();
	}
	}	
		
	});
	
	//old recalculate
	
	//new 
	var globalto;
	var gpreto;
	var gctfrom;
	$('#recalculate').click(function(){
	var action = 'recalculate';
	var rowCount = ($("#employeeList tr").length)-1;
	 
	for (let i = 1; i <= rowCount; i++) {
	employeeData.ajax.reload();
	 if (i>1){
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();	
	 }
	var myslottype=$('#employeeList').find("tr:eq("+i+")").find("td:eq(10)").html();
	 var fname=$('#employeeList').find("tr:eq("+i+")").find("td:eq(4)").html();
	if (i===1) {
		 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 //var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myfrom="06:00:00";
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	 recaltime(id,mydate,myfrom,newto,mydur);
	
	} else if (fname=="dummy") {
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom="06:00:00";
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 //globalto=newto;
	 recaltime(id,mydate,myfrom,newto,mydur);
	}
	else  {
	if  (myslottype!="fixed"){
	var prevto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	//var prevto=globalto;
  
	$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html(prevto);
			 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	//var myfrom=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html();

	var myfrom=globalto;
	 //var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 //var  newto= addDuration(prevto,mydur);
	 var  newto= addDuration(globalto,mydur);
	 globalto=newto;
	 recaltime(id,mydate,myfrom,newto,mydur);
	}   else
	if  (myslottype=="fixed") {
	var preto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	var ctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();	
	
	 if (ctfrom>preto) {
	adddummyrow(preto,ctfrom);
	 }
	}   
	}  
	
	}	
		
	});
	
	function recaltime(id,mydate,myfrom,newto,mydur)
	{
	var action = 'recalculate';
	//alert(myfrom+"//"+newto+"//"+mydur);
	$.ajax({
			url:'action.php',
			method:"POST",
			data:{myid:id,
			mydate:mydate,
				from:myfrom,
				to:newto,
				dur:mydur,
				Remarks:"",
				action:action},
			 async: false,
			success:function(data){
				employeeData.ajax.reload();
				
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	}) 
	
	}
	
	function adddummyrow(dummyin,dummyout)
	{
	alert(dummyin+"//"+ dummyout);
	//return;
		var cueidselected=$("#idcuesheet2").text();
var startDateTime = $('#idmycuedate').val()+" "+dummyin ;
var endDateTime = $('#idmycuedate').val()+" "+dummyout ;
	var start_date= startDateTime ;
	var end_date= endDateTime ;
	var diff = new Date(end_date) - new Date(start_date);
    diff_time = diff/1000;
    //minutes = diff_time/(60);
    //hours = diff_time/(60*60);
    //days = diff_time/(60*60*24);
	//alert(diff_time+"//"+ hours+"//"+minutes);
	
	
	let totalSeconds = diff_time;
let hours = Math.floor(totalSeconds / 3600);
totalSeconds %= 3600;
let minutes = Math.floor(totalSeconds / 60);
let seconds = totalSeconds % 60;

//console.log("hours: " + hours);
//console.log("minutes: " + minutes);
//console.log("seconds: " + seconds);

// If you want strings with leading zeroes:
minutes = String(minutes).padStart(2, "0");
hours = String(hours).padStart(2, "0");
seconds = String(seconds).padStart(2, "0");
//console.log(hours + ":" + minutes + ":" + seconds);
	 var newDateTimeD = hours + ":" + minutes + ":" + seconds;

	
	//alert(dummyin+"//"+dummyout + "//" +newDateTimeD );
		var action = 'addrowofmontage';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueidselected,
				programname:"dummy",
				filename:"dummy",
				UserID:"???",
				IN:"",
				OUT:"",
				fromreading:dummyin,
				toreading:dummyout,
				myDate:$('#idmycuedate').val(),
				Remarks:"To be filled",
				Duration:newDateTimeD,
				action:action},
			async:false,
			success:function(data){
			
			employeeData.ajax.reload();
			//$("#recalculate").trigger("click");
				gettotaltime(); 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
		//window.setTimeout( recalculate, 5000 ); // 5 seconds
		gettotaltime();
	}
	
	
		$('#recalculated').click(function(){
	
	var action = 'recalculate';
	
	var rowCount = ($("#employeeList tr").length)-1;
          
	for (let i = 1; i <= rowCount; i++) {
	 	 
	
	if (i===1){
	 
		 var rmydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(4)").html();

	 var rmyfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var rmyto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var rmydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var rid= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
alert("added: before fn call");
	 
	 
	 var rnewto= addDurationn(rmyfrom,rmydur);
	
	 alert("added: after fn call");
		 return;
	
	}  else  {
	$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html(rnewto);
			 var rmydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(4)").html();

	var rmyfrom=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html();
	 var rmyto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var rmydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var rid= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var rnewto= addDurationn(rmyfrom,rmydur);
	 //alert("added: "+newto);
	
	}
	
	   
	 //alert(mytext);
   $.ajax({
			url:'action.php',
			method:"POST",
			data:{myid:rid,
			mydate:rmydate,
				from:rmyfrom,
				to:rnewto,
				dur:rmydur,
				action:action},
			 async: false,
			success:function(data){
				employeeData.ajax.reload();
				
				//alert("returns:"+data);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	}) 
	}	
		gettotaltime();
	});
	
	function getTo(from,dur) {
	alert("getto");
		var fromsecs = hmsToSecondsOnly(from);// split it at the colons
    var tosecs = hmsToSecondsOnly(dur); // split it at the colons
	alert (tosecs+"//"+fromsecs+"//"+ (tosecs+fromsecs));
	var finaladd = (tosecs+fromsecs);
  
	
	
	let totalSeconds = finaladd;
let hours = Math.floor(totalSeconds / 3600);
totalSeconds %= 3600;
let minutes = Math.floor(totalSeconds / 60);
let seconds = totalSeconds % 60;

//console.log("hours: " + hours);
//console.log("minutes: " + minutes);
//console.log("seconds: " + seconds);

// If you want strings with leading zeroes:
minutes = String(minutes).padStart(2, "0");
hours = String(hours).padStart(2, "0");
seconds = String(seconds).padStart(2, "0");
	seconds=parseFloat(seconds).toFixed(3);
//seconds=seconds.toFixed(3);
console.log(hours + ":" + minutes + ":" + seconds);
	 var newDateTimeD = hours + ":" + minutes + ":" + seconds;
	 
	  return newDateTimeD;	
	}
	
	function getDuration(from,to) {
	var fromsecs = hmsToSecondsOnly(from);// split it at the colons
    var tosecs = hmsToSecondsOnly(to); // split it at the colons
	//alert (tosecs+"//"+fromsecs+"//"+ (tosecs-fromsecs));
	var finaladd = (tosecs-fromsecs);
  
	
	
	let totalSeconds = finaladd;
let hours = Math.floor(totalSeconds / 3600);
totalSeconds %= 3600;
let minutes = Math.floor(totalSeconds / 60);
let seconds = totalSeconds % 60;

//console.log("hours: " + hours);
//console.log("minutes: " + minutes);
//console.log("seconds: " + seconds);

// If you want strings with leading zeroes:
minutes = String(minutes).padStart(2, "0");
hours = String(hours).padStart(2, "0");
seconds = String(seconds).padStart(2, "0");
	seconds=parseFloat(seconds).toFixed(3);
//seconds=seconds.toFixed(3);
console.log(hours + ":" + minutes + ":" + seconds);
	 var newDateTimeD = hours + ":" + minutes + ":" + seconds;
	 
	  return newDateTimeD;	
	 
				/*  var prodhrd = to; //to
				var conprod = from;//from
				//alert("1"+prodhrd+ "/" + conprod);
				prodhrdArr = prodhrd.split(":");
				//alert("2"+prodhrdArr);
				conprodArr = conprod.split(":");
				//alert("3"+conprodArr);
				var hh1 = parseInt(prodhrdArr[0]) - parseInt(conprodArr[0]);
				var mm1 = parseInt(prodhrdArr[1]) - parseInt(conprodArr[1]);
				var ss1 = parseInt(prodhrdArr[2]) - parseInt(conprodArr[2]);
				//var ss1 = parseFloat(prodhrdArr[2]) - parseFloat(conprodArr[2]);
                var ms1 = parseInt(prodhrdArr[3]) - parseInt(conprodArr[3]);
				
				alert(from+"//"+to +"//"+ss1);
				
				if (ss1 > 59) {
					var ss2 = ss1 % 60;
					var ssx = ss1 / 60;
					var ss3 = parseInt(ssx);//add into min
					var mm1 = parseInt(mm1) + parseInt(ss3);
					var ss1 = ss2;
				}
				if (mm1 > 59) {
					var mm2 = mm1 % 60;
					var mmx = mm1 / 60;
					var mm3 = parseInt(mmx);//add into hour
					var hh1 = parseInt(hh1) + parseInt(mm3);
					var mm1 = mm2;
				}
				//String(number).padStart(2, '0')
				hh1=String(hh1).padStart(2, '0');
				mm1=String(mm1).padStart(2, '0');
				ss1=String(ss1).padStart(2, '0');
				var finaladd = hh1 + ':' + mm1 + ':' + ss1;
				//alert(finaladd);
				
					//document.getElementById('to'+y).value = parseFloat(fromitem1)+parseFloat(result);
						//document.getElementById('to'+y).value = finaladd;
               return finaladd; */
	}
	function hmsToSecondsOnly(str) {
    var p = str.split(':'),
        s = 0, m = 1;

    while (p.length > 0) {
        s += m * parseFloat(p.pop(), 100);
        m *= 60;
		//alert(p+"//"+s+"//"+m);
    }

    return s;
}
	
	function addDuration(from,dur) {
	
	
				 var prodhrd = dur; //duration
				var conprod = from;//from
				//alert("1"+prodhrd+ "/" + conprod);
				prodhrdArr = prodhrd.split(":");
				//alert("2"+prodhrdArr);
				conprodArr = conprod.split(":");
				//alert("3"+conprodArr);
				var hh1 = parseInt(prodhrdArr[0]) + parseInt(conprodArr[0]);
				var mm1 = parseInt(prodhrdArr[1]) + parseInt(conprodArr[1]);
				var ss1 = parseInt(prodhrdArr[2]) + parseInt(conprodArr[2]);

				if (ss1 > 59) {
					var ss2 = ss1 % 60;
					var ssx = ss1 / 60;
					var ss3 = parseInt(ssx);//add into min
					var mm1 = parseInt(mm1) + parseInt(ss3);
					var ss1 = ss2;
				}
				if (mm1 > 59) {
					var mm2 = mm1 % 60;
					var mmx = mm1 / 60;
					var mm3 = parseInt(mmx);//add into hour
					var hh1 = parseInt(hh1) + parseInt(mm3);
					var mm1 = mm2;
				}
				//String(number).padStart(2, '0')
				hh1=String(hh1).padStart(2, '0');
				mm1=String(mm1).padStart(2, '0');
				ss1=String(ss1).padStart(2, '0');
				var finaladd = hh1 + ':' + mm1 + ':' + ss1;
				//alert(finaladd);
				
					//document.getElementById('to'+y).value = parseFloat(fromitem1)+parseFloat(result);
						//document.getElementById('to'+y).value = finaladd;
               return finaladd;
	}
	
		function addDurationn(from,dur) {
	
	
				 var rprodhrd = dur; //duration
				var rconprod = from;//from
				//alert("1"+prodhrd+ "/" + conprod);
				
				 rprodhrdArr = rprodhrd.split(":");
				//alert("2"+prodhrdArr);
				 rconprodArr = rconprod.split(":");
				//alert("3"+conprodArr);
				var hh1 = parseInt(rprodhrdArr[0]) + parseInt(rconprodArr[0]);
				var mm1 = parseInt(rprodhrdArr[1]) + parseInt(rconprodArr[1]);
				var ss1 = parseInt(rprodhrdArr[2]) + parseInt(rconprodArr[2]);

				if (ss1 > 59) {
					var ss2 = ss1 % 60;
					var ssx = ss1 / 60;
					var ss3 = parseInt(ssx);//add into min
					var mm1 = parseInt(mm1) + parseInt(ss3);
					var ss1 = ss2;
				}
				if (mm1 > 59) {
					var mm2 = mm1 % 60;
					var mmx = mm1 / 60;
					var mm3 = parseInt(mmx);//add into hour
					var hh1 = parseInt(hh1) + parseInt(mm3);
					var mm1 = mm2;
				}
				//String(number).padStart(2, '0')
				hh1=String(hh1).padStart(2, '0');
				mm1=String(mm1).padStart(2, '0');
				ss1=String(ss1).padStart(2, '0');
				var rfinaladd = hh1 + ':' + mm1 + ':' + ss1;
				//alert(finaladd);
				
					//document.getElementById('to'+y).value = parseFloat(fromitem1)+parseFloat(result);
						//document.getElementById('to'+y).value = finaladd;
               return rfinaladd;
	}
	
	$("#employeeModal").on('submit','#employeeForm', function(event){
		event.preventDefault();
		$('#save').attr('disabled','disabled');
		var formData = $(this).serialize();
		$.ajax({
			url:"action.php",
			method:"POST",
			data:formData,
			success:function(data){				
				$('#employeeForm')[0].reset();
				$('#employeeModal').modal('hide');				
				$('#save').attr('disabled', false);
				employeeData.ajax.reload();
				
			}
		})
		gettotaltime();
	});		
	$("#employeeList").on('click', '.delete', function(){
		var empId = $(this).attr("id");		
		var action = "empDelete";
		if(confirm("Are you sure you want to delete this employee?")) {
			$.ajax({
				url:"action.php",
				method:"POST",
				data:{empId:empId, action:action},
				success:function(data) {					
					
					
					employeeData.ajax.reload();
					//$("#recalculate").trigger("click");
					gettotaltime();
				}
				
			})
		} else {
			return false;
		}
		gettotaltime();
		//$("#recalculate").trigger("click");
	}
	
	);	
	
	var $sortable = $( "#employeeList > tbody" );
	$sortable.sortable({
      stop: function ( event, ui ) {
          var parameters = $sortable.sortable( "toArray" );
          /* $.post("studentPosition.php",{value:parameters},function(result){
              alert(result);
          }); */
      }
  });
	
	
	$('#table22 tr td').click(function(){
    var cid = $(this).attr('id');
    alert(cid);
    var cval = $(this).text();
    alert(cval);
});
var rowCount1;
var rowcountforpgm;
var pgmidtoedit;

	//$('.pgmclass').on('click',function() {
		$('#table2').on('click', '.pgmclass', function() {
   var rowCount = $('#employeeList tr').length;
    var rowCountdata=  employeeData.rows().count();
   rowCount1=parseInt(rowCount);
   //alert(rowCount+"//"+rowCountdata);
   if (rowCountdata>0) {
	var to=$("#employeeList tr:nth-child("+(rowCount-1)+") td:nth-child(8)").text();// 8th column is to time
	var from=to;
	//alert(from);
   } else  {
   	//var to="06:00:00";// 8th column is to time
	var from="06:00:00";
//alert(from);
   }
	$("#displayhtml").text(to);
		var setdate=$("#idmycuedate").val();
		var lvrownum = $(this).attr('id');
						//alert(lvrownum);

				var currentRow=$(this).closest("tr"); 
				//alert(currentRow);
	pgmidtoedit=currentRow.find("td:eq(2)").text();
				var userid=currentRow.find("td:eq(3)").text();
				//var mydate=currentRow.find("td:eq(4)").text();
				var myinpt=currentRow.find("td:eq(5)").text();
				var myoutpt=currentRow.find("td:eq(6)").text();
				var cueid=$("#idcuesheet2").text();
				var mydate=setdate;
				var duration=currentRow.find("td:eq(8)").text();
				//var from=to;
				var newto=addDuration(from,duration);
				var programname=currentRow.find("td:eq(7)").text();
				var filename=currentRow.find("td:eq(9)").text();
				var remarks=currentRow.find("td:eq(11)").text();
				//alert("cueid="+cueid+" userid=" +userid+"date="+mydate+" from=" +from+" to=" +newto+"pname="+programname+"fname="+filename+" duration" +duration+" remarks=" +remarks +" inpt=" +myinpt +" outpt=" +myoutpt);
				
				var action = 'addEmployee';

				
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				programname:programname,
				//programname:programname,
				UserID:userid,
				IN: myinpt,
				OUT: myoutpt,
				myDate:mydate,
				fromreading:from,
				toreading:newto,
				filename:filename,
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
		gettotaltime();
		
});

$('#btnsaveinoutt').click(function(){
		//var empId = myempID;
		//alert("savinout");
		 employeeData2.destroy();
		var action = 'updateInOut';
		var mynewin=$("#markin").val();
		var mynewout=$("#markout").val();
		   // var duration =getDuration(mynewin,mynewout);   
		   
			 var duration =getDuration(mynewin,mynewout);    
		//alert(mypgmtoedit+"//"+mynewin+"//"+mynewout+"//"+duration);
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				programname:programname,
				//programname:programname,
				UserID:userid,
				IN: myinpt,
				OUT: myoutpt,
				myDate:mydate,
				fromreading:from,
				toreading:newto,
				filename:filename,
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
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:mypgmtoedit,
				IN:mynewin,
				OUT:mynewout,
				Duration:duration,
			    action:action},
			
			success:function(data){
				alert("data in");
				
				
				loadmymedia();
				employeeData2.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	
	});


	//$(".myrow").click(function() {
		$('.pgmclasss').on('click',function() {
			//$('#table2').on('click', '.pgmclass', function() {
   //evID = $(this).closest('tr').attr("id");
   //evID=evID.substring(0,5);
  
	var setdate=$("#idmycuedate").val();
	//alert(setdate);
				var lvrownum = $(this).attr('id');
				var currentRow=$(this).closest("tr"); 
				
				var cueid=$("#idcuesheet2").text();
				var pgmid=currentRow.find("td:eq(2)").text();
				var userid=currentRow.find("td:eq(3)").text();
				//var mydate=currentRow.find("td:eq(4)").text();
				var mydate=setdate;

				var from=currentRow.find("td:eq(5)").text();
				var to=currentRow.find("td:eq(6)").text();
				var programname=currentRow.find("td:eq(7)").text();
				var filename=currentRow.find("td:eq(9)").text();
				var duration=currentRow.find("td:eq(8)").text();
				var remarks=currentRow.find("td:eq(11)").text();
				alert("cueid="+cueid+" userid=" +userid+"date="+mydate+" from" +from+" to=" +to+"pname="+programname+"fname="+filename+" duration" +duration+" remarks=" +remarks);
				
				
						var action = 'addEmployee';

				$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueid,
				programname:programname ,
				//programname:programname,
				UserID:userid,
				IN:from,
				OUT:to,
				myDate:mydate,
				filename:filename,
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
	gettotaltime();
					//$("#mycontent").html(myid+"/n"+myext);
			});
			
			
			
			/* $("#employeeList input").on( 'keyup', function () {
    tableInstance.search( this.value ).draw(); // try this easy code and check if works at first
} );
	 */
});  