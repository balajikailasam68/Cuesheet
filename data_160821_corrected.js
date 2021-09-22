$(document).ready(function(){
	    var date=$("#idmycuedate").val();
		var inittime="0600to1400";
		loadnews();
		loadmontage();
		 //var selectedcuesheet=$("#idcuesheet2").text();
		 $("#idcuesheet2").text("0600to1400");
		loadmycuesheet(date,"0600to1400");
		
		 var employeeData;
		 
	
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
			title:"Cuesheet:"+date +"</br> for:"+ selectedcuesheet,
                exportOptions: {
                    columns: [ 0, 2, 3,  5, 6 ,7 ]
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
		
		/* buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ], */
		
		"columnDefs":[
		    /* {
                "targets": [ 10 ],
                "visible": false,
               
            }, */
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
	
	var employeeData2 = $('#table2').DataTable({
	
	
		"processing":true
	
		
	});	
	
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
				employeeData.ajax.reload();
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
		var newsname;
		var newsslot;
		
		var mnewsin;
		var mnewsout;
		var mnewsdur;
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
				action:action},
			
			success:function(data){
			
			employeeData.ajax.reload();
				 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
	}
	
	function addmontagetocuesheet()
	{
			var cueidselected=$("#idcuesheet2").text();

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
				action:action},
			
			success:function(data){
			
			employeeData.ajax.reload();
				 
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
		
		}); 
	
	$('#addEmployee').click(function(){
			
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
	
/* 	var $sortable = $( "#employeeList > tbody" );
  $sortable.sortable({
      stop: function ( event, ui ) {
          var parameters = $sortable.sortable( "toArray" );
           $.post("studentPosition.php",{value:parameters},function(result){
              alert(result);
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
	 
		var empId = $(this).attr("id");
		
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
				$('#myDate').val(data.myDate);				
				$('#IN').val(data.INpoint);
				$('#OUT').val(data.OUTpoint);	
				$('#Duration').val(data.Duration);
				$('#Remarks').val(data.Remarks);	
				$('.modal-title').html("<i class='fa fa-plus'></i> Edit Row");
				$('#action').val('updateEmployee');
				$('#save').val('Update'); 
			}
		})
	 });  
	$('#save').click(function(){
		var empId = myempID;
		var action = 'updateEmployee';
		
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:empId,
				programname:$('#programname').val(),
				filename:$('#filename').val(),
				UserID:$('#UserID').val(),
				IN:$('#IN').val(),
				OUT:$('#OUT').val(),
				myDate:$('#myDate').val(),
				Remarks:$('#Remarks').val(),
				Duration:$('#Duration').val(),
				action:action},
			
			success:function(data){
				employeeData.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	});
	
	$('#recalculate').click(function(){
	
	var action = 'recalculate';
	 //var mydate=$('#employeeList').find("tr:eq(5)").find("td:eq(4)").html();
	 alert("recal");
	 //var empId = $(this).attr("id");
	 
	 //var mytext=$('#employeeList').find("tr:eq(2)").find("td:eq(9)").text();
	 //alert(mytext);
	var rowCount = ($("#employeeList tr").length)-1;
            //alert(rowCount); 
			 //alert($('#employeeList').find("tr:eq(2)").children('.update').html());
		//var id = $(employeeList).closest("2").find("td:eq(2)").text();
		//var id = $('#employeeList').find("tr:eq(2)").find("td:eq(9)").attr("id");
	//var id=$('#employeeList').find("tr:eq(2)").find("td:eq(9)").attr("id");
	//var id  = $('#employeeList').find("tr:eq(2)").parent().find('td:eq(9)').attr("id");
	//var idd= $('#employeeList').find("tr:eq(2)").find('.update').attr("id");
    //alert('The id is ' + id);
	//var myid=$("#header_row th a:eq(9)").attr("id");'td:eq(5)'
		//alert(id);
			/* while ( i < 5) {
		alert($(this).closest('tr').find('.userID').text());	
 
  i++;
}	 */
	for (let i = 1; i <= rowCount; i++) {
	/*  var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id"); */
    //alert('text: '+myfrom+"/"+myto+ "/"+mydur+' ID is :' + id);
	var myslottype=$('#employeeList').find("tr:eq("+i+")").find("td:eq(10)").html();
	//alert (myslottype);
	
	if ((i===1) || (myslottype=="fixed")){
		 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();

	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 
	 //alert("added: "+newto);
	 
	
	}  else if (myslottype!="fixed") {
	$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html(newto);
			 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();

	var myfrom=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(6)").html();
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 //alert("added: "+newto);
	}
		
		
	
	//alert(mytext);
   $.ajax({
			url:'action.php',
			method:"POST",
			data:{myid:id,
			mydate:mydate,
				from:myfrom,
				to:newto,
				dur:mydur,
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

/* if (ctfrom!=preto)
{
	alert(ctfrom+"is not equla to "+ preto);
	adddummyrow(preto,ctfrom);
} */
if (ctfrom>preto)
{
	alert(ctfrom+"is not equla to "+ preto);
	adddummyrow(preto,ctfrom);
}
if (ctfrom<preto)
{
	alert("Over Run");
	//('#employeeList').find("tr:eq("+i+")").find("td:eq(3)").html("OVER RUN");	
	//$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(3)").css('background-color','red');
	//adddummyroww(preto,ctfrom);
	$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").removeClass("").addClass("red");
}
	}
	}	
		//employeeData.ajax.reload();
	 
	 
		
		/* $.ajax({
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
				employeeData.ajax.reload();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		
	})
	 */
	});
	
	function adddummyrow(dummyin,dummyout)
	{
	
		var cueidselected=$("#idcuesheet2").text();
	
//var startDateTime = '26-12-2020 '+dummyin ;
//var endDateTime = '26-12-2020 '+dummyout ;
var startDateTime = $('#idmycuedate').val()+dummyin ;
var endDateTime = $('#idmycuedate').val()+dummyout ;

    /* var startTime = moment(dummyin, 'hh:mm:ss');
    var endTime = moment(dummyout, 'hh:mm:ss');
  
    var hoursDiff = endTime.diff(startTime, 'hours');
    console.log('Hours:' + hoursDiff);
  
    var minutesDiff = endTime.diff(startTime, 'minutes');
    console.log('Minutes:' + minutesDiff); */
  
  
  /* var splitted1 = dummyin.split(":");
var splitted2 = dummyout.split(":");
var time1 = splitted1[0]+splitted1[1];
var time2 = splitted2[0]+splitted2[1];
var hours;
var minutes;
alert(time1 +"//"+time2);
if (time1 < time2) {
var diff = getTimeDiff("'{'"+time2+"'}'", "'{'"+time1+"'}'", 'm');
alert("diff");
hours = Math.floor((diff/60));
minutes =(diff%60);
} else {
var diff1 = getTimeDiff('24:00', '{time1}', 'm'); 
var diff2 = getTimeDiff('{time2}', '00:00', 'm');
var totalDiff = diff1+diff2;
hours = Math.floor((totalDiff/60));
minutes =(totalDiff%60);
};

alert(hours + " hours, " + minutes + " minutes");
  
  return; */
  
 /* var getH=  moment .duration(moment(endDateTime, 'YYYY/MM/DD HH:mm') .diff(moment(startDateTime, 'YYYY/MM/DD HH:mm')) ).asHours();
  var getM=  moment .duration(moment(endDateTime, 'YYYY/MM/DD HH:mm') .diff(moment(startDateTime, 'YYYY/MM/DD HH:mm')) ).asMinutes();

 var getS=  moment .duration(moment(endDateTime, 'YYYY/MM/DD HH:mm') .diff(moment(startDateTime, 'YYYY/MM/DD HH:mm')) ).asSeconds();

 alert(getH+":"+ getM +":"+getS);
  return; */
   /*  var secondsDiff = endTime.diff(startTime, 'seconds');
    console.log('Seconds:' + secondsDiff);
alert(hoursDiff+":"+minutesDiff+":"+secondsDiff); 
var newdiff=hoursDiff+":"+minutesDiff+":"+secondsDiff; */

var startDateTime = dummyin ;
var endDateTime = dummyout ;

    //alert(startDateTime+ " //// " +endDateTime);
	var prodhrdArr = dummyin.split(":");
    var newDateTime = moment(endDateTime, "hh:mm:ss").subtract(prodhrdArr[0], "hours").subtract(prodhrdArr[1], "minutes").subtract(prodhrdArr[2], "seconds").format('hh:mm:ss');
	        
	
	
	//var startDateTime = $('#idmycuedate').val()+dummyin ;
//var endDateTime = $('#idmycuedate').val()+dummyout ;
var startDateTime = $('#idmycuedate').val()+" "+dummyin ;
var endDateTime = $('#idmycuedate').val()+" "+dummyout ;
alert(startDateTime +"//"+endDateTime );
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

	/*var __duration = moment.duration(moment(endDateTime).diff(startDateTime));
	 var a = moment(dummyin, "HH:mm:ss");
var b = moment(dummyout, "HH:mm:ss");
	var newdiff=b.diff(a, 'hours')+":"+b.diff(a, 'minutes')+":"+b.diff(a, 'seconds'); // 12*/
//alert(__duration); 
//alert(newDateTime);
//return;
	alert(dummyin+"//"+dummyout + "//" +newDateTime );
		var action = 'addrowofmontage';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{cueID:cueidselected,
				programname:"dummy",
				filename:"dummy",
				UserID:"???",
				IN:dummyin,
				OUT:dummyout,
				myDate:$('#idmycuedate').val(),
				Remarks:"To be filled",
				Duration:newDateTimeD,
				action:action},
			
			success:function(data){
			
			employeeData.ajax.reload();
				 
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
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
		//employeeData.ajax.reload();
	 
	 
		
		
	});
	function getDuration(from,to) {
	
	
				 var prodhrd = to; //to
				var conprod = from;//from
				//alert("1"+prodhrd+ "/" + conprod);
				prodhrdArr = prodhrd.split(":");
				//alert("2"+prodhrdArr);
				conprodArr = conprod.split(":");
				//alert("3"+conprodArr);
				var hh1 = parseInt(prodhrdArr[0]) - parseInt(conprodArr[0]);
				var mm1 = parseInt(prodhrdArr[1]) - parseInt(conprodArr[1]);
				var ss1 = parseInt(prodhrdArr[2]) - parseInt(conprodArr[2]);

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
				}
			})
		} else {
			return false;
		}
	});	
	
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
	$('.pgmclasss').on('click',function() {
   //evID = $(this).closest('tr').attr("id");
   //evID=evID.substring(0,5);
   //alert(evID);
   //alert($(this).closest('tr'));
   //var currentRow=$(this).closest('tr'); 
   //var userid=currentRow.find("td:eq(3)").text();
   //alert(userid);
});
	//$(".myrow").click(function() {
		$('.pgmclass').on('click',function() {
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
				programname:programname +" \n  <i><b><u> Reading </u></b></i> \n from:"+from +"\n to:"+to,
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
					//$("#mycontent").html(myid+"/n"+myext);
			});
			
			
			
			/* $("#employeeList input").on( 'keyup', function () {
    tableInstance.search( this.value ).draw(); // try this easy code and check if works at first
} );
	 */
});  