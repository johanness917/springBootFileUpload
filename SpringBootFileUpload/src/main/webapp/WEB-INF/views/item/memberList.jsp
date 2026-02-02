<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 리스트 | Simple Board</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
/* 첫 번째 코드의 스타일 기반 */
body {
	background-color: #f8f9fa;
	font-family: 'Pretendard', sans-serif;
	padding-top: 50px;
}

.list-container {
	max-width: 1000px;
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
	padding: 20px;
	border-bottom: none;
}

/* 테이블 스타일 커스텀 */
.table {
	margin-bottom: 0;
}

.table thead th {
	background-color: #f8f9fc;
	color: #4e73df;
	font-weight: 700;
	text-transform: uppercase;
	border-top: none;
	padding: 15px;
}

.table tbody td {
	padding: 15px;
	vertical-align: middle;
	color: #5a5c69;
}

.table tbody tr:hover {
	background-color: #f1f3f9;
	transition: background-color 0.2s ease;
}

/* 버튼 스타일 */
.btn-group-top {
	display: flex;
	gap: 10px;
}

.btn-custom {
	border-radius: 8px;
	font-weight: 600;
	padding: 8px 20px;
	transition: 0.3s;
}

.id-link {
	color: #4e73df;
	text-decoration: none;
	font-weight: 600;
}

.id-link:hover {
	text-decoration: underline;
}

.footer-info {
	font-size: 0.85rem;
	color: #858796;
	margin-top: 15px;
}
</style>
</head>
<body>

	<div class="container list-container">
		<div class="card">
			<div
				class="card-header d-flex justify-content-between align-items-center">
				<h4 class="mb-0">
					<i class="bi bi-people-fill me-2"></i>회원 리스트
				</h4>
				<div class="btn-group-top">
					<a href="/member/insertForm"
						class="btn btn-light btn-sm btn-custom text-primary"> <i
						class="bi bi-person-plus-fill me-1"></i>회원가입
					</a>
				</div>
			</div>

			<div class="search-container">
				<form action="/member/search" method="get" class="search-form">
					<select name="searchType" class="search-select">
						<option value="id">ID</option>
						<option value="name">NAME</option>
					</select> <input type="text" name="keyword" class="search-input"
						placeholder="Search mission...">
					<button type="submit" class="btn-search">SEARCH</button>
				</form>
			</div>

			<div class="card-body p-0">
				<div class="table-responsive">
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th style="width: 10%">NO</th>
								<th style="width: 20%">아이디</th>
								<th style="width: 20%">비밀번호</th>
								<th style="width: 20%">이름</th>
								<th style="width: 30%">가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty memberList}">
									<c:forEach var="member" items="${memberList}">
										<tr>
											<td><span class="badge bg-light text-dark border">${member.no}</span></td>
											<td><a href="/member/detail?no=${member.no}"
												class="id-link"> ${member.id} </a></td>
											<td><code class="text-muted">********</code></td>
											<td><strong>${member.name}</strong></td>
											<td><span class="text-muted"> <fmt:formatDate
														value="${member.regDate}" pattern="yyyy-MM-dd" />
											</span></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="py-5 text-muted"><i
											class="bi bi-exclamation-circle d-block mb-2"
											style="font-size: 2rem;"></i> 등록된 회원이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-between align-items-center px-2">
			<div class="footer-info">
				<i class="bi bi-cpu me-1"></i> SYSTEM: CONNECTED TO DATABASE
			</div>
			<div class="mt-3">
				<a href="/member/memberList"
					class="btn btn-outline-secondary btn-sm"> <i
					class="bi bi-arrow-clockwise"></i> 새로고침
				</a>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>