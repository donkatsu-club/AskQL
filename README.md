<img src="https://capsule-render.vercel.app/api?type=waving&color=00C3FF&height=150&section=header" width="1000" />

<div align="center">

<h1 style="font-size: 36px;">🔎 AskQL</h1>

<p style="font-size: 24px;">당신을 위한 SQL 학습지 ✨</p>

<a href="quiz/quiz.md">
  <button>🤴🏻 문제 풀러 가볼까요?</button>
</a>

</br>
</div>

## 📍목차
- [1️⃣ 프로젝트 개요](#1%EF%B8%8F⃣-프로젝트-개요)
- [2️⃣ 팀원 소개](#2%EF%B8%8F⃣-팀원-소개)
- [3️ 개발 환경 설정](#3%EF%B8%8F-개발-환경-설정)
- [4️⃣ ERD](#4%EF%B8%8F⃣-erd)
- [5️⃣ 회고](#5%EF%B8%8F⃣-회고)


<br>

<br>

## 1️⃣ 프로젝트 개요

**AskQL**은 **SQL**과 **정규표현식** 학습을 돕는 도구입니다.

**첫째**, 고객 카드 사용 패턴 데이터를 활용한 다양한 문제를 제공합니다.

**둘째**, 단계별로 실력을 향상시킬 수 있도록 지원합니다.

**셋째**, 학습자의 이해도를 체계적으로 평가합니다.

</br>


<br>

## 2️⃣ 팀원 소개

### [🙆🏻‍♂️ 팀원](#목차)


|<img src="https://avatars.githubusercontent.com/u/80048007?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/79669001?v=4?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/179544856?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/115103394?v=4" width="250" height="200"/>|
|:-:|:-:|:-:|:-:|
|박영진<br/>[@DoomchitYJ](https://github.com/DoomchitYJ)|서소원<br/>[@PleaseErwin](https://github.com/PleaseErwin)|이은준<br/>[@2EunJun](https://github.com/2EunJun)|이현정<br/>[@nanahj](https://github.com/nanahj)|

<br>

## 3️ 개발 환경 설정

### 🖥️ DB 설정

✏️ Database 생성

```sql
-- CREATE DATABSE 데이터베이스명
-- default CHARACTER SET UTF8: 한글 처리에서 오류가 나지 않도록 방지하는 역할
CREATE DATABASE sqlab default CHARACTER SET UTF8;
```

✏️ 접속하여 문제를 풀 계정 생성 및 권한 부여

```sql
-- %: 외부에서도 접속할 수 있도록 함
-- user 생성
CREATE USER 'donkatsuclub'@'localhost' identified BY 'donkatsuclub';
CREATE USER 'donkatsuclub'@'%' identified BY 'donkatsuclub';

-- 권한 부여
GRANT ALL PRIVILEGE on sqlab.* TO 'donkatsuclub'@'localhost';
GRANT ALL PRIVILEGES ON sqlab.* TO 'donkatsuclub'@'%';

-- 수정사항 즉각적용
flush privileges;
```

✏️ 팀원 박영진의 노트북 Host IP로 MySQL에 접속, 동일 네트워크 환경에서 작업
<br>
<br>
<img src="https://github.com/user-attachments/assets/a7839176-8695-4840-8d9a-6b43add0fe8c" width="60%">

<br>
<br>
✏️ Virtual Box의 포트 포워딩 설정에 Windows(Host IP)에서 Ubuntu MySQL 포트포워딩
<br>
<br>
<img src="https://github.com/user-attachments/assets/4f17c137-b87a-4f51-baaa-76dc743daaaf" width="45%">
<br>
<br>
✏️ 각 팀원 개인 노트북의 DBeaver로 연결
<br>
<br>
<img src="https://github.com/user-attachments/assets/a5d2f952-b11f-47b8-9c0d-8d9ed31c3e97" width="45%">

<br>

<br>

## 4️⃣ ERD
![erd2](https://github.com/user-attachments/assets/ef161b6a-5c69-4ce8-85e3-1f5ad49a7666)

<br>

### 📊 데이터 예시
**🛒 customer**

![image](https://github.com/user-attachments/assets/3dc5d073-f21b-48ae-a157-336f4b7b1367)

**💳 card**

![image](https://github.com/user-attachments/assets/6ec9883a-35eb-41c8-a0b4-94a5f6f5348e)

**🤝🏻 transaction**

![image](https://github.com/user-attachments/assets/7675dc15-4e3e-4571-912f-690a96cf6fd8)


<br>

<br>

## 5️⃣ 회고

### 1. 정규표현식의 효율성
   
이번 프로젝트를 통해 정규표현식을 활용하여 데이터 검증과 검색 작업을 효율적으로 수행할 수 있었다.

특히, 다양한 필터링 시나리오를 처리하면서 더 정밀한 정규표현식의 필요성을 느꼈다.

### 2. 정규표현식의 중요성

정규표현식이 없었다면 특정 패턴의 데이터를 필터링하기 위해 SQL 문이 훨씬 길어졌을 것이다.

### 3. 데이터베이스 설계의 중요성

형식에 맞지 않는 데이터를 조회할 수 있는 쿼리문을 작성하면서, 데이터베이스의 무결성을 보장하기 위해 사전 설계가 얼마나 중요한지 깨닫게 되었다.

처음부터 꼼꼼히 설계하는 것이 데이터 검증과 관리에 큰 도움이 된다는 점을 배웠다.

### 4. 깃허브 사용의 어려움
   
협업 과정에서 깃허브 사용에 어려움을 느꼈으며, 부족한 부분을 보완하여 다음 프로젝트에서는 더 원활하게 작업하고 싶다.

짧은 시간 안에 프로젝트를 완료해야 한다는 점이 힘들었지만, 함께 노력해준 팀원들에게 고생했다고 전하고 싶다.

체계적이고 풍부한 README 파일 작성법에도 익숙해질 수 있는 기회였다.

<img src="https://capsule-render.vercel.app/api?type=waving&color=00C3FF&height=150&section=footer" width="1000" />
