# 😎 문제

## 🕵🏻‍♂️ 상황

>
>2025년, **금융 데이터 관리**와 **마케팅을 강화**하려는 회사 **"DKC"**은 고객 정보를 활용한 맞춤형 서비스를 제공하기 위해 **고객 데이터베이스 정리 프로젝트**를 시작합니다.
>
>이 프로젝트는 **고객 정보의 정확성과 완전성을 보장**하고, 이를 통해 고객 맞춤형 캠페인을 성공적으로 운영하는 것을 목표로 합니다.
>
>최근 데이터베이스 검토 결과, **부정확한 카드 정보, 잘못된 이메일 형식, 전화번호의 비일관성, 주소 오류 등** 다양한 문제가 발견되었습니다. 
>
>회사는 이 문제를 해결하기 위해 **모든 데이터를 검증**하고, 문제를 수정하는 과정을 **정규표현식과 SQL 쿼리를 활용**해 수행하려고 합니다.
>
>❗ 회사의 문제를 당신이 해결해주세요



### 😁 1단계

<br>

> **Q1 : 회사의 보안팀이 카드 결제 시스템의 데이터 유효성을 점검하던 중, 잘못된 카드번호 형식으로 저장된 데이터가 있다는 것을 발견했습니다.이 조건에 맞지 않는 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
>
> 📍 숫자4자리-숫자4자리-숫자4자리-숫자4자리
> 
<br>
<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT card_id, card_number
FROM card
WHERE card_number NOT REGEXP '^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$';

```
</details>
<br>

> **Q2 : 고객센터에서 이메일 기반 마케팅 캠페인을 준비하고 있습니다. 그러나 일부 이메일 데이터가 잘못된 형식으로 저장되어 메일 발송이 실패할 우려가 있습니다. Gmail 또는 Naver 도메인을 사용하는 고객 중, 이메일 형식이 올바르지 않은 데이터를 식별하려면 어떤 SQL 쿼리를 작성해야 할까요?**
> 
> 📍 이메일 아이디에 특수기호(._%+-) 포함될 수 있음
> 
<br>
<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT customer_id, name, email
FROM customer
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@(gmail|naver)\\.com$';
```
    
</details>
<br>

> **Q3 : 최근 회사의 전화번호 데이터베이스를 검토하던 중, 특정 패턴을 가진 전화번호를 활용한 프로모션 이벤트 아이디어가 떠올랐습니다. 이벤트 대상자는 전화번호에서 두 번째 파트의 네 번째 숫자가 7이고, 세 번째 파트의 네 번째 숫자가 1인 고객입니다. 이 조건에 맞는 고객 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
> 
> 📍 전화번호 두번째 파트의 네번째 숫자가 7, 세번째 파트의 네번째 숫자가 1인 사람
>
<br>
<details>
<summary> 정답 확인 🧨 </summary>
    
```sql
SELECT *
FROM customer
WHERE phone_number REGEXP '^[0-9]{3}-[0-9]{3}7-[0-9]{3}1$';
```

</details>
<br>

> **Q4 : 회사가 서울 외 지역을 대상으로 새로운 캠페인을 준비 중입니다. 서울을 제외한 지역에 거주하는 고객 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
> 
> 📍 서울시 제외하고 조회
>
<br>
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

> **Q1 : 법인 카드를 사용하는 고객들에게 이메일을 보내려 했지만, 일부 고객이 이메일 형식을 제대로 지키지 않았습니다. 이메일 형식을 지키지 않은 고객들의 이름과 전화번호를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
>
> 📍 고객 이름, 고객 전화번호  
> 📍 법인 카드의 card_type: ‘CORPORATE’
<br>
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

> **Q2 : 2025년에 만료되는 카드를 보유한 고객에게 알림을 보내려고 합니다. 2025년에 만료되는 카드 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
>
>📍 고객 id, 카드 id, 고객 이메일, 고객 전화번호, 카드 만료일 조회  
>📍 expiry_date: MMYY 형태이고, 월은 01~12월까지이다.
<details>
<summary> 힌트 🎂 </summary>
<br>

- 끝자리가 25인 경우 : '25$’
- 끝자리가 25이면서 숫자로 이루어진 경우 : ^[0-9]*25$
  
</details>
<br>

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

> **Q3 : 김, 이, 박씨 성을 가진 30대 고객들(연 나이)이 가장 많은 소비를 한 가게의 유형을 찾아 맞춤형 혜택을 제공하려고 합니다. 이 조건에 맞는 데이터를 조회하려면 어떤 SQL 쿼리를 작성해야 할까요?**
>
>📍 가장 많은 소비를 한 가게 유형, 해당 유형에서 소비한 총 금액  
>📍 이름은 한글로 이루어져 있다.
>
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
<br>
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
