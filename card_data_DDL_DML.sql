use sqlab;

drop table if exists transaction;
drop table if exists card;
drop table if exists customer;

-- 고객 정보 테이블
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

-- 카드 정보 테이블
CREATE TABLE card (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    card_type ENUM('CREDIT', 'DEBIT', 'CORPORATE') NOT NULL,
    card_number VARCHAR(19) NOT NULL,
    credit_limit DECIMAL(12, 2),
    expiry_date VARCHAR(4) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 거래 내역 테이블
CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    card_id INT NOT NULL,
    transaction_date DATETIME NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    transaction_type ENUM('PAYMENT', 'REFUND', 'WITHDRAWAL', 'FOREIGN', 'ONLINE') NOT NULL,
    store_name VARCHAR(200),
    store_type ENUM( 'RESTAURANT', 'CAFE', 'GROCERY', 'CLOTHING', 'ELECTRONICS', 'PHARMACY', 'ENTERTAINMENT') NOT NULL,
    FOREIGN KEY (card_id) REFERENCES card(card_id)
);

INSERT INTO customer (customer_id, name, birth_date, email, address, phone_number) VALUES
(1, '김민수', '1990-03-15', 'minsu_01@gmail.com', '서울시 강남구 테헤란로 101', '010-1234-5678'),
(2, '이영희', '1985-06-20', 'younghee89@naver.com', '부산시 해운대구 센텀로 45', '010-2345-6789'),
(3, '박철민', '1993-11-02', 'cheolmin23@hanmail.net', '대구시 수성구 범어로 88', '010-3456-7890'),
(4, '최지은', '1988-08-10', 'jieun.kim@kakao.com', '인천시 연수구 송도동 123', '010-4567-8901'),
(5, '정다은', '1996-01-05', 'daeun_99@daum.net', '광주시 동구 계림로 55', '010-5678-9012'),
(6, '한승우', '1989-04-14', 'seungwoo84gmail.com', '서울시 마포구 홍대로 101', '010-6789-0123'),
(7, '유지안', '1991-02-27', 'jian.91@navercom', '부산시 사하구 하단로 67', '010-7890-1234'),
(8, '장민정', '1995-12-12', 'minjung_12@daum.net', '대전시 중구 은행동 98', '010-8901-2345'),
(9, '서준호', '1984-07-23', 'junho0707@kakao.com', '서울시 서초구 서초로 121', '010-9012-3456'),
(10, '오세연', '1997-03-09', 'seyeon.g03@gmail.com', '경기도 수원시 영통구 청명로 45', '010-0123-4567'),
(11, '이재훈', '1990-10-20', 'jaehoon11@naver.com', '서울시 관악구 신림로 89', '010-1234-5678'),
(12, '김하영', '1993-05-01', 'hayoung95@daum.net', '부산시 북구 덕천로 32', '010-2345-6789'),
(13, '홍기준', '1987-09-15', 'kijoon77kakao.com', '인천시 부평구 부평로 67', '010-3456-7890'),
(14, '이수지', '1994-06-25', 'suji1994@gmailcom', '대구시 중구 공평로 44', '010-4567-8901'),
(15, '강민호', '1992-11-08', 'minho_92@naver.com', '광주시 북구 문흥로 99', '010-5678-9012'),
(16, '권세은', '1986-08-17', 'seeun.kwon@gmail.com', '경기도 고양시 일산동구 중앙로 55', '010-6789-0123'),
(17, '김지훈', '1990-12-30', 'jihun_90@daum.net', '서울시 송파구 석촌로 111', '010-7890-1234'),
(18, '박혜원', '1995-04-11', 'hyewon_11@kakao.com', '부산시 남구 대연동 73', '010-8901-2345'),
(19, '임태현', '1983-01-25', 'taehyun83@gmailcom', '대전시 서구 둔산로 33', '010-9012-3456'),
(20, '양지우', '1996-09-18', 'jiwoo96@naver.com', '서울시 은평구 진관동 12', '010-0123-4567'),
(21, '배수현', '1991-02-09', 'soohyun_21@daum.net', '부산시 동래구 명륜로 76', '010-1234-5678'),
(22, '조한솔', '1988-07-30', 'hansol.jo88@kakao.com', '대구시 달서구 상인로 98', '010-2345-6789'),
(23, '송은지', '1993-11-05', 'eunji11@gmail.com', '경기도 성남시 분당구 서현로 45', '010-3456-7890'),
(24, '문지성', '1997-05-27', 'jisung.m27@naver.com', '서울시 강서구 화곡로 99', '010-4567-8901'),
(25, '윤하늘', '1984-03-14', 'haneul84@daum.net', '광주시 남구 봉선동 22', '010-5678-9012'),
(26, '정재민', '1992-08-19', 'jaemin_92@gmailcom', '부산시 북구 금곡로 77', '010-6789-0123'),
(27, '차윤서', '1995-10-01', 'yunseo95@kakao.com', '서울시 동작구 노량진로 123', '010-7890-1234'),
(28, '이은준', '1998-05-16', 'junghoon_98@navercom', '대전시 동구 대동로 44', '010-8901-2345'),
(29, '김은혜', '1987-06-16', 'eunhye87@daum.net', '서울시 중구 명동로 11', '010-9012-3456'),
(30, '박정우', '1994-09-22', 'jungwoo94@kakao.com', '경기도 화성시 동탄로 55', '010-0123-4567');


