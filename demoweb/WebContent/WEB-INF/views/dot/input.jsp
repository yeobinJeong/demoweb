<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>Home</title>
	<script type="text/javascript">
	
	var dot = document.getElementsByClassName("dot");
	var input = document.getElementsByClassName("input");
	var color = document.getElementsByClassName("color");
	var currColor;
	
	
	function dotClick(event){
		var target = event.target;
		
		if(target.style.backgroundColor == "white"){
			target.style.backgroundColor = currColor;
			input[target.id].value= currColor;
		}else{
			target.style.backgroundColor ="white";
			input[target.id].value='0';
		}
					
		
	}
	
	
	
	
	function dotDisplay(event){
		
		document.write("<div align='center' style='margin-top: 30px'>");
		document.write("<table  border='2'>");
		<%for(int i = 0; i< 40; i++){%>
			document.write("<tr>")
			<%for (int j =0; j< 40; j++){ %>
				
				document.write("<td class='dot' id='<%=(i*40)+j%>' style='width: 10px; height: 10px; background-color: white;'></td>");
					
			<%}%>
			document.write("</tr>");
		<%}%>
			document.write("</table>");
			document.write("</div>");
			
	}
	window.onload = function(event){
		//dotDisplay();
		for(var i=0; i<dot.length; i++){
			dot[i].addEventListener("click", dotClick);
		}
		
		for(var i=0; i<color.length; i++){
			color[i].addEventListener("click", function(event){
				var target = event.target;
				currColor = target.style.backgroundColor;
			});
		}
	
	}
	
	</script>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
</head>
<body>
	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp">
			<jsp:param value="palegreen" name="background" />
		</jsp:include>
		<div class="colorList" style="float: left; margin-top: 30px">
			<table>
			<tr>
				<td class='color' style="background-color: #222222; width: 15px;height: 10px"></td>
				<td>Black</td>
			</tr>
			<tr>	
				<td class='color' style="background-color: #FFFF99; width: 15px;height: 10px"></td>
				<td>Yellow</td>
			</tr>
			<tr>	
				<td class='color' style="background-color: #FF9999; width: 15px;height: 10px"></td>
				<td>Red</td>
			</tr>
			<tr>	
				<td class='color' style="background-color: #663300; width: 15px;height: 10px"></td>
				<td>Brown</td>
			</tr>
			
			<tr>	
				<td class='color' style="background-color: #FFCC00; width: 15px;height: 10px"></td>
				<td>pooh Yellow</td>
			</tr>
			
				
				
			
			</table>
			
		</div>
		<div align='center' style='margin-top: 30px'>
		<form id="registerform" action="input.action" method="post"> 
			<table  border='2'>
				<%for(int i = 0; i< 40; i++){%>
					<tr>
					<%for (int j =0; j< 40; j++){ %>
						
						<td class='dot' id='<%=(i*40)+j%>' style='width: 9px; height: 9px; background-color: white;'>
						<input class='input' type='hidden' value='0' name='<%=(i*40)+j%>'/>
						</td>
						
					<%}%>
					</tr>
				<%}%>
			</table>
			<div class="buttons">
			<input type="submit" value="등록" style="height:25px" />
			</div>
		</form>
		</div>
		
		
	</div>

</body>
</html>


