-- ### **연습문제**
/*
**`LibraryManagement`** 데이터베이스는 도서관 관리 시스템을 위한 데이터베이스입니다. 
   이 시스템은 도서(Books), 회원(Members), 대출 기록(BorrowRecords) 등 주요 정보를 관리합니다.
*/

-- **문제 1:** **`Books`** 테이블을 생성하세요.
-- **`PublishedYear`**는 1500 이상의 값을 가져야 하며, **`Genre`**는 NULL을 허용하지 않습니다.

-- LibraryManagement 스키마 생성
CREATE SCHEMA LibraryManagement; 

-- Books 테이블 생성
CREATE TABLE Books (
	BookID INT AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(255) NOT NULL,
	Author VARCHAR(255) NOT NULL,
	PublishedYear INT CHECK (PublishedYear >= 1500),
    Genre VARCHAR(255)
);
DESCRIBE Books;
SELECT * FROM Books;

-- **문제 2:** **`Members`** 테이블을 생성하세요.
-- **`Email`** 열에는 고유 제약조건을 추가하고, **`FirstName`** 및 **`LastName`** 열은 빈 문자열을 허용하지 않아야 합니다.

CREATE TABLE Members (
	MemberID INT AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Email VARCHAR(255) UNIQUE NOT NULL,
    MembershipDate DATE DEFAULT (CURRENT_DATE),
    CHECK (FirstName != ''),
    CHECK (LastName != '')
);
DESCRIBE Members;
SELECT * FROM Members;

-- **문제 3:** **`BorrowRecords`** 테이블을 생성하세요. 
-- 이 테이블은 **`Members`**와 **`Books`** 테이블에 대한 외래 키 제약 조건을 포함해야 합니다.
-- 레퍼런스 옵션으로 **`ON DELETE CASCADE`**와 **`ON UPDATE NO ACTION`**을 설정해야 합니다.

CREATE TABLE BorrowRecords(
	RecordID INT AUTO_INCREMENT PRIMARY KEY,
	MemberID INT, 
	BookID INT,
    BorrowDate DATE, 
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
DESCRIBE BorrowRecords;
SELECT * FROM BorrowRecords;



