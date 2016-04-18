﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>Home</title>
	<script type="text/javascript">
	<% String[] dotData = (String[])request.getAttribute("index"); %>
	<% String[] dotColor = (String[])request.getAttribute("color");%>
	dot = document.getElementsByClassName("dot");
	var timer = null;
	var varindex= [];
	var count = 1;
	function dotMove(event){
		<% String[] dotIndex = new String[dotData.length];%>
		
			if(count == 1){
		
				<% for(int i=0; i<dotData.length; i++) {%>
				
				
					<%				
					int temp2 = Integer.parseInt(dotData[i]);
					temp2 -= 2;
					String temp;
					temp = String.valueOf(temp2);
					
					%>
					
					varindex[<%=i%>] = <%=temp%> 
					
				
				<%}%>
				count += 1;
			} else if (count < 5){
				// 처음이 아닌경우 이전 픽셀 값에서 -2 하는 구문
				<% for(int i=0; i<dotData.length; i++) {%>
					varindex[<%=i%>] = varindex[<%=i%>] -2; 
				<%}%>
				count += 1;
				
			} else {
				
				<% for(int i=0; i<dotData.length; i++) {%>
					varindex[<%=i%>] = varindex[<%=i%>] +2; 
				<%}%>
				
				count += 1;
				if(count == 9){
					count =2;
				}
			}
			
			dotClean();
			
			<% for(int i=0; i<dotData.length; i++) {%>
				var index = varindex[<%=i%>];
				
				
				<%-- var color = eval("<%=dotColor[i]%>"); --%>
				dot[index].style.backgroundColor = "rgb(102, 51, 0)";
				
			<%}%>
			
		
			timer =  window.setTimeout("dotMove()", 500);
		
	}
	
	
	
	
	function dotDisplay(event){
		
		<% for(int i=0; i<dotData.length; i++) {%>
			<%-- var index = <%= Integer.parseInt(dotIndex[i]) %> --%>
			var index = varindex[<%=i%>];
			/* alert(varindex[0]); */
			<%-- dot[index].style.backgroundColor = <%=dotColor[Integer.parseInt(dotData[i])]%>; --%>
		<%}%>
				
	}
	
	function dotClean(event){
		
		for(var i=0; i<dot.length; i++){
			
			dot[i].style.backgroundColor = "white";
		}
	}
	function doStart(event){

			timer =  window.setTimeout("dotMove()", 500);
	}
	
	function doStop(event){
		window.clearTimeout(timer);
		
	}
	
	
	
	
	
	
	window.onload = function(event){
	
			
		doStart();
		
		
		
	}
	
	
	</script>
	<style type="text/css"></style>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp">
			<jsp:param value="palegreen" name="background" />
		</jsp:include>
		
		
		
		
		<div align='center' style='margin-top: 30px'>
			
			<%-- <table  border='2'>
				 <%for(int i = 0; i< 40; i++){%>
					<tr>
					<% for(int j =0; j< 40; j++){ %>
						
						<% boolean active = true;%> 
						<% String index = String.valueOf((i*40)+j); %>	
							
							<% for( int k =0; k<dotData.length; k++) {%>
									
								<% if( dotData[k].equals(index) ) { %>
									<td class='dot' id='<%=(i*40)+j%>' style='width: 9px; height: 9px; background-color: black;'></td>
									<% active = false;%> 
									
								<%} %>
							<%} %>
						
						<%if(active){%>
							<td class='dot' id='<%=(i*40)+j%>' style='width: 9px; height: 9px; background-color: white;'></td>
						<% }%>
						
					<%}%>
					</tr>
				<%}%> 
			</table> --%>
			
			<table  border='2'>
				 <%for(int i = 0; i< 40; i++){%>
					<tr>
					<% for(int j =0; j< 40; j++){ %>
										
						<td class='dot' id='<%=(i*40)+j%>' style='width: 9px; height: 9px; background-color: white;'></td>
												
					<%}%>
					</tr>
				<%}%> 
			</table>
	
		</div>
		
		
	</div>

</body>
</html>

