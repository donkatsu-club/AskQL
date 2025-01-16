<img src="https://capsule-render.vercel.app/api?type=waving&color=BDBDC8&height=150&section=header" width="1000" />

# 🔎 AskQL
</br>

## 1️⃣ 프로젝트 개요

**AskQL**은 **SQL**과 **정규표현식** 학습을 돕는 도구입니다.

**첫째**, 고객 카드 사용 패턴 데이터를 활용한 다양한 문제를 제공합니다.

**둘째**, 학습자의 이해도를 체계적으로 평가합니다.

**셋째**, 단계별로 실력을 향상시킬 수 있도록 지원합니다.

</br>

## 2️⃣ 팀원 소개

### [🙆🏻‍♂️ 팀원](#목차)


|<img src="https://avatars.githubusercontent.com/u/80048007?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/79669001?v=4?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/179544856?v=4" width="250" height="200"/>|<img src="https://avatars.githubusercontent.com/u/115103394?v=4" width="250" height="200"/>|
|:-:|:-:|:-:|:-:|
|박영진<br/>[@DoomchitYJ](https://github.com/DoomchitYJ)|서소원<br/>[@PleaseErwin](https://github.com/PleaseErwin)|이은준<br/>[@2EunJun](https://github.com/2EunJun)|이현정<br/>[@nanahj](https://github.com/nanahj)|

<br>



## 3️ ERD
![erd2](https://github.com/user-attachments/assets/ef161b6a-5c69-4ce8-85e3-1f5ad49a7666)


    
## 4️⃣ 문제
### 1단계

<details>
<summary>문제 1번</summary>
1. **카드번호 형식 검증 (16자리 형식이 아닌 데이터 조회)**
    
    숫자4자리-숫자4자리-숫자4자리-숫자4자리
    
    ```sql
    SELECT card_id, card_number
    FROM card
    WHERE card_number NOT REGEXP '^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$';
    ```
</details>
<details>
<summary>문제 2번</summary>
2. **이메일 형식 검증 (`gmail.com` 또는 `naver.com` 도메인 조회)**
    1. 이메일 아이디 부분에 특수문자 있을 수 있음 (._%+-)
    
    ```sql
    SELECT customer_id, name, email
    FROM customer
    WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@(gmail|naver)\\.com$';
    ```
 </details>
 <details>
<summary>문제 3번</summary>
3. 전화번호 특정 자리 숫자 조회
    1. 전화번호 두번째 파트의 네번째 숫자가 7, 세번째 파트의 네번째 숫자가 1인 사람
    
    ```sql
    SELECT *
    FROM customer
    WHERE phone_number REGEXP '^[0-9]{3}-[0-9]{3}7[0-9]-[0-9]{3}1$';
    ```
</details>    
4. **주소 검증**
    1. 서울시 제외하고 조회
    
    ```sql
    SELECT customer_id, name, address
    FROM customer
    WHERE address NOT REGEXP '서울시';
    ```
    

---

### 어려운 문제 (총 3개)

1. 법인 카드를 사용하시는 분들에게 이메일을 보내려고 합니다. 그런데, 제대로 이메일 형식을 지키지 않은 분들이 계세요. 그 분들에게는 문자 메시지를 보내려고 합니다. 해당하는 고객의 이름과 전화번호를 조회해주세요.
    1. 고객 이름, 고객 전화번호
    2. 법인 카드의 card_type: ‘CORPORATE’
    
    ```sql
    SELECT c.name, c.phone_number
    FROM customer c
    JOIN card ca ON c.customer_id = ca.customer_id
    WHERE ca.card_type = 'CORPORATE'
      AND c.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
    ```
    
2. **올해 카드가 만료되는 대상에게 알림을 보내려고 합니다. 2025년에 카드가 만료되는 카드 데이터를 조회해주세요.**
    1. 고객 id, 카드 id, 고객 이메일, 고객 전화번호, 카드 만료일 조회
    2. **expiry_date: MMYY 형태이고, 월은 01~12월까지이다.**
    
    ```sql
    SELECT c.customer_id, ca.card_id, c.email, c.phone_number, ca.expiry_date
    FROM customer c
    JOIN card ca ON c.customer_id = ca.customer_id
    WHERE ca.expiry_date REGEXP '^(0[1-9]|1[0-2])25$';	
    ```
    
    <aside>
    
    9925 8925 이런 이상한 데이터 추가해야함
    
    - 끝자리가 25인 경우 :  '25$’
    - 끝자리가 25이면서 숫자로 이루어진 경우 : ^[0-9]*25$
    </aside>
    
3. **[특별 이벤트!] 김, 이, 박씨 성을 가진 30대 고객들(연 나이)이 가장 많은 소비를 한 가게의 유형을 찾아 맞춤형 혜택을 제공하려고 합니다.**
    1. 가장 많은 소비를 한 가게 유형, 해당 유형에서 소비한 총 금액
    2. 이름은 한글로 이루어져 있다.
        
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
        
        <aside>
        
        💡 참고
        
        **`^(김|이|박)[가-힣]+$`**: 
        
        - `김민수` → 매칭됨.
        - `이영희` → 매칭됨.
        - `박123` → 매칭되지 않음.
        
        **`REGEXP '^김|^이|^박'`**:
        
        - `김민수` → 매칭됨.
        - `이영희` → 매칭됨.
        - `박123` → 매칭됨.
        </aside>

    
## 5️⃣ 회고

<img src="https://capsule-render.vercel.app/api?type=waving&color=BDBDC8&height=150&section=footer" width="1000" />
