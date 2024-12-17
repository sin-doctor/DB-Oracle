USE khtshopping;

select * from product;

select * from `order`;

select * from review;

select * from order_item;

-- PENDING -> 대기
-- SHIPPED -> 배송 중 
-- DELIVERED -> 배송 완료
-- CANCELLED -> 취소 

-- 1) safe_update = 0;
-- 2) alter status 변경
-- 3) update작성 


SET SQL_SAFE_UPDATES = 1;
alter table `ORDER` 
modify column STATUS enum('대기','배송중','배송 완료','취소','PENDING','SHIPPED','DELIVERED','CANCELLED') default '대기';

COMMIT;
UPDATE `ORDER` SET STATUS = '취소' WHERE USER_ID = 4;

USE KHTUSER;

SELECT * FROM USER;

-- 이메일주소 도메인이 example.com -> kht.co.kr 변경 
-- CONCAT SUBSTRING SUBSTRING_INDEX 이용해서 변경 
-- LIKE로 일치하는지 확인 후 변경 가능 하지만 코드가 길어져 힘듦

SELECT CONCAT('Hello','','World','!'); -- CONCAT으로 이어붙여 출력되는지 확인 

SELECT SUBSTRING_INDEX('user@example.com','@',1); -- user

SELECT SUBSTRING_INDEX('user@example.com','@',-1); -- example.com

SELECT CONCAT(substring_index('user@example.com','@',1),'@kht.com');

/* 
Error Code: 1175 SAFE UPDATE MODE 비활성화 
	-> 1번 EDIT -> Preferences -> SQL Editor -> 맨 밑에 Safe Updates(reject Update and delete ~~~) 비활성화
    또는 
    -> 2번 SET SQL_SAFE_UPDATES = 0;

*/
SET SQL_SAFE_UPDATES = 0;

UPDATE USER 
SET EMAIL = CONCAT(substring_index(EMAIL,'@',1),'@kht.com');
/*
ERROR CODE : 1406 : 컬럼이 VARCHAR(20)또는 그보다 작은 길이로 정의된 경우 새로운 값이 길이 제한을 넘어서기 때문에 발생하는 에러
컬럼에 존재하는 길이 늘리기 

*/

-- USER 테이블에서 전화번호 앞에 +82) 를 붙여주기
-- 최종 PHONE +82)010-XXXX-XXXX
UPDATE USER 
SET PHONE = CONCAT('+082)',PHONE);

rollback;

select * from user;
commit;

ALTER TABLE USER modify column PHONE varchar(20);
SET FOREIGN_KEY_CHECKS = 1;
DROP TABLE user;