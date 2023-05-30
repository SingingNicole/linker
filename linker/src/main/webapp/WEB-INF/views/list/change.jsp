<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Linker</title>
<style>
	.content {
		width: 100%;
	}

	.IngredientList {
		width: 100%;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-top: 30px;
		text-align: center;
		table-layout: fixed;
	}

	th {
		text-align: center;
		border-bottom: 1px solid gray;
	}

	.listController {
		width: 100%;
		align-self: flex-start;
		padding: 20px;
		border: 1px solid gray;
	}

	.title {
		width: 700px;
		margin-top: 30px;
	}

	.pageController {
		width: 500px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}

	.content {
		width: 100%;
		align-content: center;
	}

	.button {
		margin-top: 10px;
	}
</style>
</head>
<body>
<body>
	<div class="fh5co-cover" style="height: 200px"></div>
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<!-- <div class="top-menu"> -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-right menu-1 menu-wrap">
		            <span id="role" style="display: none;">${ user.role }</span>			
        				<ul>
              				<c:if test="${ user.userid == null }">
                				<li class="login-signup"><a href="/loginform">로그인</a></li>
                				<li class="login-signup"><a href="/joinform">회원가입</a></li>
              				</c:if>
               				<c:if test="${ user.userid != null }">
              					<li class="myinfo">${ user.userid } 회원님 환영합니다!</li>
              					<li class="logout"><a href="/logout">로그아웃</a></li>
              				</c:if>
            			</ul>
					</div>
					</div>

				<div class="row">
					<div class="col-xs-12 text-center logo-wrap">
						<div id="fh5co-logo">
							<a href="/main">Linker<span>.</span></a>
						</div>
					</div>

					<div class="col-xs-12 text-left menu-1 menu-wrap">
						<ul>
							<li><a href="/main">홈</a></li>
							<li><a href="/notice/notice">공지사항</a></li>
							<li><a href="/inquiry/inquiry">문의사항</a></li>
							<li><a href="/menu/list">식단표</a></li>
             		<c:if test="${ user.role == 'seller' }">
                			<li><a href="/finance/sales">매출</a></li>
                			<li><a href="/finance/expenditure">지출</a></li>
                			<li class="active"><a href="/ingredient/ingredientList">식자재 관리</a></li>
                			<li><a href="/profitChart">차트</a></li>
       				</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- </div> -->
		</nav>

		<div id="fh5co-slider" class="fh5co-section animate-box">
			<div class="fh5co-cover" style="height: 200px"></div>
			<div class="main">
				<div class="container">
					<h1><a class="title" href="/ingredient/ingredientList">식자재 목록</a></h1>
					<div class="listController">
						<p style="color: white;"><b>식자재 추가</b></p>
						<form id="addIngredient" action="/ingredient/insert" method="post">
							<span style="color: white;">식자재명:&nbsp; &nbsp;</span><input name="ingredientname" required>
							<span style="color: white;">단위:&nbsp; &nbsp;</span>
								<select name="unit" required>
									<option value="KG">KG</option>
									<option value="G">G</option>
									<option value="LB">LB</option>
									<option value="OZ">OZ</option>
								</select>
							<span style="color: white;">유통기한:&nbsp; &nbsp;</span><input name="exp" type="date" required><br>
						<div>
							<input type="button" id="add" class="button" value="식자재 등록" style="color: black;"/>
						</div>
						</form>
					</div>
				<div class="content">
					<form id="deleteIngredient">
					<c:if test="${ count != 0 }">
						<table class="IngredientList" id="IngredientList">
							<tr>
								<th style="width: 5%;"></th>
								<th>식자재명</th>
								<th>단위</th>
								<th>유통기한</th>
							</tr>
							<c:forEach items="${ ingredientList }" var="ingredient">
							<tr class="ingredientlist">
								<td><input type="checkbox" name="checkList" class="checkList" value="${ ingredient.ingredientid }"></td>
								<td>${ ingredient.ingredientname }</td>
								<td>${ ingredient.unit }</td>
								<td>${ ingredient.exp }</td>
							</tr>
							</c:forEach>
						</table>
						<div>
							<input type="button" id="delete" class="button" value="선택한 식자재 삭제" style="color: black;"/>
						</div>
						<div class="pageController">
							<c:if test="${ begin > end }">
								<a href="change?p=${ begin-1 }">[이전]</a>
							</c:if>
							<c:forEach begin="${ begin }" end="${ end }" var="i">
								<a href="change?p=${ i }">${ i }</a>
							</c:forEach>
							<c:if test="${ end < totalPages }">
								<a href="change?p=${ end + 1 }">[다음]</a>
							</c:if>
						</div>
					</c:if>
					</form>
					</div>	<%-- main > content end --%>
				</div>	<%-- main > container end --%>
			</div>	<%-- main end --%>

		<footer id="fh5co-footer" role="contentinfo" class="fh5co-section">
			<div class="container">
				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; 2023 Soldesk Project. All
								Rights Reserved.</small> <small class="block">Designed by <a
								href="http://freehtml5.co/" target="_blank">Linker</a>
							</small>
						</p>
					</div>
				</div>
			</div>
		</footer>
			</div>	<%-- footer > container end --%>
	</div>	<%-- page end --%>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		// 권한 가져오기
		var role = $("#role").text();
		
		// 열람 권한이 없다면 페이지 이동.
		if (role != 'seller' || role != 'admin') {
			alert("열람 권한이 없는 페이지입니다.");
			location.href = "/main";
		}

		$("#delete").on("click", function(){
			// 체크박스에 체크된 식자재 id 번호 값 찾기
			$(".checkList:checked").each(function(i, item) {
				// target에 id값 저장
				var target = item.value;
				
				$.ajax({
					url: "/ingredient/delete/" + target,
					method: "delete",
					data:{'ingredientid':target}
				}).done(function(result){
					
				});				
			});	// each end
			
			alert("삭제가 완료되었습니다.");
			location.replace("/ingredient/change");
		});
		
		$("#add").on("click", function(event) {
			// 바로 전송 차단
			event.preventDefault;
			
			// 하나라도 값이 입력되지 않은 경우
			if (!$("input[name='ingredientname']").val() || !$("select[name='unit']").val() || !$("input[name='exp']").val()){
				// submit 하지 않고 alert 출력
				alert("필수 항목을 전부 입력해 주십시오.");
			} else {
				// 전부 입력했다면 submit
				alert("등록이 완료되었습니다.");
				$("#addIngredient").submit();
			}
		});
	});
</script>
</body>
</html>