INSERT INTO card (customer_id, card_type, card_number, credit_limit, expiry_date) VALUES
(1, 'CREDIT', '1234-5678-9876-5432', 5000000, '0326'),
(1, 'DEBIT', '1111222233334444', NULL, '0428'),
(2, 'CREDIT', '8765-4321-1234-5678', 3000000, '1123'),    
(3, 'CORPORATE', '9999-8888-7777-6666', 10000000, '0622'), 
(3, 'CREDIT', '1234567812345678', 7000000, '0923'),    
(4, 'DEBIT', '4444333322221111', NULL, '0527'),
(5, 'CREDIT', '5678-1234-4321-8765', 4500000, '1222'),   
(6, 'CORPORATE', '7777555544443333', 8000000, '0828'),
(7, 'CREDIT', '6543-2109-8765-4321', 3500000, '1325'),
(8, 'DEBIT', '8888777766665555', NULL, '1227'),
(8, 'CREDIT', '5678123498765432', 2500000, '1125'),
(9, 'CORPORATE', '4321-8765-2109-6543', 9000000, '1127'),
(10, 'CREDIT', '2222111100009999', 3000000, '0423'),     
(11, 'DEBIT', '3333444455556666', NULL, '0928'),
(12, 'CREDIT', '7890-1234-5678-4321', 4000000, '0326'),
(13, 'CORPORATE', '1111333344445555', 12000000, '0528'),
(14, 'DEBIT', '1234123412341234', NULL, '1229'),
(15, 'CREDIT', '4567456745674567', 2500000, '1222'),   
(16, 'CORPORATE', '9999888877776666', 15000000, '9925'),
(16, 'CREDIT', '4321432143214321', 2000000, '0827'),
(17, 'DEBIT', '8888999900001111', NULL, '1027'),
(18, 'CREDIT', '1234-5678-4321-8765', 5000000, '0322'),
(19, 'CORPORATE', '5555666677778888', 11000000, '0428'),
(20, 'DEBIT', '6666777788889999', NULL, '0429'),
(21, 'CREDIT', '7777888899990000', 6000000, '0328'),
(22, 'CORPORATE', '4321-8765-5678-1234', 14000000, '0627'),
(23, 'DEBIT', '2222000011113333', NULL, '1229'),
(24, 'CREDIT', '1111222233335555', 3200000, '0826'),
(25, 'CORPORATE', '9876987698769876', 13000000, '1228'),
(26, 'CREDIT', '5678-4321-8765-2109', 4500000, '0025'),
(27, 'DEBIT', '4444555566661111', NULL, '0229'),
(28, 'CREDIT', '2109-6543-4321-8765', 2700000, '0827'),
(29, 'CORPORATE', '8888777766664444', 16000000, '1128'),
(30, 'CREDIT', '0000999988887777', 3000000, '0725');

