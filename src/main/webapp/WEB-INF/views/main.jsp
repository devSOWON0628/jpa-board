<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F5F5F5;
}

::-webkit-scrollbar
{
	width: 12px;
	background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #555;
}
</style>
</head>

<body>
<div class="container p-4">
        <div class="p-4 shadow">
	        <br>
		<table class="table table-hover">
			<tr>
				<td style="width: 70%;">title</td>
				<td></td>
				<td></td>
				<td style="width: 5%;"></td>
			</tr>
			<tbody id="tableValue">
			<tr><td></td></tr>
				<c:forEach var="item" items="${all}">
					<tr>
						<td onclick="onePost(${item.id})">${item.title}</td>
						<td>${item.writer}</td>
						<td>${fn:substring(item.time,0,16) }</td>
						<td onclick="deleteOnePost(${item.id})"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
						  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
		<div style="display: block; text-align: center;" class="container">	
		<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">	
			<c:if test="${paging.startPage != 1 }">
				
				<li class="page-item">
					<a class="page-link" href="/home?page=${paging.startPage - 1 }&per=${paging.cntPerPage}" tabindex="-1"> 
					Previous 
					</a>
				</li>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<a class="page-link" href="/home?page=${p}&per=${paging.cntPerPage}"> 
						<b>${p}</b>
						</a>
					</c:when>
					<c:when test="${p != paging.nowPage }">
					<li class="page-item">
						<a class="page-link" href="/home?page=${p}&per=${paging.cntPerPage}">
						${p}
						</a>
					</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<li class="page-item">
					<a class="page-link" href="/home?page=${paging.endPage+1 }&per=${paging.cntPerPage}"> Next </a>
				</li>
			</c:if>
			</ul>
			</nav>
		</div>
        </div>  
	</div> 	
</body>
<script type="text/javascript">
function onePost(id){
	window.location.href = '/read?num='+id;
}

function deleteOnePost(id){
	$.ajax({
		type : 'DELETE',
		url : '/delete/post/one?num='+id,
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