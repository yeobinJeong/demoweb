<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>아이디 유효성 검사</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input.css" />	
</head>
<body>
	
	<div id="pageContainer">
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain">
		        <div class="inputsubtitle">아이디 유효성 검사</div>
		        
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td style="padding-top:30px;padding-bottom:30px">
		                    <input type="text" name="memberId" style="width:220px" />
		                    &nbsp;
		                    [<a style="text-decoration:none" 
		                       href="javascript:check();">유효성 검사</a>]
		                </td>
		            </tr>
		        </table>
		        <div class="buttons" id="result" style="color:red">
		      	 아이디를 입력하고 유효성 검사를 수행하세요
		        </div>
		        <div class="buttons">
		        	<input type="button" value="사용" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px"
		        		onclick="window.close();" />
		        </div>
		        		        
		    </div>
		</div>   	
	
	</div>

</body>
</html>