INSERT INTO transaction (card_id, transaction_date, amount, transaction_type, store_name, store_type) VALUES
(1, '2025-01-15 10:30:00', 50000.00, 'PAYMENT', '스타벅스 강남점', 'CAFE'),
(1, '2025-01-16 14:20:00', 200000.00, 'ONLINE', '11번가', 'ELECTRONICS'),
(2, '2025-01-15 18:45:00', 15000.00, 'PAYMENT', 'CU 편의점', 'GROCERY'),
(3, '2025-01-14 12:15:00', 75000.00, 'FOREIGN', '아마존', 'ELECTRONICS'),
(3, '2025-01-15 09:10:00', 200000.00, 'PAYMENT', '한우집', 'RESTAURANT'),
(4, '2025-01-15 19:30:00', 18000.00, 'PAYMENT', 'GS25 편의점', 'GROCERY'),
(5, '2025-01-16 08:50:00', 30000.00, 'WITHDRAWAL', '우리은행 ATM', 'PHARMACY'),
(6, '2025-01-15 22:40:00', 500000.00, 'PAYMENT', '롯데백화점', 'CLOTHING'),
(7, '2025-01-14 17:25:00', 120000.00, 'ONLINE', '쿠팡', 'GROCERY'),
(8, '2025-01-16 13:05:00', 65000.00, 'PAYMENT', '올리브영', 'PHARMACY'),
(9, '2025-01-15 16:10:00', 200000.00, 'PAYMENT', 'CGV 강남', 'ENTERTAINMENT'),
(10, '2025-01-16 11:50:00', 8000.00, 'REFUND', '투썸플레이스', 'CAFE'),
(11, '2025-01-15 15:30:00', 100000.00, 'FOREIGN', '알리익스프레스', 'ELECTRONICS'),
(12, '2025-01-14 20:20:00', 30000.00, 'PAYMENT', '파리바게트', 'CAFE'),
(13, '2025-01-15 09:00:00', 450000.00, 'WITHDRAWAL', '신한은행 ATM', 'PHARMACY'),
(14, '2025-01-16 12:30:00', 90000.00, 'PAYMENT', '이마트', 'GROCERY'),
(15, '2025-01-15 21:15:00', 25000.00, 'PAYMENT', '빕스', 'RESTAURANT'),
(16, '2025-01-14 13:45:00', 40000.00, 'ONLINE', 'SSG.COM', 'CLOTHING'),
(17, '2025-01-16 10:20:00', 15000.00, 'PAYMENT', '맘스터치', 'RESTAURANT'),
(18, '2025-01-15 18:35:00', 600000.00, 'PAYMENT', '현대백화점', 'CLOTHING'),
(19, '2025-01-15 14:10:00', 50000.00, 'REFUND', 'CU 편의점', 'GROCERY'),
(20, '2025-01-16 16:45:00', 35000.00, 'PAYMENT', '네네치킨', 'RESTAURANT'),
(21, '2025-01-14 11:55:00', 10000.00, 'PAYMENT', '할리스커피', 'CAFE'),
(22, '2025-01-15 20:25:00', 75000.00, 'FOREIGN', 'eBay', 'ELECTRONICS'),
(23, '2025-01-16 09:40:00', 5000.00, 'REFUND', 'GS25 편의점', 'GROCERY'),
(24, '2025-01-15 19:00:00', 250000.00, 'PAYMENT', '애플스토어', 'ELECTRONICS'),
(25, '2025-01-16 08:30:00', 60000.00, 'PAYMENT', '서점', 'ENTERTAINMENT');
