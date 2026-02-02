<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정 | Simple Board</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
/* 전체 배경 및 폰트 */
body {
	background-color: #f8f9fa;
	font-family: 'Pretendard', sans-serif;
	padding: 50px 0;
}

.update-container {
	max-width: 700px;
	margin: 0 auto;
}

/* 카드 스타일 */
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

/* 폼 스타일 */
.form-label {
	font-weight: 600;
	color: #4e73df;
	font-size: 0.9rem;
}

.form-control:read-only {
	background-color: #eaecf4;
	cursor: not-allowed;
}

.form-control:focus {
	border-color: #4e73df;
	box-shadow: 0 0 0 0.25 darkred;
}

/* 권한 선택 영역 전용 */
.auth-section {
	background-color: #f1f3f9;
	padding: 20px;
	border-radius: 10px;
}

/* 버튼 디자인 */
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

.btn-cancel {
	font-weight: 600;
	padding: 10px 25px;
}
</style>
</head>
<body>

	<div class="container update-container">
		<div class="card">
			<div class="card-header text-center">
				<h4 class="mb-0">
					<i class="bi bi-person-gear me-2"></i><strong>${member.name}</strong>님
					정보 수정
				</h4>
			</div>

			<div class="card-body p-4 p-md-5">
				<form:form modelAttribute="member" action="/member/update"
					method="post">

					<div class="row">
						<div class="col-md-6 mb-4">
							<label for="no" class="form-label">회원번호</label>
							<form:input path="no" class="form-control" readonly="true" />
						</div>

						<div class="col-md-6 mb-4">
							<label for="id" class="form-label">아이디</label>
							<form:input path="id" class="form-control" readonly="true" />
						</div>
					</div>

					<div class="mb-4">
						<label for="name" class="form-label">이름</label>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<form:input path="name" class="form-control"
								placeholder="이름을 입력하세요" required="required" />
						</div>
					</div>

					<div class="mb-4">
						<label for="pw" class="form-label">새 비밀번호</label>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-lock"></i></span>
							<form:password path="pw" class="form-control"
								placeholder="비밀번호를 입력하세요" required="required"
								showPassword="true" />
						</div>
					</div>

					<div class="auth-section mb-4">
						<label class="form-label mb-3 text-dark"><i
							class="bi bi-shield-lock me-1"></i> 권한 설정</label>
						<div class="row g-2">
							<div class="col-md-4">
								<form:select path="authList[0].auth"
									class="form-select border-primary">
									<form:option value="" label="= 미지정 =" />
									<form:option value="ROLE_USER" label="사용자" />
									<form:option value="ROLE_MEMBER" label="회원" />
									<form:option value="ROLE_ADMIN" label="관리자" />
								</form:select>
							</div>
							<div class="col-md-4">
								<form:select path="authList[1].auth"
									class="form-select border-primary">
									<form:option value="" label="= 미지정 =" />
									<form:option value="ROLE_USER" label="사용자" />
									<form:option value="ROLE_MEMBER" label="회원" />
									<form:option value="ROLE_ADMIN" label="관리자" />
								</form:select>
							</div>
							<div class="col-md-4">
								<form:select path="authList[2].auth"
									class="form-select border-primary">
									<form:option value="" label="= 미지정 =" />
									<form:option value="ROLE_USER" label="사용자" />
									<form:option value="ROLE_MEMBER" label="회원" />
									<form:option value="ROLE_ADMIN" label="관리자" />
								</form:select>
							</div>
						</div>
						<div class="form-text mt-2">
							<i class="bi bi-info-circle"></i> 최대 3개까지 권한을 부여할 수 있습니다.
						</div>
					</div>

					<hr class="my-4">

					<div class="d-flex justify-content-center gap-2">
						<button type="submit" class="btn btn-submit">
							<i class="bi bi-check-lg me-1"></i> 수정완료
						</button>
						<button type="reset" class="btn btn-outline-warning btn-cancel">
							<i class="bi bi-arrow-counterclockwise"></i> 초기화
						</button>
						<a href="/member/memberList"
							class="btn btn-outline-secondary btn-cancel"> 취소 </a>
					</div>

				</form:form>
			</div>
		</div>
		<p class="text-center mt-4 text-muted small">© Simple Board Member
			Management System</p>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>