<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>사용자등록</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input.css" />
	
</head>
<body>

	<div id="pageContainer">
	
		<div id="header">
            <div class="title">
                <a href="/demoweb/">DEMO WEBSITE</a>
            </div>
            <div class="links">
            	<a href="/demoweb/account/loginform.action">로그인</a>
                <a href="#">등록</a>
            </div>
        </div>        
        <div id="menu">
            <div>
                <ul>
                    <li><a href="/demoweb/member/list.action">사용자관리</a></li>
					<li><a href="/demoweb/mail/sendmailform.action">메일보내기</a></li>
					<li><a href="/demoweb/upload/list.action">자료실</a></li>
					<li><a href="/demoweb/board/list.action">게시판</a></li>
                </ul>
            </div>
		</div>
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain">
		        <div class="inputsubtitle">회원기본정보</div>

		        <form id="registerform" action="register.action" method="post"><!-- 상대경로표시 -->
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type="text" id="memberId" name="memberId" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" id="passwd" name="passwd" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호 확인</th>
		                <td>
		                    <input type="password" id="confirm" name="confirm" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>이메일</th>
		                <td>
		                	<input type="text" id="email" name="email" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>사용자구분</th>
		                <td>
		                	<input type="radio" name="userType" value="user" checked="checked">사용자</input>
		                	<input type="radio" name="userType" value="admin">관리자</input>
		                </td>
		            </tr>
		            <tr>
		                <th>활성화여부</th>
		                <td>
		                	<input type="checkbox" name="active" value="y">활성사용자</input>
		                </td>
		            </tr>		            		            
		        </table>
		        <div class="buttons">
		        	<input type="submit" value="등록" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px"
		        		onclick="location.href='list.action';" />

		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>

</body>
</html>