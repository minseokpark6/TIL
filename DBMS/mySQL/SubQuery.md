# 조건에 조건 더하기_Sub Query
* **하나의 쿼리 내 포함된 또 하나의 쿼리**를 의미
* 서브 쿼리는 반드시 ***괄호 안에*** 있어야 함
* 서브 쿼리에는 ;(세미 콜론)이 붙지 않아도 됨

<br />

## SUB Query를 사용가능한 명령문
* Group by를 제외한 모든 명령문
* 주로 **SELECT / FROM / WHERE** 에 많이 쓰임

<br />

## SELECT 절의 Sub QUERY
* 결과값 ==> ***''하나의 값''***

```sql
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
```

<br />

## FROM 절의 Sub Query
* 결과값 ==> ***"하나의 테이블"***

```sql
select 
  number,
  rank() over(order by height) as height_rank
from ability;

# 키 순위가 3순위인 포켓몬의 번호와 키 순위를 가지고 와 주세요~
select number, height_rank
from (select number, rank() over(order by height) as height_rank from ability) as a
where height_rank = 3;
-- from 절의 sub query는 결과값이 반드시 >> "하나의 테이블"
```

<br />

## WHERE 절의 Sub Query
* 결과값 ==> ***"하나의 컬럼"*** <br />
  (단, exists / not exists는 제외 ==> ***여러 컬럼 가능***) <br />
  (단, 비교 연산자 사용 시 ==> 반드시 ***"하나의 값"***)

```sql
select number
from ability
where height < (select avg(height) from ability);
-- 비교 연산자 사용 시 서브쿼리의 결과값이 반드시 >> **하나의 값**

select number
from ability
where attack < all(select attack from ability where type = "electric" );

select number
from ability
where defense > any(select attack from ability where type = "electric");

select number
from ability
where exists(select * from ability where type = "bug");
-- exists / not exists는 여러 컬럼이 나와도 괜찮음alter
-- exists / not exists는 결과값을 True / False로 반환

```

<br />
