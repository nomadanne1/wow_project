<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <style>
   /* 테이블 */
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    color:black;
    text-align: center;
  }
  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    text-align: center;
  }
  tr:nth-child(even) {
    background-color: #dddddd;
    text-align: center;
  }
  
  /* 페이징 처리 */
  .pagination {
    display: inline-block;
  }
  .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
  }
  .pagination a.active {
    background-color: gray;
    color: white;
    border-radius: 5px;
  }
  .pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
  }
  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		
		//전체 선택 및 해제
		$("#allAlert").change(function(){
			if($("#allAlert").prop("checked")==true){
				$("input[name=alertCheck]").prop("checked",true);
			}else{
				$("input[name=alertCheck]").prop("checked",false);
			}
		});
		
		//개별 선택 시 전체선택 및 해제버튼 변경
		$("input[name=alertCheck]").change(function(){
			checkBoxLength = $("input[name=alertCheck]").length;
			checkedLength = $("input[name=alertCheck]:checked").length;
			
			if(checkBoxLength==checkedLength){
				$("#allAlert").prop("checked",true);
			}else{
				$("#allAlert").prop("checked",false);
			}
		});
		
		//신고회원 탈퇴
		$("#memberSignOut").click(function(){
			var header = "${_csrf.headerName}"; 
	         var token = "${_csrf.token}";
	  		 $(document).ajaxSend(function(e,xhr, options){
	             xhr.setRequestHeader(header, token); 
	           });
	  		 
	  		  var cnt = $("input[name='alertCheck']:checked").length;
		      var arr = new Array();
		         
		         $("input[name='alertCheck']:checked").each(function(){
		        	arr.push($(this).val()); 
		        	console.log($(this).val())
		         });
		         
		         if(cnt==0){
		        	 alert("선택된 회원이 없습니다.");
		         }else{
		        	 if(confirm("탈퇴시키겠습니까?")){
		        		 $.ajax({
		 	 				type: "post",
		 	 				url: "${pageContext.request.contextPath}/memberAdminDelete.do",
		 	 				data: {memberId:arr},
		 	 				success: function(data){
		 	 					if(data=="success"){
		 	 						alert("탈퇴가 완료되었습니다.");
		 	 						arr = new Array();
		 	 						location.reload();
		 	 					}else{
		 	 						alert("삭!제! 실!패!")
		 	 					}
		 	 				},
		 	 				error:function(request, status, error){
		 	 					alert("code"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 	 				}
		 	 			});
		        	 }
		         }
			});
	});
</script>  

 <!-- Category -->
<div class="container-fluid bg-3 text-center">
  <h3 class="margin"><b>신고 회원 관리</b></h3>
  <br>
  <a href="membership.do" class="btn btn-default btn-lg">멤버쉽 회원 관리<br>
  </a>
  <a href="report.do" class="btn btn-default btn-lg">신고 회원 관리<br>
  </a>
  <a href="postmanage.do" class="btn btn-default btn-lg">게시물 관리<br>
  </a>

<br><br><br>
<!--CRUD-->
<table>
  <tr>
    <th>전체선택 <input type="checkbox" id="allAlert"></th>
    <th>ID</th>
    <th>신고 횟수</th>
  </tr>
  <c:if test="${listCount != 0}">
  
  <c:forEach items="${alert}" var="alert">
	  <tr>
	    <td><input type="checkbox" name="alertCheck" value="${alert.id }" ></td>
	    <td>${alert.id}</td>
		<td>${alert.alert_cnt}</td>
	  </tr>
    </c:forEach>
    </c:if>
    <c:if test="${listCount == 0}">
    	<tr>
    		<td colspan="3" align="center">
    		<br><strong>게시글이 없습니다.</strong>
    		<br><br>
    		</td>
    	</tr>
    </c:if>
  <tr>
  	<td colspan="3" style="text-align:left;padding-left:100px;">
  	<button type="button" class="btn btn-default btn-sm" id="memberSignOut">회원 탈퇴
  	</td>
  </tr>
</table>
<br>
<br>
<!-- 글 있는 경우 -->
<c:if test="${listCount ne 0}">
	<div class="paging">
	  <!-- 페이지네이션 공간 -->
	</div>
</c:if>
<br>
<br>
<br>
</div>
<script>
	$(function(){
		var postCnt = "${listCount}";
		postList(postCnt); 
	 });
	
		// 댓글 페이징 처리
	var pageNum = "${page}";
	var paging = $(".paging");
	var url = "postmanage.do?page=";
	
	function postList(postCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*10>=postCnt){
			endNum = Math.ceil(postCnt/10.0);
		}
		
		if(endNum*10<postCnt){
			next = true;
		}
		
		var str = "<ul class='breadcrumb text-center'>";
		
		if(prev){
			str += "<li><a href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str +="<li class='"+active+"'><a href='"+i+"'>"+i+"</a></li>"; // 여기 a태그에 주소넣으면 안됨 아래에 넣어야됨
		}
		if(next){
			str+="<li><a href='"+(endNum+1)+"'>다음</a></li>";
		}
		str+="</ul>";
		console.log(str);
		paging.html(str);	// div 부분에 표시되게
		}
		
		
		//다음 페이지 눌렀을 때 리스트 나오게
		$(function(){
			paging.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum=targetPageNum;
				window.location.href="postmanage.do?page="+targetPageNum;	// 주소 주의해서 작성해야함
			});
					
		});
</script>

