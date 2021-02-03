<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <p style="color: red;" id="warning"></p>           
        </div>	
</div>
<div class="container p-4 ">
	<div class="p-4 shadow">
		<form id="reply" enctype="multipart/form-data" name="reply">
			<input type="hidden" id="boardId" name="boardId" value="${post.id}">
	        <div class="form-group">
	        	<textarea id="reply_content" name="content" placeholder="내용"  class="form-control col-md-0" style="height: 10vh;"></textarea>
	        </div>
	        <input type="button" value ="확인" class="btn col-1 btn-outline-primary btn-sm" onclick="updateReply()"></button>
        </form>
        <br>
        <table class="table table-hover">
			<c:forEach var="item" items="${re}">
				<tr>
					<td style="width: 70%;">${item.content}</td>
					<td>${fn:substring(item.time,0,16)}</td>
					<td style="width: 5%;" onclick="deleteOneReply(${item.reply_id})"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
					  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
					</td>
				</tr>
				<tr id="re${item.reply_id}">
				</tr>
			</c:forEach>
		</table>
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
		if(CheckInput()==0)return;
		$.ajax({
			type : 'PUT',
			url : '/post',
			data : $("form").serialize(),
			success : function(data) {
				window.location.href = "/"
				},
			error : function(data) {
				alert("데이터 불러오기를 실패했습니다.");
				return 0;
			}
		});
		
		}
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

function updateReply(){
	$.ajax({
		type : 'POST',
		url : '/reply',
		data : $("#reply").serialize(),
		success : function(data) {
			location.reload();
			},
		error : function(data) {
			alert("데이터 불러오기를 실패했습니다.");
			return 0;
		}
	});
}

function deleteOneReply(reply_id){
	$.ajax({
		type : 'DELETE',
		url : '/reply?id='+reply_id,
		data : reply_id,
		success : function(data) {
			location.reload();
			},
		error : function(data) {
			alert("데이터 삭제를 실패했습니다.");
			return 0;
		}
	});
}
</script>

</html>