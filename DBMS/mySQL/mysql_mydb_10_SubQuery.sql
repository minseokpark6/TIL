# 조건에 조건 더하기
# Sub Query 쓸 수 있는 쿼리 명령문은?
# >> group by 빼고 다 ~ 가능

# 주로 대부분 select, from, where 에 많이 쓰임alter
-- sub query에는 컬럼이 붙어도 되고 안 붙어도 됨

# select절의 Sub Query
# >>반드시 결과값이 ''하나의 값'' 

# from 절의 Sub Query
# >> 반드시 결과값이 ""하나의 테이블"" >> 별명을 가져와야 함

# Where 절의 Sub Query
# >> 반드시 결과값이 ""하나의 컬럼"" 이어야 함 (exist 제외)
# where 컬연서(column, 연산자, sub query)

use pokemon;
show tables;

drop table mypokemon;
drop table ability;

create table mypokemon
(	number int,
    name  varchar(30)
    );

insert into mypokemon(number, name)
values (10, 'caterpie'), (25, 'pikachu'), (26, 'raichu'), (133, 'eevee'), (152, 'chikoirita');

create table ability(
	number int,
    type varchar(20),
    height float,
    weight float,
    attack int,
    defense int,
    speed int
);

insert into ability(number, type, height, weight, attack, defense, speed)
values (10, 'bug', 0.3, 2.9, 30, 35, 45), 
	   (25, 'electric', 0.4, 6, 55, 40, 90), 
       (26, 'electric', 0.8, 30, 90, 55, 110), 
       (133, 'normal', 0.3, 6.5, 55, 50, 55), 
       (152, 'grass', 0.9, 6.4, 49, 65, 45);
       
select * from mypokemon;
select * from ability;

# 특정 이름으로 데이터 추출

select number, name
from mypokemon
where name = 'pikachu';

# select 절 Subquery 사용

# 피카츄의 번호, 영문 이름, 키를 가지고 와주세요~
select
	number,
    name,
    (select height from ability where number = 25) as height
from mypokemon
where name = 'pikachu';
-- select 절의 Subquery는 반드시 결과값이 "하나의 값"

select 
	number,
    name,
    (select height from ability where number = a.number) as height
from mypokemon a
where name = "pikachu";
-- >> where 조건식에서 a.number에 하나의 값만 지정해주기 때문에 select절의 Sub Query가 가능

# from 절의 Sub Query
select 
	number,
    rank() over(order by height) as height_rank
from ability;

# 키 순위가 3순위인 포켓몬의 번호와 키 순위를 가지고 와 주세요~
select number, height_rank
from (select number, rank() over(order by height) as height_rank from ability) as a
where height_rank = 3;
-- from 절의 sub query는 결과값이 반드시 >> "하나의 테이블"


# Where 절 Sub Query
# Where 절의 Sub Query는 반드시 결과값이 "하나의 컬럼"
# (단 Exist 제외)
# 연산자와 함꼐 사용 >> (컬연서) column, 연산자, Sub Query
# (단, 비교 연산자만 사용 시 반드시 하나의 값)

# 키가 평균 키보다 작은 포켓몬의 번호를 가지고 와~
select number
from ability
where height < (select avg(height) from ability);
-- 비교 연산자 사용 시 서브쿼리의 결과값이 반드시 >> **하나의 값**

# 공격력이 모든 전기 포켓몬의 공격력보다 작은 포켓몬의 번호를 가져와 주세요~
select number
from ability
where attack < all(select attack from ability where type = "electric" );

# 방어력이 모든 전기 포켓몬의 공격력보다 하나라도 큰 포켓몬의 번호를 가져와 주세요~
select number
from ability
where defense > any(select attack from ability where type = "electric");

# bug 타입 포켓몬이 있다면 모든 포켓몬의 번호를 가져와 주세요~
select number
from ability
where exists(select * from ability where type = "bug");
-- exists / not exists는 여러 컬럼이 나와도 괜찮음alter
-- exists / not exists는 결과값을 True / False로 반환



# 실습_서브쿼리로 복잡한 조건을 하나의 쿼리로 만들어보자

# Mission_1
-- 내 포켓몬 중에 몸무게가 가장 많이 나가는 포켓몬의 번호를 가져와 주세요~
select number
from (select number, weight from ability order by weight desc) as a
limit 1;

# 강사님 코드
select number
from ability
where weight = (select max(weight) from ability);

# Mission_2
-- 속도가 모든 전기 포켓몬의 공격력보다 하나라도 작은 포켓몬의 번호를 가져와 주세요~

select number
from ability
where speed < any(select attack from ability where type = 'electric');

# Mission_3
-- 공격력이 방어력보다 큰 포켓몬이 있다면 모든 포켓몬의 이름을 가져와 주세요~

select name 
from mypokemon
where exists (select * from ability where attack > defense);


select * from mypokemon;
select * from ability;


# 실습_서브쿼리로 복잡한 조건을 하나의 쿼리로 만들어 보자

# Mission (1)
-- 이브이의 번호 133을 활용해서, 이브이의 영문 이름, 키, 몸무게를 가져와 주세요. 
select
	(select name from mypokemon where number = 133) as name,
    height,
    weight
from ability
where number = 133;

# Mission (2)
-- 속도가 2번째로 빠른 포켓몬의 번호와 속도를 가져와 주세요.
select number, speed
from (select number, speed, rank() over (order by speed desc) as speed_rank from ability) as a
where speed_rank = 2 ;

# Mission (3)
-- 방어력이 모든 전기 포켓몬의 방어력보다 큰 포켓몬의 이름을 가져와 주세요
select (select name from mypokemon as m where m.number = a.number ) as name
from ability as a
where defense > all(select defense from ability where type = 'electric');

-- 서브쿼리 2중으로도 가능
select name
from mypokemon
where number in (select number from ability where defense > all(select defense from ability where type = 'electric'));