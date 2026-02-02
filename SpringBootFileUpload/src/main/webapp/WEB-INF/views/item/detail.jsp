<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 상세 정보 | Simple Board</title>
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

	<div class="container detail-container">
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<i class="bi bi-person-vcard me-2 fs-3"></i>
				<h4 class="mb-0">회원 상세 정보</h4>
			</div>

			<div class="card-body p-4 p-md-5">
				<div class="row">
					<div class="col-md-6">
						<div class="info-label">
							<i class="bi bi-hash"></i> 회원번호
						</div>
						<div class="info-value">
							<c:out value="${member.no}" default="-" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="info-label">
							<i class="bi bi-calendar3"></i> 등록일시
						</div>
						<div class="info-value">
							<fmt:formatDate value="${member.regDate}"
								pattern="yyyy.MM.dd HH:mm:ss" />
						</div>
					</div>
					<div class="col-12">
						<div class="info-label">
							<i class="bi bi-person-badge"></i> 아이디
						</div>
						<div class="info-value">
							<strong><c:out value="${member.id}" /></strong>
						</div>
					</div>
					<div class="col-12">
						<div class="info-label">
							<i class="bi bi-info-circle"></i> 이름
						</div>
						<div class="info-value">
							<c:out value="${member.name}" />
						</div>
					</div>
				</div>

				<div class="auth-box mt-3">
					<h6 class="fw-bold mb-3">
						<i class="bi bi-shield-lock me-1"></i> 부여된 권한
					</h6>
					<div class="d-flex flex-wrap gap-2">
						<c:choose>
							<c:when test="${not empty member.authList}">
								<c:forEach var="authItem" items="${member.authList}">
									<c:if test="${not empty authItem.auth}">
										<span class="badge-auth"> <i
											class="bi bi-shield-check me-1"></i> <c:choose>
												<c:when test="${authItem.auth eq 'ROLE_ADMIN'}">관리자</c:when>
												<c:when test="${authItem.auth eq 'ROLE_MEMBER'}">회원</c:when>
												<c:when test="${authItem.auth eq 'ROLE_USER'}">사용자</c:when>
												<c:otherwise>${authItem.auth}</c:otherwise>
											</c:choose>
										</span>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span class="text-muted">부여된 권한이 없습니다.</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<div class="card-footer bg-light p-4">
				<div class="d-flex justify-content-between align-items-center">
					<a href="/member/memberList" class="btn btn-outline-secondary">
						<i class="bi bi-list-ul me-1"></i> 목록으로
					</a>
					<div class="d-flex gap-2">
						<a href="/member/updateForm?no=${member.no}"
							class="btn btn-submit"> <i class="bi bi-pencil-square me-1"></i>
							수정
						</a> <a href="/member/delete?no=${member.no}"
							class="btn btn-outline-danger"
							onclick="return confirm('이 회원 데이터를 삭제하시겠습니까?')"> <i
							class="bi bi-trash3-fill me-1"></i> 삭제
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>