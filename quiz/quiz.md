# 😎 문제

## 🕵🏻‍♂️ 상황


---

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

---

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
