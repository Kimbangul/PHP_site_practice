DROP DATABASE IF EXISTS phpSiteTemplate;
CREATE DATABASE phpSiteTemplate;
USE phpSiteTemplate;


CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
    regDate DATETIME NOT NULL, # 생성날짜
    updateDate DATETIME NOT NULL, # 수정날짜
    loginId CHAR(50) NOT NULL UNIQUE, #로그인 아이디
    loginPw CHAR(200) NOT NULL, # 로그인 비번
    `name` CHAR(100) NOT NULL, # 이름
    `nickname` CHAR(100) NOT NULL, # 닉네임
    `email` CHAR(100) NOT NULL, # 이메일
    `phone` CHAR(20) NOT NULL # 휴대전화번호
);

# 관리자 회원 생성
INSERT INTO `member` 
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '관리자',
`nickname` = '관리자';


CREATE TABLE `board`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
    regDate DATETIME NOT NULL, # 생성날짜
    updateDate DATETIME NOT NULL, # 수정날짜
    `name` CHAR(100) NOT NULL, # 게시판 이름
    `code` CHAR(20) NOT NULL # 게시판 코드
);

# 관리자 회원 생성
INSERT INTO `board` 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '공지사항',
`code` = 'notice';



CREATE TABLE `article`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, # 번호
    regDate DATETIME NOT NULL, # 작성날짜
    updateDate DATETIME NOT NULL, # 수정날짜
    parentId INT(10) UNSIGNED NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL, #게시판 아이디
    memberId INT(10) UNSIGNED NOT NULL, # 작성자 ID
    `body` TEXT NOT NULL, #내용  

    `title` CHAR(100) NOT NULL, #제목
    displayStatus TINYINT(1) UNSIGNED NOT NULL, # 노출상태
    delStatus TINYINT(1) UNSIGNED NOT NULL, # 삭제상태
    delDate DATETIME NOT NULL, # 삭제날짜
    cateCode CHAR(20) NOT NULL, # 1차 카테고리
    cate2Code CHAR(20) NOT NULL, # 2차 카테고리
    readStatus TINYINT(1) UNSIGNED NOT NULL, # 수신자의 읽기 상태
    readDate DATETIME NOT NULL, # 수신자의 읽은 날짜
    completeStatus TINYINT(1) UNSIGNED NOT NULL, # 완료 상태 
    completeDate DATETIME NOT NULL, # 완료 날짜
    writerName CHAR(20) NOT NULL, # 작성자 이름
     writerEmail CHAR(100) NOT NULL, # 작성자 이메일
      writerPhone CHAR(20) NOT NULL, # 작성자 전화번호
       writerSnsId CHAR(20) NOT NULL, # 작성자 sns 아이디
         writerSnsType CHAR(20) NOT NULL # 작성자 sns 타입
);



INSERT INTO `article`
SET regDate = NOW(),
    updateDate = NOW(),
    boardId = 1,
    memberId = 1,
    displayStatus = 1,
    title = '제목1',
    `body` = '내용1'; 
