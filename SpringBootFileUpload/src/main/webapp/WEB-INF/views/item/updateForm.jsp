<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성 | Simple Board</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f8f9fa;
}

.write-container {
	max-width: 800px;
	margin: 50px auto;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #4e73df;
	color: white;
	border-radius: 15px 15px 0 0 !important;
	padding: 20px;
}

.form-label {
	font-weight: 600;
	color: #444;
}

.btn-submit {
	background-color: #4e73df;
	border: none;
	padding: 10px 25px;
}

.btn-submit:hover {
	background-color: #2e59d9;
}
</style>
</head>
<body>

	<div class="container write-container">
		<div class="card">
			<div class="card-header">
				<h4 class="mb-0">
					<i class="bi bi-pencil-square me-2"></i>업데이트
				</h4>
			</div>


			<div class="card-body p-4">
				<form action="/item/update" method="post"
					enctype="multipart/form-data">
					<div class="mb-4">
						<label for="id" class="form-label">상품아이디</label> <input
							type="text" class="form-control form-control-lg" id="id"
							name="id" value="${item.id}" readonly>
					</div>
					<div class="mb-4">
						<label for="name" class="form-label">상품이름</label> <input
							type="text" class="form-control form-control-lg" id="name"
							name="name" value="${item.name}" required>
					</div>

					<div class="mb-4">
						<label for="price" class="form-label">상품가격</label>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<input type="text" class="form-control" id="price" name="price"
								value="${item.price}" required>
						</div>
					</div>
					<div class="mb-4">
						<label for="picture" class="form-label">상품</label>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<img alt="상품이미지 ${item.name}" src="/item/display?id=${item.id}"
								width="300" id="picture">
						</div>
					</div>

					<div class="mb-4">
						<label for="picture" class="form-label">상품파일</label> <input
							type="file" class="form-control form-control-lg" id="picture"
							name="picture" required>
					</div>

					<div class="mb-4">
						<label for="picture" class="form-label">상품이미지설명</label>
						<textarea type="text" class="form-control form-control-lg"
							id="description" name="description">${item.description}</textarea>
					</div>

					<hr class="my-4">

					<div class="d-flex justify-content-end gap-2">
						<a href="/item/list"><button type="button"
								class="btn btn-outline-secondary">상품이미지리스트</button></a>
						<button type="submit" class="btn btn-primary btn-submit">
							</i> 상품수정
						</button>
						<button type="reset" class="btn btn-primary btn-submit">
							상품수정취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>