drop table player;
drop table Stadium;
drop table Rank;
drop table Team;
drop table Schedule;

CREATE TABLE Player (
    RRN CHAR(14) PRIMARY KEY,
    Name VARCHAR2(50),
    Address VARCHAR2(200),
    Team_id CHAR(4),
    Rank_id CHAR(4)
);

CREATE TABLE Stadium (
    Stadium_name VARCHAR2(50) PRIMARY KEY,
    Stadium_city VARCHAR2(50),
    Stadium_addr VARCHAR2(200)
);

CREATE TABLE Rank (
    Rank_id CHAR(4) PRIMARY KEY,
    Rank_name VARCHAR2(20)
);

CREATE TABLE Team (
    Team_id CHAR(4) PRIMARY KEY,
    Team_name VARCHAR2(50)
);

CREATE TABLE Schedule (
    Schedule_id CHAR(4) PRIMARY KEY,
    Schedule_date DATE,
    Stadium_name VARCHAR2(50),
    CONSTRAINT fk_stadium FOREIGN KEY (Stadium_name) REFERENCES Stadium(Stadium_name)
);

INSERT INTO Player (RRN, Name, Address, Team_id, Rank_id) VALUES ('000000-0000000', '홍길동', '서울특별시 강남구 테헤란로 123', 'T001', 'R001');
INSERT INTO Player (RRN, Name, Address, Team_id, Rank_id) VALUES ('111111-1111111', '김철수', '부산광역시 해운대구 해운대로 456', '', '');
INSERT INTO Player (RRN, Name, Address, Team_id, Rank_id) VALUES ('222222-2222222', '이영희', '대구광역시 중구 동성로 789', 'T001', '');
INSERT INTO Player (RRN, Name, Address, Team_id, Rank_id) VALUES ('333333-3333333', '박민수', '인천광역시 남동구 문화로 101', '', '');
INSERT INTO Player (RRN, Name, Address, Team_id, Rank_id) VALUES ('444444-4444444', '최지우', '광주광역시 서구 상무대로 202', 'T002', 'R004');

INSERT INTO Stadium (Stadium_name, Stadium_city, Stadium_addr) VALUES ('서울 경기장', '서울', '서울특별시 강남구 삼성동 123-4');
INSERT INTO Stadium (Stadium_name, Stadium_city, Stadium_addr) VALUES ('부산 경기장', '부산', '부산광역시 해운대구 우동 567-8');
INSERT INTO Stadium (Stadium_name, Stadium_city, Stadium_addr) VALUES ('대구 경기장', '대구', '대구광역시 수성구 만촌동 910-11');

INSERT INTO Rank (Rank_id, Rank_name) VALUES ('R001', '브론즈');
INSERT INTO Rank (Rank_id, Rank_name) VALUES ('R002', '실버');
INSERT INTO Rank (Rank_id, Rank_name) VALUES ('R003', '골드');
INSERT INTO Rank (Rank_id, Rank_name) VALUES ('R004', '플래티넘');

INSERT INTO Team (Team_id, Team_name) VALUES ('T001', '팀 알파');
INSERT INTO Team (Team_id, Team_name) VALUES ('T002', '팀 베타');
INSERT INTO Team (Team_id, Team_name) VALUES ('T003', '팀 감마');

INSERT INTO Schedule (Schedule_id, Schedule_date, Stadium_name) VALUES ('S001', '2024-06-15', '서울 경기장');
INSERT INTO Schedule (Schedule_id, Schedule_date, Stadium_name) VALUES ('S002', '2024-06-16', '부산 경기장');
INSERT INTO Schedule (Schedule_id, Schedule_date, Stadium_name) VALUES ('S003', '2024-06-17', '대구 경기장');

select * from player;
commit;