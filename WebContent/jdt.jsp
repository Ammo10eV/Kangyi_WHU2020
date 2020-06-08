<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" > 
<head> 
<title>进度条</title> 
<style type="text/css"> 
body{ 
text-align:center; 
} 
.graph{ 
width:450px; 
border:1px solid #F8B3D0; 
height:25px; 
} 
#bar{ 
display:block; 
background:#FFE7F4; 
float:left; 
height:100%; 
text-align:center; 
} 
#barNum{ 
position:absolute; 
} 
</style> 
<script type="text/javascript"> 
function $(obj){ 
return document.getElementById(obj); 
} 
function go(){ 
$("bar").style.width = parseInt($("bar").style.width) + 1 + "%"; 
$("bar").innerHTML = $("bar").style.width; 
if($("bar").style.width == "100%"){ 
window.clearInterval(bar); 
} 

} 
var bar = window.setInterval("go()",50); 
window.onload = function(){ 
bar; 
} 
</script> 
</head> 
<body> 
<div class="graph"> 
<strong id="bar" style="width:1%;"></strong> 
</div> 
</body> 
</html> 