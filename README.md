📋 상품 관리 시스템 (Item Management System)
Spring Boot와 MyBatis를 활용하여 상품의 정보와 이미지를 관리하는 웹 애플리케이션입니다.
개발 날짜 2026년 02월 02일

🚀 주요 구현 기능
1. 상품 등록 (Create)
상품명, 가격, 설명 및 이미지 파일 업로드 기능.

UUID를 활용하여 파일명 중복을 방지하고 지정된 외장 경로(upload.path)에 안전하게 저장.

이미지 업로드 시 원본 파일명, 크기, ContentType을 로그로 기록.

2. 상품 목록 및 상세 조회 (Read)
전체 상품 리스트 출력 및 특정 상품 상세 정보 확인.

ResponseEntity<byte[]>를 사용하여 서버 외장 경로에 저장된 이미지를 웹 브라우저에 직접 스트리밍(display).

3. 상품 수정 (Update) 🛠️ (이번 작업의 핵심)
기존 상품 정보를 불러와 수정하는 기능.

이미지 변경 로직 처리:

새 이미지를 업로드할 경우: 기존 파일을 서버에서 삭제 후 새 파일 저장.

이미지를 변경하지 않을 경우: 기존 이미지 경로(url)를 유지하여 데이터 무결성 확보.

MultipartFile의 존재 여부에 따른 조건부 업데이트 로직 구현.

4. 상품 삭제 (Delete)
DB 내 상품 정보 삭제와 동시에 서버 내 실제 이미지 파일 삭제 처리.

Path Traversal 공격 방지를 위한 파일 경로 검증 로직 포함.

🛠️ 기술 스택
Framework: Spring Boot

View Engine: JSP (JSTL)

Persistence: MyBatis, MariaDB/MySQL

Library: Apache Commons IO (이미지 변환), Lombok

Design: Bootstrap 5.3

📂 프로젝트 구조 (Controller)
GET /item/createForm: 등록 페이지 이동

POST /item/create: 상품 및 파일 저장

GET /item/list: 상품 목록 조회

GET /item/detail: 상세 정보 조회

GET /item/updateForm: 수정 페이지 이동

POST /item/update: 정보 및 파일 갱신

GET /item/delete: 상품 및 파일 삭제

GET /item/display: 이미지 실시간 출력

📂 테이블 구조
CREATE TABLE item( 
    id NUMBER(5), 
    name VARCHAR2(20), 
    price NUMBER(6), 
    description VARCHAR2(300), 
    url VARCHAR2(200), 
    PRIMARY KEY (id) 
); 
-- 가격 제한을 10억 단위(9,999,999,999)로 확장
ALTER TABLE item MODIFY (price NUMBER(10));

-- 아이디 제한을 10억 단위로 확장 (미래를 위해)
ALTER TABLE item MODIFY (id NUMBER(10));

-- 혹시 이름(name)도 20바이트면 한글 6~7자밖에 안 들어가니 늘려주는 걸 추천합니다.
ALTER TABLE item MODIFY (name VARCHAR2(100));
desc item;

drop sequence item_seq;
create sequence item_seq 
start with 1 
increment by 1; 

💡 개발 중 해결 사항
수정 시 파일 유실 방지: 수정을 진행할 때 새 파일을 선택하지 않아도 기존 파일 경로가 null이 되지 않도록 oldItem 정보를 조회하여 유지하도록 개선하였습니다.

보안 강화: 파일 삭제 시 .. 문자를 검사하여 상위 디렉토리 접근 공격을 차단하는 로직을 추가하였습니다.
