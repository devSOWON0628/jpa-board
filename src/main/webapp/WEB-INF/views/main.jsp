<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>

<body>
	<div class="container p-4">
		<div class="p-4 shadow"><br>
			<table class="table table-hover">
				<tr>
					<td style="width: 60%;"><h5>전체</h5></td>
					<td></td>
					<td style="width: 15%;">
						<a href="?page=1&size=3">3</a> /
						<a href="?page=1&size=5">5</a> /
						<a href="?page=1&size=10">10</a>
					</td>
					<td style="width: 5%;"><a id="checkAll"  onclick="checkAll()">ALL</a></td>
				</tr>
				<tbody id="tableValue">
					<c:forEach var="item" items="${all}">
						<tr>
							<td onclick="onePost(${item.id})">${item.title}</td>
							<td>${item.writer}</td>
							<td>${fn:substring(item.time,10,16) }</td>
							<td><input type="checkbox" name="chk" value="${item.id}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="button" id="delete" class="btn btn-sm btn-secondary float-right" onclick="deletePosts()">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                	<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
				</svg>
        	</button>
			<div style="display: block; text-align: center; fo" class="container">	
				<nav>
					<ul class="pagination justify-content-center">
					
						<c:if test="${paging.startPage != 1 }">	 
							<li class="page-item">
								<a class="page-link" href="/?page=${paging.startPage - 1 }&size=${paging.cntPerPage}" > 
								Previous 
								</a>
							</li>
						</c:if>
					
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="page-link" href="/?page=${p}&size=${paging.cntPerPage}"> 
									<b>${p}</b>
									</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
								<li class="page-item">
									<a class="page-link" href="/?page=${p}&size=${paging.cntPerPage}">
									${p}
									</a>
								</li>
								</c:when>
							</c:choose>
						</c:forEach>
					
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item">
								<a class="page-link" href="/?page=${paging.endPage+1 }&size=${paging.cntPerPage}"> Next </a>
							</li>
						</c:if>
					
					</ul>
				</nav>
			</div>
			
        </div>  
	</div> 	
</body>
<script type="text/javascript">

var deleteionIdArray=new Array();

function checkAll(){
	if($("input[name=chk]").prop("checked")){
		$("input[name=chk]").prop("checked",false);
	}else{
		$("input[name=chk]").prop("checked",true);
	}
}

function onePost(id){
	window.location.href = '/post?num='+id;
}

function deletePosts(){
    $('input[type="checkbox"]:checked').each(function (index) {
    	var deleteionIdObject = new Object();
    	deleteionIdObject.id=$(this).val();
    	deleteionIdArray.push(deleteionIdObject);
    });
    
	$.ajax({
	    url : '/post',
	    contentType: 'application/json',
	    method : 'DELETE', 
	    data :  JSON.stringify(deleteionIdArray),
	    success : function(xhr,status,err) {
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