-- database 생성
CREATE DATABASE sqlab default CHARACTER SET UTF8; 

-- user 생성
CREATE USER 'donkatsuclub'@'localhost' identified BY 'donkatsuclub';
CREATE USER 'donkatsuclub'@'%' identified BY 'donkatsuclub';

-- 권한 부여
GRANT ALL PRIVILEGES ON sqlab.* TO 'donkatsuclub'@'%';
grant all privileges on sqlab.* to 'donkatsuclub'@'localhost';

-- 수정사항 즉각적용
flush privileges;

-- user 삭제
DROP USER 'donkatsuclub'@'localhost';
DROP USER 'donkatsuclub'@'%';