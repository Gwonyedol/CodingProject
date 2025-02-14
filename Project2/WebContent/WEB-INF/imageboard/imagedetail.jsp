<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/common/Head_top.jsp"></jsp:include>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resource/js/imagewrite.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/imageboard.ib";
	});	
</script>

<link rel="stylesheet" href="./resource/css/imageboard.css">
<jsp:include page="/WEB-INF/common/Header_top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/common/Sidebar_Left.jsp"></jsp:include>

<!-- 콘텐츠영역 시작 -->

<h2 align="center">게시글 상세보기</h2><hr>
<button type="button" class="btn btn-black m-b-5 m-r-3" id="new_content_button"
			onclick="location.href='imageedit.ib'">수정하기</button> 
<button type="button" class="btn btn-black m-b-5 m-r-3" id="new_content_button"
			onclick="location.href='imagewrite.ib'">글쓰기</button> 
<button type="button" class="btn btn-black m-b-5 m-r-3" id="new_content_button"
			onclick="location.href='imagedelete.ib?id=${requestScope.imageList.id}'">삭제하기</button> 			

	<article>
		<div class="container" role="main">						
			<div class="mb-3">
				<label for="title">제목</label>
				<input type="text" name="title" class="form-control" value="${requestScope.imageList.title}" readonly>
			</div>			
			
			<div class="mb-3">				
				<label for="writer">작성자</label>
				<input type="text" name="writer" class="form-control" value="${requestScope.imageList.nick_name}" readonly/>
			</div>		

			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" name="editor1" rows="5" readonly>${requestScope.imageList.content}</textarea>
			</div>			
							
			<!-- 커버이미지 들어오는 부분 (임시로 이미지를 넣어줬다)-->
			<div class="selectCover" style="padding-left: 0;">
				<img id="cover" src="./upload/default-img.gif" style="width: 50%; height: 20%;"/>
			</div>
			
			<!-- 파일등록 -->
			<div class="form-group" style="margin: 8px 0 8px;">
				<div class="fileRegiBtn">
					<label for="myFileUp">찾아보기</label>
					<input type="file" name="fileup" id="myFileUp">
				</div>
			</div>			
				
		</div>
	</article>

<script type="text/javascript">
function readURL(input) {
	console.log("버튼클릭함1");
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
            $('#cover').attr('src', e.target.result);   //cover src로 붙여지고
            $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
        }
      reader.readAsDataURL(input.files[0]);
    }
}

$("#myFileUp").change(function(){
    readURL(this);
    console.log("이미지 바뀜?");
});
</script>

<!-- 콘텐츠영역 끝 -->
<jsp:include page="/WEB-INF/common/Sidebar_Right.jsp"></jsp:include>
<jsp:include page="/WEB-INF/common/Footer_bottom.jsp"></jsp:include>