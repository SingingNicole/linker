<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Linker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/animate/animate.min.css" rel="stylesheet">
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/menu/menu_write.css" rel="stylesheet">

</head>
  
<body>
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Topbar Start -->
	<div class="container-fluid bg-light p-0">
		<div class="row gx-0 d-none d-lg-flex">
			<div class="col-lg-7 px-5 text-start">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-map-marker-alt text-primary me-2"></small> <small>서울특별시
						종로구 종로12길 15 코아빌딩1</small>
				</div>
				<div class="h-100 d-inline-flex align-items-center py-3">
					<small class="far fa-clock text-primary me-2"></small> <small>월
						- 일 : 09.30 AM - 10.00 PM</small>
				</div>
			</div>
			<div class="col-lg-5 px-5 text-end">
				<div class="h-100 d-inline-flex align-items-center py-3 me-4">
					<small class="fa fa-phone-alt text-primary me-2"></small> <small>02-6901-7001</small>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="/"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">Linker</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<c:if test="${ user.role == null }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/loginform" class="nav-item nav-link">로그인</a>
					<a href="/joinform" class="nav-item nav-link">회원가입</a>
				</c:if>
				<c:if test="${ user.role == 'admin' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="feature.html" class="dropdown-item">Feature</a> <a
								href="quote.html" class="dropdown-item">Free Quote</a> <a
								href="team.html" class="dropdown-item">Our Team</a> <a
								href="testimonial.html" class="dropdown-item">Testimonial</a> <a
								href="404.html" class="dropdown-item">404 Page</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 관리자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'seller' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/write" class="nav-item nav-link">식단표 관리</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">식자재 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ingredient/ingredientList" class="dropdown-item">식자재 목록</a>
							<a href="/" class="dropdown-item">재고현황</a> 
							<a href="/" class="dropdown-item">발주내역</a> 
							<a href="/" class="dropdown-item">사용내역</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">비용 관리</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/profitChart" class="dropdown-item">요약</a> 
							<a href="/finance/sales" class="dropdown-item">매출내역</a> 
							<a href="/finance/expenditure" class="dropdown-item">지출내역</a>
						</div>
					</div>
										<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<span class="nav-item nav-link">${user.userid} 판매자님 환영합니다.</span>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
				<c:if test="${ user.role == 'buyer' }">
					<a href="/" class="nav-item nav-link active">Home</a>
					<a href="/notice/notice" class="nav-item nav-link">공지사항</a>
					<a href="/inquiry/inquiry" class="nav-item nav-link">문의사항</a>
					<a href="/menu/list" class="nav-item nav-link">식단표</a>
					<a href="/menu/list" class="nav-item nav-link">식권 구매</a>
					<div class="nav-item dropdown">
						<div class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의 정보</div>
						<div class="dropdown-menu fade-up m-0">
							<a href="/ticketorder/ticket" class="dropdown-item">식권 구매내역</a> 
							<a href="/ticketuse/ticket" class="dropdown-item">식권 사용내역</a>
							<a href="/updateform" class="dropdown-item">회원정보 수정</a> 
							<a href="/deleteform" class="dropdown-item">회원탈퇴</a>
						</div>
					</div>
					<a href="/updateform" style="text-decoration:noe; color:#333">
					<span class="nav-item nav-link" >${user.userid} 구매자님 환영합니다.</span></a>
					<a href="/logout" class="nav-item nav-link">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>

		<div id="fh5co-slider" class="fh5co-section animate-box">
			<div class="fh5co-cover" style="height: 200px"></div>

			<div class="main">
				<div class="container">
					<div class="content">
						<h1 class="title">${ dto.title }</h1>
							<table class="menu">
								<tr>
									<td class="orange">작성자</td>
									<td>${ dto.userID }</td>
								</tr>
								<tr>
									<td class="orange">등록일</td>
									<td><fmt:formatDate value="${ dto.creationDate }" dateStyle="long"/></td>
								</tr>
								<tr>
									<td class="orange">내용</td>
									<td>${ dto.content }</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
									<!-- 작성자의 id와 현재 게시글의 id가 같을 경우 -->
									<c:if test="${ dto.userID == user.userid }">
										<a href="/menu/update/${ dto.menuID }">글 수정</a>
										<a id="delete" href="/menu/delete/${ dto.menuID }">글 삭제</a>
									</c:if>
										<a href="../list">목록 이동</a> 
									</td>
								</tr>
							</table>
				</div>	<%-- main > content end --%>
				</div>	<%-- main > container end --%>
			</div>	<%-- main end --%>

	<div
		class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Linker</a>, All Right
						Reserved.
					</div>
					<div class="col-md-6 text-center text-md-end">
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
		class="bi bi-arrow-up"></i></a>
			</div>	<%-- footer > container end --%>

		
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/wow/wow.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/waypoints/waypoints.min.js"></script>
	<script src="/lib/counterup/counterup.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="/lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#delete").click(function(){
			var menuID = ${ dto.menuID };
			
			$.ajax({
				url: "/menu/delete/" + ${ dto.menuID },
				method: "delete",
				data:{menuID:menuID}
			}).done(function(result){
				alert("삭제가 완료되었습니다.");
				location.replace(result);
			});
			return false;
		});
			
	});
	</script>
	
</body>
</html>