<img src="https://capsule-render.vercel.app/api?type=waving&color=00C3FF&height=150&section=header" width="1000" />

<div align="center">

<h1 style="font-size: 36px;">🔎 AskQL</h1>

<p style="font-size: 24px;">당신을 위한 SQL 학습지 ✨</p>

</br>
</div>

## 📍목차
- [1️⃣ 프로젝트 개요](#1%EF%B8%8F⃣-프로젝트-개요)
- [2️⃣ 팀원 소개](#2%EF%B8%8F⃣-팀원-소개)
- [3️ 개발 환경 설정](#3%EF%B8%8F-개발-환경-설정)
- [4️⃣ ERD](#4%EF%B8%8F⃣-erd)
- [5️⃣ 문제](#5%EF%B8%8F⃣-문제)
- [6️⃣ 회고](#6%EF%B8%8F⃣-회고)


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
<img src="https://github.com/user-attachments/assets/3dca6b11-a79b-413e-8807-a0c5c95889d4" width="45%">

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


## 5️⃣ 문제

### 😁 1단계

**문제 1번** **: 카드번호 형식 검증 (16자리 형식이 아닌 데이터 조회)**

📍 숫자4자리-숫자4자리-숫자4자리-숫자4자리

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT card_id, card_number
FROM card
WHERE card_number NOT REGEXP '^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$';

```
</details>
<br>

**문제 2번** **: 이메일 형식 검증 (`gmail.com` 또는 `naver.com` 도메인 조회)**

📍 이메일 아이디 부분에 특수문자 있을 수 있음 (._%+-)

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT customer_id, name, email
FROM customer
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@(gmail|naver)\\.com$';
```
    
</details>
<br>

**문제 3번** **: 전화번호 특정 자리 숫자 조회**

📍 전화번호 두번째 파트의 네번째 숫자가 7, 세번째 파트의 네번째 숫자가 1인 사람

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT *
FROM customer
WHERE phone_number REGEXP '^[0-9]{3}-[0-9]{3}7-[0-9]{3}1$';
```

</details>
<br>

**문제 4번** **: 주소 검증**

📍 서울시 제외하고 조회

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT customer_id, name, address
FROM customer
WHERE address NOT REGEXP '서울시';
```

</details>
<br>

### 💥 2단계

**문제 1번**

**법인 카드를 사용하는 고객들에게 이메일을 보내려 했지만, 일부 고객이 이메일 형식을 제대로 지키지 않았습니다. 이메일 형식을 지키지 않은 고객들의 이름과 전화번호를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**

📍 고객 이름, 고객 전화번호  
📍 법인 카드의 card_type: ‘CORPORATE’

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT c.name, c.phone_number
FROM customer c
JOIN card ca ON c.customer_id = ca.customer_id
WHERE ca.card_type = 'CORPORATE'
  AND c.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';

```
</details>
<br>

**문제 2번**

**2025년에 만료되는 카드를 보유한 고객에게 알림을 보내려고 합니다. 2025년에 만료되는 카드 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**

📍 고객 id, 카드 id, 고객 이메일, 고객 전화번호, 카드 만료일 조회  
📍 expiry_date: MMYY 형태이고, 월은 01~12월까지이다.

<details>
<summary> 힌트 🎂 </summary>
<br>

9925 8925 이런 이상한 데이터 추가해야함

- 끝자리가 25인 경우 : '25$’
- 끝자리가 25이면서 숫자로 이루어진 경우 : ^[0-9]*25$
  
</details>

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT c.customer_id, ca.card_id, c.email, c.phone_number, ca.expiry_date
FROM customer c
JOIN card ca ON c.customer_id = ca.customer_id
WHERE ca.expiry_date REGEXP '^(0[1-9]|1[0-2])25$';

```
</details>
<br>

**문제 3번**

**김, 이, 박씨 성을 가진 30대 고객들(연 나이)이 가장 많은 소비를 한 가게의 유형을 찾아 맞춤형 혜택을 제공하려고 합니다. 이 조건에 맞는 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**

📍 가장 많은 소비를 한 가게 유형, 해당 유형에서 소비한 총 금액  
📍 이름은 한글로 이루어져 있다.

<details>
<summary> 힌트 🎂 </summary>
<br>
    
'^(김|이|박)[가-힣]+$':

- 김민수 → 매칭됨.
- 이영희 → 매칭됨.
- 박123 → 매칭되지 않음.

'^김|^이|^박':

- 김민수 → 매칭됨.
- 이영희 → 매칭됨.
- 박123 → 매칭됨.
  
</details>

<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT t.store_type, SUM(t.amount) AS total_spent
FROM customer c
JOIN card ca ON c.customer_id = ca.customer_id
JOIN transaction t ON ca.card_id = t.card_id
WHERE (YEAR(CURDATE()) - YEAR(c.birth_date)) BETWEEN 30 AND 39
  AND c.name REGEXP '^(김|이|박)[가-힣]+$'
GROUP BY t.store_type
ORDER BY total_spent DESC
LIMIT 1;

```
</details>

<br>

## 6️⃣ 회고

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
