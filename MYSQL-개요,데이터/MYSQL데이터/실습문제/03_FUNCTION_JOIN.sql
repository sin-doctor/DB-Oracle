-- 함수 이용한 selct 작성 

-- 'MySQL'  '' 'is'  'Awesome!'
-- > 붙여서 출력 
select concat('MySQL',' ','is ','Awesome!');

-- hello.world.program 에서 hello.world 까지만 출력
SELECT SUBSTRING_INDEX('hello.world.program','.p',1); -- user
-- 전화번호에 5678이 들어가는 user 수 확인 
SELECT count(*)
FROM USER 
WHERE PHONE LIKE '%5678%';

rollback;
SELECT * FROM USER;
-- PRODUCT 
USE KHTSHOPPING;
-- CONCAT 이용해서 제품명 : 울트라 게이밍 키보드, 가격 89000원 으로 출력 
SELECT * FROM PRODUCT;

SELECT CONCAT('제품명 : ',NAME,',가격',PRICE,'원')
FROM PRODUCT 
where PRODUCT_ID = 3;

update product
SET NAME = concat('제품명 : ',NAME);

update product
SET PRICE = concat('가격 : ',PRICE);

-- REVIEW 테이블에서 제품아이디 3번의 댓글 길이
SELECT * FROM REVIEW;
SELECT length(COMMENT) 
FROM review
WHERE PRODUCT_ID = 3;

-- REVIEW 제품아이디 4번에 작성된 댓글에서 좋고 -> 훌륭하고 바꿔서 출력 
select replace(COMMENT,'좋고','훌륭하고')
FROM REVIEW 
WHERE product_ID = 4;

select * FROM `ORDER`;
select * FROM order_item;
select * FROM PRODUCT;
select * FROM REVIEW;

-- ORDER 테이블 ORDER_ITEM 테이블 JOIN

select O.ORDER_ID, O.USER_ID, O.STATUS , O.TOTAL_AMOUNT,
		OI.PRODUCT_ID, OI.QUANTITY, OI.PRICE, P.NAME
FROM `ORDER` O
/*inner*/JOIN ORDER_ITEM OI
ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCT P 
ON P.PRODUCT_ID = OI.PRODUCT_ID;
-- 조건이 맞는 행만 가져옴

-- PRODUCT 테이블과 REVIEW 테이블 INNER JOIN
SELECT P.PRODUCT_ID, P.NAME,R.USER_ID,R.RATING,R.COMMENT
FROM product P 
inner JOIN review R
ON P.PRODUCT_ID = R.PRODUCT_ID;

-- LEFT JOIN 사용 ORDER REVIEW 테이블 연결해서 모든 주문이 포함되도록 하되,
-- REVIEW 가 없는 주문은 NULL 로 표시되게 처리 

SELECT O.ORDER_ID,O.USER_ID, O.STATUS,R.product_ID,R.RATING, R.COMMENT
FROM `ORDER` O 
LEFT JOIN REVIEW R 
ON O.USER_ID = R.USER_ID;

-- REVIEW 테이블과 ORDER 테이블을 RIGHT JOIN으로 연결해서 모든 리뷰가 포함되도록 하고,
-- 주문 정보가 없는 경우는 NULL 표기되게 하기 
select R.product_ID,R.USER_ID,R.RATING,R.COMMENT,O.ORDER_ID,O.STATUS
FROM REVIEW R 
RIGHT JOIN `ORDER` O
ON R.USER_ID = O.USER_ID;

USE KHTCAFE;

CREATE TABLE SNACK (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2),
    STOCK INT
);

INSERT INTO SNACK (ID, NAME, CATEGORY, PRICE, STOCK) VALUES
(1, '초코칩 쿠키', '과자', 1500.00, 50),
(2, '양파링', '스낵', 2000.00, 30),
(3, '포테이토칩', '스낵', 2500.00, NULL),
(4, '치즈볼', '과자', 1800.00, 40),
(5, NULL, '스낵', 3000.00, 20);

CREATE TABLE SNACK_ORDER (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SNACK_ID INT,
    QUANTITY INT,
    ORDER_DATE DATETIME,
    STATUS VARCHAR(20)
);

INSERT INTO SNACK_ORDER (ID, SNACK_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1, 1, 3, '2024-12-16 10:35:00', '배송 중'),
(2, 2, 2, '2024-12-16 11:00:00', '대기'),
(3, NULL, 1, '2024-12-16 12:00:00', '취소'),
(4, 3, NULL, '2024-12-16 13:00:00', '배송 완료'),
(5, 5, 5, '2024-12-16 14:00:00', NULL);

SELECT * FROM SNACK;

SELECT * FROM SNACK_ORDER;

-- INNER JOIN 
SELECT S.ID,S.NAME,S.CATEGORY,S.PRICE,S.STOCK
FROM SNACK S
INNER JOIN SNACK_ORDER O 
ON S.ID = O.SNACK_ID; -- ID와 SNACK_ID 값이 일치하는 데이터만 가져오기

-- LEFT JOIN
SELECT S.ID,S.NAME,S.CATEGORY,S.PRICE,S.STOCK,
O.QUANTITY,O.ORDER_DATE,O.STATUS
FROM SNACK S
LEFT JOIN SNACK_ORDER O 
ON S.ID = O.SNACK_ID;  -- 4번 아이디 조회 X 
-- SNACK_ORDER 에 일치하는 주문이 없으면 NULL

-- RIGHT JOIN 스낵 오더 테이블의 모든 데이터를 가져오고 왼쪽 테이블의 일치하는 데이터를 가져옴
SELECT S.ID,S.NAME,S.CATEGORY,S.PRICE,S.STOCK,
O.QUANTITY,O.ORDER_DATE,O.STATUS
FROM SNACK S
right JOIN SNACK_ORDER O 
ON S.ID = O.SNACK_ID;  -- 4번 아이디 조회 X 
-- SNACK_ORDER 에 일치하는 주문이 없으면 NULL

