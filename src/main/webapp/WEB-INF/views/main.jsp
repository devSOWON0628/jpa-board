<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=071c20ffd6270b98a10688b1c85cf132&libraries=services"></script>
</head>

<body>
	<div class="container p-4">
		<div class="p-4 shadow"><br>
		<input type="button" onclick="sample5_execDaumPostcode()" class="btn btn-sm btn-secondary float-right" value="주소 검색">
		<input type="text" id="sample5_address" onclick="sample5_execDaumPostcode()" placeholder="주소" class="form-control form-control-sm col-2 float-right"> <br>
		<div id="map" class ="mb-5 mt-3" style="width:100%;height:50vh; "></div>
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
							<td>${fn:substring(item.time,10,16)}</td>
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
					
						<c:if test="${paging.startPage != 1 }">	 <!-- 시작 페이지가 첫페이지가 아니면 previous가 뜨게 -->
							<li class="page-item">
								<a class="page-link" href="/post?page=${paging.startPage - 1 }&size=${paging.cntPerPage}" > 
								Previous 
								</a>
							</li>
						</c:if>
					
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p"> <!-- 현재 페이지면 bold 아니면 일반 -->
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="page-link" href="/post?page=${p}&size=${paging.cntPerPage}"> 
									<b>${p}</b>
									</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
								<li class="page-item">
									<a class="page-link" href="/post?page=${p}&size=${paging.cntPerPage}">
									${p}
									</a>
								</li>
								</c:when>
							</c:choose>
						</c:forEach>
					
						<c:if test="${paging.endPage != paging.lastPage}"> <!-- 마지막 페이지가 진짜 마지막의 마지막이 아니면 Next가 뜨게 -->
							<li class="page-item">
								<a class="page-link" href="/post?page=${paging.endPage+1 }&size=${paging.cntPerPage}"> Next </a> <!-- 내가 1이었으면 마지막이 5니까 6으로 2였으면 7로 이동 -->
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
	window.location.href = '/post/'+id;
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
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537108, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    mapContainer.className += " shadow";

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>