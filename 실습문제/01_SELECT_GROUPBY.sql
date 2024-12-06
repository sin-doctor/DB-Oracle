-- 1. EMPLOYEE 테이블에서 모든 데이터를 조회하세요.
SELECT * 
FROM employee;
-- 2. DEPARTMENT 테이블에서 DEPT_TITLE과 LOCATION_ID를 조회하세요.
SELECT DEPT_TITLE,LOCATION_ID
FROM department;

-- 3. EMPLOYEE 테이블에서 SALARY가 3,000,000 이상인 직원들의 EMP_NAME과 SALARY를 조회하세요.
SELECT EMP_NAME, SALARY
FROM employee
WHERE SALARY >= 3000000;
-- 4. DEPARTMENT 테이블에서 LOCATION_ID가 'L1'인 부서를 조회하세요.
SELECT LOCATION_ID
FROM department
WHERE LOCATION_ID = 'L1';
-- 5. EMPLOYEE 테이블에서 BONUS가 NULL인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE BONUS IS NULL;
-- 6. EMPLOYEE 테이블에서 SALARY가 2,500,000 이상이고 BONUS가 0.2 이상인 직원의 EMP_NAME을 조회하세요.
SELECT EMP_NAME
FROM employee
WHERE salary >= 2500000
AND BONUS >= 0.2;
-- 7. EMPLOYEE 테이블에서 JOB_CODE가 'J6'이거나 'J7'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE job_code IN ('J6','J7');
-- 8. DEPARTMENT 테이블에서 DEPT_TITLE에 '영업'이라는 단어가 포함된 부서를 조회하세요.
SELECT *
FROM department
WHERE dept_title = '%영업%';
-- 9. EMPLOYEE 테이블에서 입사일(HIRE_DATE)이 2000년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE hire_date >=TO_DATE('2000-01-01','YYYY-MM-DD');
-- 10. EMPLOYEE 테이블에서 퇴직 여부가 'Y'이고 퇴사일이 2015년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE ENT_YN = 'Y'
AND ENT_DATE >=TO_DATE('2015-01-01','YYYY-MM-DD');
-- 11. EMPLOYEE 테이블에서 EMP_NAME의 첫 글자가 '김'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '김%';
-- 12. EMPLOYEE 테이블에서 JOB_CODE가 'J1', 'J2', 'J3'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE job_code IN('J1','J2','J3');

-- 13. EMPLOYEE 테이블에서 특정 DEPT_CODE('D1', 'D5', 'D9')를 제외한 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE dept_code NOT IN('D1', 'D5', 'D9');
-- 14. EMPLOYEE 테이블에서 MANAGER_ID가 NULL인 직원들의 EMP_NAME과 DEPT_CODE를 조회하세요.
SELECT EMP_NAME,DEPT_CODE
FROM employee
WHERE MANAGER_ID IS NULL;
-- 15. EMPLOYEE 테이블에서 EMP_NAME에 '김'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '%김%';
-- 16. EMPLOYEE 테이블에서 EMAIL 주소에 'gmail'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%gmail%';
-- 17. EMPLOYEE 테이블에서 PHONE 번호가 '010'으로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE PHONE LIKE '010%';
-- 18. EMPLOYEE 테이블에서 PHONE 번호가 '1234'로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE PHONE LIKE '%1234';
-- 19. DEPARTMENT 테이블에서 DEPT_TITLE이 '영업'으로 끝나는 부서를 조회하세요.
SELECT *
FROM department
WHERE DEPT_TITLE LIKE '%영업';
-- 20. DEPARTMENT 테이블에서 DEPT_TITLE에 '관리'라는 단어가 포함된 부서를 조회하세요.
SELECT *
FROM department
WHERE DEPT_TITLE LIKE '%관리%';

-- 21. EMPLOYEE 테이블에서 EMP_NAME이 '이'로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '이%';
-- 22. EMPLOYEE 테이블에서 JOB_CODE가 'J'로 시작하고 두 번째 문자가 '1'인 직원을 조회하세요.
SELECT *
FROM employee
WHERE job_code LIKE 'J1%';


-- 23. EMPLOYEE 테이블에서 EMAIL이 'com'으로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%com';

-- 24. EMPLOYEE 테이블에서 HIRE_DATE의 연도가 2021년인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE HIRE_DATE =TO_DATE('2021','yyyy');
-- 25. EMPLOYEE 테이블에서 EMP_NAME의 마지막 글자가 '호'인 직원들의 정보를 조회하세요.
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%호';
-- 26. EMPLOYEE 테이블에서 EMAIL에 'company'라는 단어가 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%company%';

-- 27. EMPLOYEE 테이블에서 EMP_NAME에 '수'로 시작하거나 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '수%'
OR EMP_NAME LIKE '%수';

-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.
SELECT E.EMP_NAME,D.DEPT_TITLE
FROM DEPARTMENT D,EMPLOYEE E
WHERE D.DEPT_ID = E.DEPT_CODE
AND E.EMAIL IS NOT NULL;

-- 2. 각 부서의 최고 급여를 출력하시오.
SELECT DEPT_CODE,MAX(E.SALARY)
FROM EMPLOYEE E
GROUP BY DEPT_CODE, EMP_NAME
ORDER BY DEPT_CODE, MAX(SALARY) DESC;

-- 2-1. 각 부서의 최고 급여를 출력하시오.(부서별 최고 급여만 받는 사람 출력)
---- 서브쿼리가 추가 
SELECT DEPT_CODE,SALARY,EMP_NAME
FROM EMPLOYEE E
WHERE (DEPT_CODE, SALARY) IN(
	SELECT DEPT_CODE, MAX(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPT_CODE)
	ORDER BY DEPT_CODE;
	

-- 3. 각 급여 등급별 직원 수를 출력하시오.
SELECT SAL_LEVEL,COUNT(*) 
FROM EMPLOYEE
GROUP BY SAL_LEVEL;

-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
SELECT DEPT_TITLE, AVG(SALARY) AS 평균급여
FROM EMPLOYEE, DEPARTMENT
/*WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID*/
GROUP BY DEPT_TITLE
ORDER BY AVG(SALARY) DESC;


-- 5. 지역별 부서 수를 출력하시오.
----COUNT(DISTINCT 컬럼명)
SELECT LOCATION_ID ,COUNT(DISTINCT DEPT_ID) AS 부서 수
FROM DEPARTMENT
GROUP BY LOCATION_ID;

-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS 평균급여, AVG(BONUS) AS 평균보너스비율
FROM EMPLOYEE, DEPARTMENT
GROUP BY DEPT_CODE
ORDER BY AVG(BONUS);
-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
SELECT DEPT_TITLE, AVG(SALARY) AS 평균급여, AVG(BONUS) AS평균보너스비율
FROM EMPLOYEE, DEPARTMENT
GROUP BY DEPT_TITLE
ORDER BY DEPT_TITLE;
--8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
SELECT DEPT_CODE, COUNT(*) AS 퇴사자
FROM EMPLOYEE
WHERE ENT_YN = 'Y'
GROUP BY DEPT_CODE
ORDER BY 퇴사자 DESC;
