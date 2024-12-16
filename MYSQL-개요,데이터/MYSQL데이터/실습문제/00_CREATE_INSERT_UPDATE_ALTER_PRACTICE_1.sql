USE KHTCAFE;
SELECT * FROM MENU;

USE KHTUSER;

/************************************
************SELECT 문 사용************
**********************************/

-- KHTUSER 데이터 베이스에서 
-- USER table 홍길동의 이메일주소와 전화번호 조회

SELECT USERNAME,EMAIL,PHONE
FROM USER 
WHERE USERNAME = '홍길동';

-- KHTSHOPPING 데이터 베이스
-- `ORDER` 테이블 주문상태가 PENDING 인 주문 수를 조회 오직 주문수
USE KHTSHOPPING;

select count(*)
FROM `ORDER`
WHERE STATUS = 'PENDING';




-- MENU 테이블에서 가장 비싼 메뉴의 이름과 가격 조회

USE KHTCAFE;

select TABLE_NUMBER,CAPACITY
FROM TABLES
where STATUS = 'AVAILABLE';

SELECT NAME,PRICE 
FROM MENU 
ORDER BY PRICE DESC 
LIMIT 1;

-- CAFE_ORDER 테이블에서 STAUS가 PREPARING 인 주문의 테이블 번호와 주문 금액 조회
SELECT TABLE_ID,TOTAL_AMOUNT
FROM CAFE_ORDER 
where STATUS = 'PREPARING';

-- KHTUSER 데이터 베이스에서 LOGIN 활동을 한 사용자들의 이름과 세부활동 정보 확인 
-- JOIN ON
USE KHTUSER;

 
select USERNAME, DETAILS
FROM USER_ACTIVITY A
JOIN USER U
ON A.USER_ID = U.USER_ID
WHERE A.ACTIVITY_TYPE = 'LOGIN';

SELECT * FROM USER;

-- 홍길동 hong123 으로 변경 회원정보에서 비밀번호 변경하겠다 작성 
-- update 테이블명 SET 컬럼명 = 수정할 내용 WHERE 조건과 일치하는 행의;
-- update 문을 SQL 에서 직접적으로 실행할 때 문제가 되는 것을 방지하기 위해 SAFE 모드 생성 
-- 테이블을 삭제할 때도 마찬가지로 SAFE 모드이므로 SAFE MODE 해지 후 실행 가능 

SET SQL_SAFE_UPDATES = 0;

-- SAFE MODE 재설정
SET SQL_SAFE_UPDATES = 1;

update USER SET PASSWORD_HASH = 'hong123'
WHERE USERNAME = '홍길동';

/*
김영희 kim7890
이철수 chulsoo5678
박민수 park245
최수지 choi9876
*/
update USER SET PASSWORD_HASH = 'kim7890'
WHERE USERNAME = '김영희';

update USER SET PASSWORD_HASH = 'chulsoo5678'
WHERE USERNAME = '이철수';

update USER SET PASSWORD_HASH = 'park245'
WHERE USERNAME = '박민수';

update USER SET PASSWORD_HASH = 'choi9876'
WHERE USERNAME = '최수지';

USE KHTCAFE;
SELECT * FROM TABLES;

update TABLES 
SET STATUS = '사용 가능'
WHERE TABLE_NUMBER = 5;

COMMIT;
-- 테이블 자체 수정 tables
-- STATUS 안에는 AVAILABLE OCCUPIED 삽입 가능 OK
-- enum('AVAILABLE','OCCUPIED')
-- CREATE TABLE SET - CHECKBOX 
-- CREATE TABLE ENUM - RADIO

-- 테이블자체 컬럼에 존재하는 규칙 수정
-- ALTER TABLE 수정할 테이블명칭 MODIFY COLUMN 컬럼명 컬럼명의 규칙
ALTER TABLE TABLES
MODIFY column STATUS ENUM('AVAILABLE','OCCUPIED','사용 가능','사용중');



update TABLES 
SET STATUS = '사용중'
WHERE TABLE_NUMBER = 4;

ALTER TABLE CAFE_ORDER
MODIFY column STATUS ENUM('주문 준비중','주문 완료','주문 대기 중','주문 취소','PREPARING','COMPLETED','PENDING','CANCELLED');

select * FROM CAFE_ORDER;

update CAFE_ORDER SET STATUS = '주문 준비중'
WHERE ORDER_ID = 1 ;

update CAFE_ORDER SET STATUS = '주문 완료'
WHERE ORDER_ID = 2 ;

update CAFE_ORDER SET STATUS = '주문 완료'
WHERE ORDER_ID = 4 ;

update CAFE_ORDER SET STATUS = '주문 대기 중'
WHERE ORDER_ID = 3 ;

update CAFE_ORDER SET STATUS = '주문 취소'
WHERE ORDER_ID = 5 ;

-- 테이블 삭제하고 다시 만들기
-- 종료 = 0 시작 = 1  
-- 외래키 체크 종료 
-- DROP TABLE IF exists 테이블명칭;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF exists 테이블명칭;

-- 만약에 MENU 테이블이 잘못되어 삭제하길 원한다면 
-- DROP TABLE IF EXISTS MENU;

-- 테이블 삭제 후 외래키 체크 시작 설정
SET FOREIGN_KEY_CHECKS = 1;