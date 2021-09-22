// sl no-1 cue id -2 user-3 pgm-4 filename-5 date-6 from-7 to-8 duration-9 remarks-10  take -1 for actuals since start from zero   

if (i>1)  {
	
	var preto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	var ctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();	
	
//alert(ctfrom+"//"+preto);
   if (ctfrom>preto) {
     if  (myslottype!="fixed"){
	var action = 'recalculate';
	var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	var myid= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	var mynewto= getTo(preto,mydur);
	//alert(i+"//"+ctfrom+"//"+preto+"//"+myid+"//"+mynewto+"//"+mydur);
	//adddummyrow(preto,ctfrom);
	
	$.ajax({
		
			url:'action.php',
			method:"POST",
			data:{myid:myid,
			mydate:mydate,
				from:preto,
				to:mynewto,
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
		
	}) ;
	
	
} else {

adddummyrow(preto,ctfrom);
	 }
   }
  /* if ((ctfrom>preto) &&  (myslottype=="fixed"))
 {
	
	adddummyrow(preto,ctfrom);
 }  */
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
				gettotaltime();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
}
if (ctfrom=preto)
{
//alert("Over Run at Row:"+ (i-1));
	 var id= $('#employeeList').find("tr:eq("+(i-1)+")").find('.update').attr("id");
	 //alert(id);
		var action = 'updateoverrun';
		$.ajax({
			url:'action.php',
			method:"POST",
			data:{empId:id, Remarks:"",action:action},
			
			success:function(data){
				//alert("updated");
				employeeData.ajax.reload();
				gettotaltime();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status, thrownError);
			}
		})
} 
employeeData.ajax.reload();
	}
	
	// overrun code 
	/* else if ((i>1)&&(gctfrom<gpreto)&&(myslottype=="fixed")) {
		 // if (gctfrom>gpreto) {
	alert(gctfrom+"//"+gpreto);
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom=gpreto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 //globalto=newto;
	 alert("OR");
	  var rem="Overrun";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 
	}   */
	
	// recalculate code
	var action = 'recalculate';
	var rowCount = ($("#employeeList tr").length)-1;
	 
	for (let i = 1; i <= rowCount; i++) {
	//employeeData.ajax.reload();
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
	 var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	
	}
	else if ((i>1)&&((fname=="dummy") || (myslottype=="fixed"))&&(gctfrom<gpreto)) {
	//else if ((i>1)&&((fname=="dummy") || (myslottype=="fixed"))) {
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom="06:00:00";
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	} 
	else if ((i>1)&& (fname!="dummy") && (myslottype!="fixed") ){
	
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 //var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myfrom=globalto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	} 
	else if ((gctfrom>gpreto)&&(myslottype!="fixed")) {
		 // if (gctfrom>gpreto) {
	//alert(gctfrom+"//"+gpreto);
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom=gpreto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	 
	  var rem="gap";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 
	}  
	
	
	}	
	
	//recalculate function function recalfunction(){
	
var action = 'recalculate';
	var rowCount = ($("#employeeList tr").length)-1;
	 
	for (let i = 1; i <= rowCount; i++) {
	//employeeData.ajax.reload();
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
	 var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	
	}
	else if ((i>1)&&((fname=="dummy") || (myslottype=="fixed"))&&(gctfrom<gpreto)) {
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom="06:00:00";
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	} 
	else if ((i>1)&& (fname!="dummy") && (myslottype!="fixed")) {
	
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 //var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myfrom=globalto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	} 
	else if ((gctfrom>gpreto)&&(myslottype=="fixed")) {
		 // if (gctfrom>gpreto) {
	alert(gctfrom+"//"+gpreto);
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom=gpreto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	 alert("gap");
	  var rem="gap";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 
	}  
	
	
	}	
		
	}

// calculate manual
$('#recalculate').click(function(){
	employeeData.ajax.reload();
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
	 var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	employeeData.ajax.reload();
	}
	else if ((i>1)&&((fname=="dummy") || (myslottype=="fixed"))&&(gctfrom<gpreto)) {
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom="06:00:00";
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 employeeData.ajax.reload();
	 employeeData.ajax.reload();
	} 
	else if ((i>1)&& (fname!="dummy") && (myslottype!="fixed")) {
	
	 gpreto=$('#employeeList').find("tr:eq("+(i-1)+")").find("td:eq(7)").html();
	 gctfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 //var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 var myfrom=globalto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	  var rem="";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 employeeData.ajax.reload();
	} 
	else if ((gctfrom>gpreto)&&(myslottype=="fixed")) {
		 // if (gctfrom>gpreto) {
	alert(gctfrom+"//"+gpreto);
	// else if ((fname=="dummy") && (gctfrom>gpreto)){
	 var mydate=$('#employeeList').find("tr:eq("+i+")").find("td:eq(5)").html();
	 var myfrom=$('#employeeList').find("tr:eq("+i+")").find("td:eq(6)").html();
	 //var myfrom=gpreto;
	 var myto=$('#employeeList').find("tr:eq("+i+")").find("td:eq(7)").html();
	 var mydur=$('#employeeList').find("tr:eq("+i+")").find("td:eq(8)").html();
	 var id= $('#employeeList').find("tr:eq("+i+")").find('.update').attr("id");
	 var newto= addDuration(myfrom,mydur);
	 globalto=newto;
	
	  var rem="gap";
	 recaltime(id,mydate,myfrom,newto,mydur,rem);
	 employeeData.ajax.reload();
	}  
	
	
	}
	});


// calculate manual