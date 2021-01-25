<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<div class="container p-4 ">
        <div class="p-4 shadow">
	        <br>
            <form id="form" enctype="multipart/form-data" name="form">
            	<input type="hidden" id="id" name="id" value="${post.id}">
	            <div class="form-group">
	              <input type="text" id="title" name="title" placeholder="제목" class="form-control col-md-0"  required autocomplete="off" value="${post.title}" readonly="readonly">
	            </div>
	            <div class="form-group float-right">
	              <input id="writer" type="text" name="writer" placeholder="작성자" class="form-control form-control-sm"required autocomplete="off" value="${post.writer}" readonly="readonly">
	            </div>
	            <div class="form-group">
	              <textarea id="content" name="content" placeholder="내용"  class="form-control col-md-0" style="height: 35vh;" readonly="readonly">${post.content}</textarea>
	            </div>
            </form>
            <button class="btn col-1 btn-outline-primary btn-sm" onclick="change()" id="change-btn">수정</button>
            <!--<p style="color: red;" id="warning"></p> -->            
        </div>	
</div>
</body>
<script type="text/javascript">
function change(){
	let btn=$("#change-btn");
	if(btn.text()=='수정'){
		document.getElementById("title").readOnly=false;
		document.getElementById("writer").readOnly=false;
		document.getElementById("content").readOnly=false;
		btn.text("저장");
	}else{
		$.ajax({
			type : 'PUT',
			url : '/update/post',
			data : $("form").serialize(),
			success : function(data) {
				window.location.href = "/home"
				},
			error : function(data) {
				alert("데이터 불러오기를 실패했습니다.");
				return 0;
			}
		});
		
		}
	
}
</script>

</html>