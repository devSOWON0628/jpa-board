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
        	<div class="row" id="inner" data-masonry="{&quot;percentPosition&quot;: true }" style="position: relative;">
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
            <button type="button" id="sessionClear"class="btn btn-sm btn-secondary float-right" onclick="deleteAllPost()">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                	<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
				</svg>
            </button>
        </div>    
</body>
<script type="text/javascript">
function insertPost(){
	$.ajax({
		type : 'POST',
		url : '/insert/post',
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

function deleteAllPost(){
	$.ajax({
		type : 'DELETE',
		url : '/delete/post',
		data : {},
		success : function(data) {
			location.reload();
			},
		error : function(data) {
			alert("데이터 불러오기를 실패했습니다.");
			return 0;
		}
	});
}
</script>
</html>
