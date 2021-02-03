<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
	
	#write-menu{
		font-weight: bold;
	}
	</style>
</head>
<body>
	<div class="container p-4">
        <div class="p-4 shadow">
	        <br>
            <form id="form" enctype="multipart/form-data" name="form">
	            <div class="form-group">
	              <input type="text" id="title" name="title" placeholder="제목" class="form-control col-md-0"  required autocomplete="off">
	            </div>
	            <div class="form-group float-right">
	              <input id="writer" type="text" name="writer" placeholder="작성자" class="form-control form-control-sm col-0"required autocomplete="off">
	            </div>
	            <div class="form-group">
	              <textarea id="content" name="content" placeholder="내용"  class="form-control col-md-0" style="height: 35vh;"></textarea>
	            </div>
            </form>
            <button class="btn col-1 btn-outline-primary btn-sm" onclick="insertPost()">저장</button>
            <p style="color: red;" id="warning"></p>
        </div>  
	</div>
    	<div class="container py-5">
        	<div class="row" id="inner" data-masonry='{"percentPosition": true }' style="position: relative;">
        		<c:forEach var="item" items="${post}">
	        		<div class="col-sm-6 col-lg-4 mb-4">
			                <div class="card mb-4 shadow-sm">
			                    <div class="card-body">
			                        <a class ="card-text" href="/read?num=${item.id}"><h5>${item.title}</h5></a>
			                        <p class="card-text">${item.content}</p>
			                        <div class="d-flex justify-content-between align-items-center">
			                           <div class="btn-group">
			           				       <button type="button" class="btn btn-sm btn-outline-secondary" onclick ="location.href = '/read?num=${item.id}' ">Edit</button>
			         				   </div>
			                            <small class="text-muted">  by ${item.writer}</small>
			                        </div>
			                    </div>
			                </div>
		   			</div>
        		</c:forEach>
	        	
            </div>
        </div>    
</body>
<script type="text/javascript">

function insertPost(){
	$.ajax({
		type : 'POST',
		url : '/post',
		data : $("form").serialize(),
		success : function(data) {
			},
		error : function(data) {
			alert("저장을 실패했습니다");
			return 0;
		}
	});
	window.location.href = '/home';
	
}


function CheckInput(){ 
	if(title.value.trim() == ''){
		document.getElementById("warning").innerHTML = "제목을 입력해주세요!";
		title.focus();
		return 0;
	}else if(writer.value.trim() == ''){
		document.getElementById("warning").innerHTML = "작성자를 입력해주세요!";
		writer.focus();
		return 0;
	}else if(content.value.trim() == ''){
		document.getElementById("warning").innerHTML = "내용을 입력해주세요!";
		content.focus();
		return 0;
    }
    return 1;
}
</script>
</html>
