-- 사용자 정의 변수
SET @myVariable1 = 5;
SET @myVariable2 = 3;
SELECT @myVariable1;
SELECT @myVariable1 + @myVariable2;


-- 내장함수
-- 1. 제어흐름함수

-- IF: 조건, 참일때, 거짓일때
SELECT IF (100 < 200, '참', '거짓');

-- CASE: 다양한 조건 평가
SET @myNumber = 4;   -- 평가할 값
SELECT CASE @myNumber
	WHEN 1 THEN '일'
	WHEN 2 THEN '이'
	WHEN 3 THEN '삼'
    ELSE '기타등등'
END AS 'case문 결과';    

-- IFNULL: 첫번째 인자가 null 인 경우 두번째 인자 반환, 첫번째 인자가 null이 아닌 경우 첫번째 인자 반환
SET @myValue = null;
SELECT ifnull(null, '널'), ifnull(1, '널');

--  NULLIF: 두 인자가 같으면 null, 다르면 인자1 반환
SELECT nullif(100,100), nullif(200,100);

-- 2. 문자열 함수
-- CONCAT: 두 개 이상의 문자열을 결합
SELECT concat('hello' , ',','sql','!');

-- CONCAT_WS(): 구분자를 포함해서 결합
SELECT concat_ws('-', '2024','04','11');
SELECT concat_ws('/', '2024','04','11');

-- SUBSTRING: 문자열의 특정부분 추출 (문자열, 시작위치, 끝위치)
SELECT substring('hello, SQL',1 ,5);

-- LEFT, RIGHT: 왼쪽에서부터 추출, 오른쪽에서부터 추출
SELECT left('Hello, SQL', 5);
SELECT right('Hello, SQL', 5);

-- LENGTH: 문자열의 길이
SELECT length('Hello, SQL');
SELECT length('안녕하세요');   -- 한글(유니코드)은 3씩 3*5 = 15
SELECT char_length('안녕하세요');   -- byte에 상관없이, 문자열 갯수 반환 

-- REPLACE: 문자열에서 특정부분을, 다른 문자열로 대체
SELECT replace('안녕하세요','안녕','평안');

-- TRIM: 문자열 시작과 끝의 공백을 제거 (중간 공백은 제거 안됨)
SELECT trim('   안녕하세요  ');    -- 양쪽 제거
SELECT ltrim('   안녕하세요  ');   -- 왼쪽만 제거
SELECT rtrim('   안녕하 세요  ');   -- 오른쪽만 제거

-- UPPER, LOWER: 대문자, 소문자 변환
SELECT upper('Hello, SQL');
SELECT lower('Hello, SQL');

-- LPAD, RPAD: 빈 곳을 문자열로 채움.
SELECT lpad('안녕하세요', 7, '##');
SELECT rpad('안녕하세요', 7, '##');

-- REPEAT: 문자열을 횟수만큼 반복
SELECT repeat('안녕', 5);

-- REVERSE: 문자열을 뒤집는다.
SELECT reverse('안녕하세요');

-- SPACE: 공백을 반환
SELECT concat('안녕',space(10), '하세요') ;

-- FORMAT: 숫자를 1000 단위마다 콤마 단위로 표시, 소수점 자릿수 표현 (숫자, 소수점자리수)
SELECT format(100000000.4323234,2);

-- BIN, HEX, OCT: 2진수, 16진수, 8진수
SELECT bin(10), hex(10), oct(10), 10;


-- 3. 수학함수

-- ABS(숫자): 절대값
SELECT abs(100), abs(-100);

-- CEIL: 올림, FLOOR: 내림, ROUND: 반올림
SELECT ceil(23.4), floor(23.4), round(23.4), round(23.5);

-- POW(숫자, 제곱수): 거듭제곱
SELECT pow(2,10), power(2,10);

-- SQRT(숫자) 제곱근
SELECT sqrt(16);

-- RAND(): 0 이상 1 미만 랜덤수
SELECT rand(), floor(1 + rand() * 6);   -- 1~6까지 정수를 구하고 싶을 때

-- MOD(숫자, 나눌 숫자): 나머지 연산
SELECT mod(10,3);

-- LOG 자연로그, LOG10 상용로그
SELECT LOG(2.71828), LOG10(100);

-- PI: 원주율
SELECT pi();

-- CONV(숫자, 이전진수, 변환할진수): 진법변환
SELECT conv(10,10,2), conv(1010,2,10), conv('A' ,16,2);


-- 4. 날짜 및 시간 함수

-- NOW(): 현재 날짜 시간 반환
-- curdate(): 현재 날짜만 반환, current_date() 와 동일
-- curtime(): 현재 시간만 반환, current_time() 와 동일
SELECT now(), curdate(), curtime(), current_date() ,current_time();

-- DATE 날짜/시간 값에서 날짜만 
-- TIME 날짜/시간 값에서 시간만
SELECT date('2024-04-11 10:42:22'), time('2024-04-11 10:42:22');

-- year, month, day, hour, minute, second: 연월일 시분초 각각
SELECT year(now()), month(now()), day(now());
SELECT hour(now()), minute(now()), second(now());

-- DATE_FORMAT(날짜시간, '포멧')
SELECT date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %s초');

-- DAREDIFF(날짜1, 날짜2): 두 날짜 간의 차이 반환
-- TIMEDIFF(시간1, 시간2): 두 시간 간의 차이 반환
SELECT datediff('2024-04-11','2015-11-29');
SELECT timediff('11:04:00', '16:30:00'); 

-- LAST_DAY(날짜): 그 달의 마지막 날짜를 구함
SELECT LAST_DAY('2024-02-01'), LAST_DAY('2025-02-01');

-- WEEKDAY(날짜): 요일 반환, 월요일이 0 ~ 일요일이 6 정수 반환
SELECT weekday(now());    -- 월요일이 0부터 시작
SELECT dayofweek(now());  -- 일요일이 1부터 시작

-- ADDDATE(날짜, 차이): 날짜를 더한 날짜를 반환 <-> SUBDATE
SELECT adddate(now(), interval 100 day); -- 오늘부터 100일 더한 날짜
SELECT subdate(now(), interval 100 day); -- 오늘부터 100일 뺀 날짜

-- ADDTIME(날짜시간, 시간): 해당 날짜시간 기준으로, 시간을 더한 결과를 반환
SELECT addtime(now(), '20:30:30');
SELECT subtime(now(), '20:30:30');

-- QUATER(날짜): 4분기 중 몇분기인지를 반환
SELECT quarter(now());

-- TIME_TO_SEC(시간): 시간을 초 단위로 반환
SELECT time_to_sec('02:30:00');



-- 5. 시스템 정보 함수
SELECT version();        -- 현재 MySQL 버전
SELECT user();           -- 현재 사용자 이름과 호스트명 
SELECT database();       -- 현재 사용중인 데이터베이스(스키마) 이름을 반환
SELECT connection_id();  -- 현재 연결에 할당하는 고유식별번호 반환 

-- sleep: 쿼리의 실행을 n초간 멈춘다.
SELECT sleep(3);        
SELECT '3초 후에 보여요';

-- 시스템 변수: @@시스템변수이름
SELECT @@autocommit, @@max_connections;

-- 참고사이트
-- https://dev.mysql.com/doc/refman/8.0/en/functions.html






 













