window.onload=function(){
 	if(document.getElementById("form")!=null){
 		document.getElementById("form").onsubmit=function(){
 			var ocontent=document.getElementsByName("content");
 			var flag=0;
 			for(iCv=0;iCv<ocontent.length;iCv++)
 			{
 				if(ocontent.item(iCv).checked){
 					flag+=1;
 				}
 			}
 			if(flag==0){
 				window.alert("需选择内容！");
 			}
 			var oradio=document.getElementsByName("inlineRadioOptions");
 			var fla=0;
 			for(iCv=0;iCv<oradio.length;iCv++){
 				if(oradio.item(iCv).checked){
 					fla+=1;
 				}
 			}
 			if(fla==0){
 				window.alert("需选择状态！");
 			}
 			var odocument=document.getElementById("picpath")
 			return false;
 		}
 	}
 	var oDt=new Date();
	var sWd="";
	var iWeekDay=oDt.getDay();
	switch(iWeekDay){
		case 0:
		sWd="星期日";break;
		case 1:
		sWd="星期一";break;
		case 2:
		sWd="星期二";break;
		case 3:
		sWd="星期三";break;
		case 4:
		sWd="星期四";break;
		case 5:
		sWd="星期五";break;
		case 6:
		sWd="星期六";break;
	}
	var iMonth=parseInt(oDt.getMonth())+1;
	document.getElementById("displaydate").innerHTML="<span>"+oDt.getFullYear()+"年"+iMonth+"月"+oDt.getDate()+"日"+sWd+"</span>";
	var iTimerid =window.setInterval("showtime()",1000);

}
function addfile(){
	document.getElementById("picpath").click();
}
function changepic() {
    var reads= new FileReader();
    f=document.getElementById("picpath").files[0];
    reads.readAsDataURL(f);
    reads.onload=function (e) {
    document.getElementById("show").src=this.result;
    };
}
function summitpic(){
	var	file=document.getElementById("picpath").files[0];
	
	if(file){

	}
	else{
		alert("需上传图片");
	}
}
function showtime(){
	var oDt=new Date();
	var iTimerid;
	var sTime="";
	if(oDt.getHours()<10){
		sTime+="0"+oDt.getHours()+":";
	}
	else{
		sTime+=oDt.getHours()+":";
	}
	if(oDt.getMinutes()<10){
		sTime+="0"+oDt.getMinutes()+":";
	}
	else{
		sTime+=oDt.getMinutes()+":";
	}
	if(oDt.getSeconds()<10){
		sTime+="0"+oDt.getSeconds()+":";
	}
	else{
		sTime+=oDt.getSeconds();
	}
	document.getElementById("displaytime").innerHTML="<span>"+sTime+"</span>";
}
