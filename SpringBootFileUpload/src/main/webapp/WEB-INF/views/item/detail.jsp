<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세 정보 | Simple Board</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Pretendard', sans-serif;
	padding: 50px 0;
}

.detail-container {
	max-width: 800px;
	margin: 0 auto;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.card-header {
	background-color: #4e73df;
	color: white;
	padding: 25px;
	border: none;
}

.info-label {
	font-weight: 600;
	color: #4e73df;
	font-size: 0.9rem;
	margin-bottom: 5px;
}

.info-value {
	font-size: 1.1rem;
	color: #444;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #eee;
	min-height: 35px;
}

.auth-box {
	background-color: #f1f3f9;
	border-radius: 10px;
	padding: 20px;
}

.badge-auth {
	background-color: white;
	color: #4e73df;
	border: 1px solid #4e73df;
	padding: 8px 15px;
	border-radius: 20px;
	font-weight: 600;
	display: inline-block;
	margin-right: 5px;
}

.btn-submit {
	background-color: #4e73df;
	border: none;
	padding: 10px 25px;
	color: white;
	font-weight: 600;
}

.btn-submit:hover {
	background-color: #2e59d9;
	color: white;
}

.footer-info {
	font-size: 0.85rem;
	color: #858796;
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container detail-container mt-5">
		<div class="card shadow-sm">
			<div class="card-header d-flex align-items-center bg-white py-3">
				<i class="bi bi-box-seam me-2 fs-3 text-primary"></i>
				<h4 class="mb-0">상품 상세 정보</h4>
			</div>

			<div class="card-body p-4 p-md-5">
				<div class="row">
					<div class="col-md-5 mb-4 mb-md-0 text-center">
						<div class="img-thumbnail p-2">
							<img alt="상품이미지 ${item.name}" src="/item/display?id=${item.id}"
								class="img-fluid"
								style="max-height: 400px; object-fit: contain;">
						</div>
					</div>

					<div class="col-md-7">
						<div class="mb-3">
							<div class="info-label text-muted small">
								<i class="bi bi-hash"></i> 상품 번호
							</div>
							<div class="info-value fs-5">
								<c:out value="${item.id}" default="-" />
							</div>
						</div>

						<div class="mb-3">
							<div class="info-label text-muted small">
								<i class="bi bi-tag"></i> 상품명
							</div>
							<div class="info-value fs-4">
								<strong><c:out value="${item.name}" /></strong>
							</div>
						</div>

						<div class="mb-4">
							<div class="info-label text-muted small">
								<i class="bi bi-currency-dollar"></i> 판매 가격
							</div>
							<div class="info-value fs-4 text-primary fw-bold">
								<fmt:formatNumber value="${item.price}" type="currency"
									currencySymbol="₩" />
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="card-footer bg-light p-4">
				<div class="d-flex justify-content-between align-items-center">
					<a href="/item/list" class="btn btn-outline-secondary px-4"> <i
						class="bi bi-list-ul me-1"></i> 상품 목록
					</a>

					<div class="d-flex gap-2">
						<a href="/item/updateForm?id=${item.id}"
							class="btn btn-primary px-4"> <i
							class="bi bi-pencil-square me-1"></i> 상품 수정
						</a> <a href="/item/delete?id=${item.id}"
							class="btn btn-outline-danger px-4"
							onclick="return confirm('정말로 이 상품을 삭제하시겠습니까?\n삭제 후에는 복구할 수 없습니다.')">
							<i class="bi bi-trash3-fill me-1"></i> 삭제
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>