<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <!-- css 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/mylist2.css"
		rel="stylesheet" type="text/css" />
    <!-- 전체 div -->
        <div class="wraps">
            <h1>내 게시물</h1>
            <!-- 카테고리 드롭다운 -->
            <div class="dropdown" id="dropdown">
                <button class="btn btn-default" type="button" data-toggle="dropdown">Category
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="#">Food</a></li>
                  <li><a href="#">Accessory</a></li>
                  <li><a href="#">Pet</a></li>
                  <li><a href="#">Interior</a></li>
                  <li><a href="#">etc</a></li>
                </ul>
            </div>
            <!-- 판매중/판매완료 라디오버튼 -->
            <div class="radiobtn">
                <input type="radio" name="goods" value="판매중"> &nbsp;판매중 &nbsp;&nbsp;
                <input type="radio" name="goods" value="판매완료"> &nbsp;판매완료
            </div>
            <!-- 썸네일 게시물 리스트 -->
            <div class="fixed_img_col">
                <ul id="listBody">
                <c:forEach var="m" items="${myBoardList }">
                    <li>
                        <span class="thumb">
                            <em>${m.post_code }</em>
                            <a href="postSellerView.do?no=${m.post_no }">
                            <img class="img-rounded"  src="${pageContext.request.contextPath}/resources/upload/${m.rename_filename}"alt=""></span>
                            <Strong>${m.post_title }</Strong></a>
            
                        <p>${m.post_address }</p>
                        <p>${m.post_price }원</p>
                    </li> 
                 </c:forEach>    
                </ul>
            <!--by은지, + 게시글 들어갈 공간.-->
            </div>
            <div id="listUp">
            </div>
        </div>
       <!--  <button type="button" id="more" onclick="moreList();"class="btn btn-default">더보기</button> -->
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />           
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}"
</script>
<!--by은지, 스크롤링페이징  -->
<script>
var more = 0;	
//by은지, 스크롤 이벤트 발생시 function()실행
$(function(){$(window).scroll(function(){

	//by은지, (스크롤을 맨 밑으로 내렸을 때의 스크롤 길이 값)  == (문서의 길이) - (창의 길이)
	if($(window).scrollTop() >= $(document).height() - $(window).height()){
		//console.log(more);
		
		//by은지, 1, 2, 3, 4,... 
		more = more +1;
		
		$.ajax({
			url : "myList.do",
			type : "POST",
			data : { more : more },
			dataType: "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){

				var addListHtml ="";

					addListHtml += "<div class='fixed_img_col' style='height:350px'>";
				for(var i in data.list){
				
					addListHtml += "<ul>";
					addListHtml += "<li><span class='thumb'><em>"+data.list[i].post_code+"</em>";
				 	addListHtml += "<a href='postSellerView.do?no="+data.list[i].post_no+"'> ";
				   	addListHtml += "<img class='img-rounded' src='${pageContext.request.contextPath}/resources/upload/b8851dbb-fbb1-4481-9e0e-1505ac1c7216_anne.png'></span>";
				   	addListHtml += "<Strong>"+decodeURIComponent(data.list[i].post_title)+"</Strong> </a>";
				   	addListHtml += "<p>"+decodeURIComponent(data.list[i].post_address)+"&nbsp;·&nbsp"+data.list[i].post_date+"</p>";
				   	addListHtml += "<p id='price' style='float:left'>"+data.list[i].post_price+"원</p>";
				   	addListHtml += "<button name='hbtn' id='hbtn' class='glyphicon glyphicon-heart-empty'></button>";
				   	addListHtml += "</li>";
				   	addListHtml += "</ul>";	
				}
					addListHtml += "</div>";
	
				if(data.list.length>0){
						
				 $("#listUp").append(addListHtml);
				}else {
					alert("다음게시글이 없습니다.");
				}
			},
		    error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
				
		}); // .ajax 닫기
	} // if문 닫기

});	
});
/* function moreList(){	

 	var startNum = $("#listBody li").length;  
	
	more += 1;

	$.ajax({
		url : "myList.do",
		type : "POST",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		data : {
			more : more,
			startNum:startNum
		},
		success : function(data){
			if(startNum < 8){
				$("#more").remove();
			}else{ 
				var addListHtml ="";
				addListHtml += "<div class='fixed_img_col' style='height:350px'>";
				
				if(startNum >= 8){
						for(var i in data.list){
		
							addListHtml += "<ul id='listBody'>";
							addListHtml += "<li>";
							addListHtml += "<span class='thumb'>";
							addListHtml += "<em>"+data.list[i].post_code+"</em>";
							addListHtml += "<a href='postSellerView.do?no="+data.list[i].post_no+"'>";
							addListHtml += "<img class='img-rounded' src='${pageContext.request.contextPath}/resources/images/sample.jpg' alt=''/></span>";
							addListHtml += "<Strong>"+decodeURIComponent(data.list[i].post_title)+"</Strong></a>";
							addListHtml += "<p>"+decodeURIComponent(data.list[i].post_address)+"</p>";
							addListHtml += " <p>"+data.list[i].post_price+"원"+"</p>";
							addListHtml += "</li>";
							addListHtml += "</ul>";	
						}
							addListHtml +="</div>";
						
						$("#listUp").append(addListHtml);
				}		
			}
		},
		error: function (request,status,errorData){   
		   	alert('error code: '+request.status+"\n"
		   			+'message:' +request.reponseText+'\n'
		   			+ 'error :'+  errorData);
		}
	}) 
} */
</script>        