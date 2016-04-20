<%@ page language="java" contentType="text/html; charset=utf-8"
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
	var varcolor= [];
	
	
	function dotMove(event){
		
		
			
				
				
			

			for(var i=0; i<2; i++)
			{
				timer =  window.setTimeout("doDelay()", 2000);
				moveLeft();
				
			
			}
			doStop();
			
		
	}
	
	function doDelay(){
		
		timer =  window.setTimeout("doDelay()", 1000);
		
	}
	
	function dotClick(event){
		
		var target = event.target;
		
		for(var k=0; k<dot.length; k++){
			
			if( target == dot[parseInt(k)] ){
				
				var x = parseInt(k%40);
				var y = parseInt(k/40);
				
				if(x<20){
					moveLeft();
				} else {
					moveRight();
				}
				
				
			}
			
		}
		
	}
	
	function moveLeft(event){
		
		for(var i=0; i<varindex.length; i++) {
			varindex[i] -= 2; 
		}
		
		dotClean();
		dotDisplay();
		
	}
	
	function moveRight(event){
		
		for(var i=0; i<varindex.length; i++) {
			varindex[i] += 2; 
		}
					
		dotClean();
		dotDisplay();
		
	
	}
	function dotRotate(event){
		
		<% for(int i=0; i<dotData.length; i++) {%>
		varindex[<%=i%>] += 2;
	    var dotX = parseInt(varindex[<%=i%>]%40);
	    var dotY = parseInt(varindex[<%=i%>]/40);
	
		var rotX = parseInt( dotX*Math.cos(90) - dotY*Math.sin(90));
		var rotY = parseInt( dotX*Math.sin(90) + dotY*Math.cos(90));
	
		var resultX = rotX;
		var resultY = rotY;
		
		varindex[<%=i%>] = rotY*40 + rotX;
		<%}%>
	
	
		
		dotClean();
		dotDisplay();
		
	}
	
	function gridRound(event){
		
		dotClean();
		
		var dotindex = 0;
		for(var i=0; i<1599; i++){
			 
			
		    var dotX = parseInt(i%40);
		    var dotY = parseInt(i/40);
		    
		    
			if( parseInt((dotX-5)*(dotX-5) + (dotY-5)*(dotY-5)) == parseInt(25) ){
				
				
				varindex[dotindex] = dotY*40 + dotX;
				alert(dotindex);
				
				dotindex++;
			}
			
	
		}
			
			/* alert("rot x: " + resultX + "rot y:" + resultY); */
		
		
		for(var i=0; i<varindex.length; i++) {
			var index = varindex[i];
			
			dot[index].style.backgroundColor = "black";
	    }
	
	}
	
	
	function dotDisplay(event){
		
		 for(var i=0; i<varindex.length; i++) {
			var index = varindex[i];
			/* alert(varindex[0]); */
			/* dot[index].style.backgroundColor = varcolor[index]; */
			dot[index].style.backgroundColor = varcolor[i];
		}
				
	}
	
	function dotClean(event){
		
		for(var i=0; i<dot.length; i++){
			
			dot[i].style.backgroundColor = "white";
		}
	}
	
	function doStart(event){
			 <% for(int i=0; i<dotData.length; i++) {%>
				
				<%				
				int temp2 = Integer.parseInt(dotData[i]);
				temp2 -= 2;
				String temp;
				temp = String.valueOf(temp2);
				%>
				
				varindex[<%=i%>] = <%=temp2%>;
				varcolor[<%=i%>] = "<%=dotColor[i]%>";
				
			<%}%>
			
			dotDisplay(); 
			timer =  window.setTimeout("dotMove()", 500); 

			/* timer =  window.setTimeout("dotMove()", 500); */
	}
	
	function doStop(event){
		window.clearTimeout(timer);
		
	}
	
	
	
	
	
	
	window.onload = function(event){
	
		for(var i=0; i<dot.length; i++){
			dot[i].addEventListener("click", dotClick);
		}
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


