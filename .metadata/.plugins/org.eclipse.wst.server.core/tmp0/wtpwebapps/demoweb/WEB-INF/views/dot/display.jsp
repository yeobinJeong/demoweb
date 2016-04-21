﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>Home</title>
	<script type="text/javascript">
	<% String[] dotData = (String[])request.getAttribute("index"); %>
	<% String[] dotColor = (String[])request.getAttribute("color");%>
	<% String[] evolData = (String[])request.getAttribute("evolindex"); %>
	<% String[] evolColor = (String[])request.getAttribute("evolcolor");%>
	<% String[] boombData = (String[])request.getAttribute("boomindex"); %>
	<% String[] boombColor = (String[])request.getAttribute("boomcolor");%>
	<% String[] afterData = (String[])request.getAttribute("afterindex"); %>
	<% String[] afterColor = (String[])request.getAttribute("aftercolor");%>
	
	
	dot = document.getElementsByClassName("dot");
	var timer = null;
	var varindex= [];
	var varcolor= [];
	var evolindex= [];
	var evolcolor= [];
	var boomindex=[];
	var boomcolor=[];
	var afterindex=[];
	var aftercolor=[];
	
	var count=0;
	
	
	function dotMove(event){
		
			if(count < 10 ){
				moveLeft(varindex);
				count++;				
			}else if(9 < count && count < 25 ){
				moveRight(varindex);
				count++;
			}else{
				count=0;
			}
			
			timer = setTimeout("dotMove()", 500);
		
	}
	
	
	
	function dotClick(event){
		
		var target = event.target;
		
		for(var k=0; k<dot.length; k++){
			
			if( target == dot[parseInt(k)] ){
				
				var x = parseInt(k%40);
				var y = parseInt(k/40);
				
				if(x<20){
					dotClean();
					moveLeft(varindex);
					dotDisplay(varindex, varcolor);
					
				} else {
					dotClean();
					moveRight(varindex);
					dotDisplay(varindex, varcolor);
				}
				
				
			}
			
		}
		
	}
	
	
	function moveLeft(targetindex){
		
		for(var i=0; i<targetindex.length; i++) {
			
			var x = parseInt(targetindex[i]%40);
			var y = parseInt(targetindex[i]/40);
			
			if( x > 1 ){
				if( i == targetindex.length-1){
					
					for(var k=0; k<targetindex.length; k++){
						targetindex[k] -= 2;
					}
				} 
				//targetindex[i] -= 2;
			}else{
				
				for(var k=0; k< targetindex.length; k++){
					
					var kx = parseInt(targetindex[k]%40);
					var ky = parseInt(targetindex[k]/40);
					
					if(kx <8){
						for(var a=0; a<8; a++){
							if((8-kx) == a ){
								targetindex[k] = ky*40+(8+a);
							}
						}
						
					}else if (kx == 8){
						targetindex[k] = ky*40+(8);
					}else{
						for(var a=0; a<10; a++){
							if((kx-8)==a)
							{
								targetindex[k] = ky*40+(8-a);	
							}
						}
					}
					
					
				}
				/* break; */
			}
		}
		
		
		
		
	}
	
	function moveRight(targetindex){
		
		for(var i=0; i<targetindex.length; i++) {
			
			var x = parseInt(targetindex[i]%40);
			var y = parseInt(targetindex[i]/40);
			
			if( x < 38 ){
				if( i == targetindex.length-1){
					
					for(var k=0; k<targetindex.length; k++){
						targetindex[k] += 2;
					}
				}
				/* targetindex[i] += 2; */
			}else{
				
				break;
			}
		}
					
		
		
	
	}
	function dotRotate(targetindex){
		
		for(var i=0; i<targetindex.length; i++) { 
			
		    var dotX = parseInt(targetindex[i]%40);
		    var dotY = parseInt(targetindex[i]/40);
		
		    
		    if(dotY < 15){
				var rotX = parseInt( dotX*Math.cos(90) - dotY*Math.sin(90));
				var rotY = parseInt( dotX*Math.sin(90) + dotY*Math.cos(90));
				dotX = rotX;
				dotY = rotY;
		    }
			/* var resultX = rotX;
			var resultY = rotY; */
			
			targetindex[i] = dotY*40 + dotX;
		}
		
	
		
		
		
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
			
			
		
		
		for(var i=0; i<varindex.length; i++) {
			var index = varindex[i];
		
			dot[index].style.backgroundColor = "black";
	    }
	
	}
	
	
	function dotDisplay(targetindex, targetcolor){
		
		 for(var i=0; i<targetindex.length; i++) {
			var index = targetindex[i];
			
			dot[index].style.backgroundColor = targetcolor[i];
		}
				
	}
	
	function dotClean(event){
		
		for(var i=0; i<dot.length; i++){
			
			dot[i].style.backgroundColor = "white";
		}
	}
	
	
	var evolCnt=0;
	function evol(event){
		
		if(evolCnt == 0)
		{
			moveLeft(evolindex);
			evolCnt++;
			count++;
		}else if( evolCnt == 1){
			moveRight(evolindex);
			
			evolCnt--;
			count++;
		}
		
		dotClean();
		dotDisplay(evolindex, evolcolor);
		
		timer = setTimeout("evol()", 100);
		
		if(count == 10){
			doStop();
			count =0;
			evolCnt=0;		
			
			dotClean();
			boomb(boomindex, boomcolor);
		}
		
	}
	var boomCnt=0;
	function boomb(event){
			
			if(boomCnt == 0)
			{
				moveLeft(boomindex);
				boomCnt++;
				count++;
			}else if( boomCnt == 1){
				moveRight(boomindex);
				
				boomCnt--;
				count++;
			}
			
			dotClean();
			dotDisplay(boomindex, boomcolor);
			
			timer = setTimeout("boomb()", 100);
			
			if(count == 10){
				doStop();
				count =0;
				evolCnt=0;		
				
				dotClean();
				dotDisplay(afterindex, aftercolor);
			}
			
	}
	
	
	
	function doStart(event){
			 <% for(int i=0; i<dotData.length; i++) {%>
				
				<%				
				int temp2 = Integer.parseInt(dotData[i]);
				%>
				
				varindex[<%=i%>] = <%=temp2%>;
				varcolor[<%=i%>] = "<%=dotColor[i]%>";
				
			<%}%>
			
			<% for(int i=0; i<evolData.length; i++){%>
			
			<%				
			int temp2 = Integer.parseInt(evolData[i]);
			%>
			
			evolindex[<%=i%>] = <%=temp2%>;
			evolcolor[<%=i%>] = "<%=evolColor[i]%>";
			<% } %>
			
			<% for(int i=0; i<boombData.length; i++){%>
			
			<%				
			int temp2 = Integer.parseInt(boombData[i]);
			%>
			
			boomindex[<%=i%>] = <%=temp2%>;
			boomcolor[<%=i%>] = "<%=boombColor[i]%>";
			<% } %>
			
			<% for(int i=0; i<afterData.length; i++){%>
			
			<%				
			int temp2 = Integer.parseInt(afterData[i]);
			%>
			
			afterindex[<%=i%>] = <%=temp2%>;
			aftercolor[<%=i%>] = "<%=afterColor[i]%>";
			<% } %>
			
			dotDisplay(varindex, varcolor);
			/* dotDisplay(varindex, varcolor); 
			timer =  window.setTimeout("dotMove()", 500);  */

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
			
			
			
			
			<table  border='2'>
				 <%for(int i = 0; i< 40; i++){%>
					<tr>
					<% for(int j =0; j< 40; j++){ %>
										
						<td class='dot' id='<%=(i*40)+j%>' style='width: 9px; height: 9px; background-color: white;'></td>
												
					<%}%>
					</tr>
				<%}%> 
			</table>
		<a href="javascript:evol();">진화</a> 
		
		</div>
		
		
	</div>

</body>
</html>


