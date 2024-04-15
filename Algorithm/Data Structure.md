# 자료 구조
프로그램에서 처리하는 자료를 저장하는 구조, 자료를 효율적으로 관리하는 방법
<br />
ex. 요리 재료 + 재료를 다듬는 법
<br />

# 자료 구조의 종류

![data_stricture](https://www.tutorialspoint.com/data_structures_algorithms/images/data_structures_and_types.jpg)


* 선형 자료구조
  + 리스트
    - 선형 리스트
    - 단순 연결 리스트
    - 원형 연결 리스트
  + 스택
  + 큐
    - 순차 큐
    - 원형 큐

* 비선형 자료구조
  + 트리
    - 이진 트리
  + 그래프
    - 방향 그래프
    - 무방향 그래프
<br />

![Data Structure](https://www.baseclass.io/newsletter/linear-data-structures/linear-non-linear.png)

<br />

# 선형 자료 구조(Linear Data Structure)
데이터를 한 줄로 순차적으로 표현한 형태
ex. 선형 리스트, 연결 리스트, 스택, 큐 

## 선형 리스트
* 데이터를 일정한 순서로 나열한 자료구조. <br />
* 순차 리스트(oredered List)라고도 함
* **사이사이에 빈틈이 없음**

### 데이터 추가_단순 구현

```
# 전역 변수부
katok = ['다현', '정연', '쯔위', '사나', '지효']

# 1단계 : 빈칸 추가 
katok.append(None)

# 2단계 : 마지막 칸에 새 친구 입력
katok[5] = '모모'
print(katok)
```

<br />

### 데이터 삽입_단순 구현

```
# 1단계 : 빈 칸 추가
katok.append(None)

# 2단계 : 한 칸씩 뒤로 이동 (맨 마지막 친구부터...3등까지)
katok[6] = katok[5]  # 모모 이동
katok[5] = None
katok[5] = katok[4]  # 지효 이동
katok[4] = None
katok[4] = katok[3]  # 사나 이동 
katok[3] = None

# 3단계 : 3등 자리에 미나 입력
katok[3] = '미나'

print(katok)
```

<br />

### 데이터 삭제_단순 구현

```
# 1단계 : 데이터 지우기
katok[4] = None

# 2단계 : 한 칸씩 앞으로 이동(지운 다음부터...마지막까지)
katok[4] = katok[5]   # 지효 이동
katok[5] = None
katok[5] = katok[6]   # 모모 이동
katok[6] = None

# 3단계 : 마지막 칸 제거 
del(katok[6])

print(katok)
```

<br />

### 데이터 추가

```
# 함수 선언부
def add_data(friend):
    # 1단계 빈칸 추가
    katok.append(None)
    
    # 2단계 마지막 칸에 데이터 입력
    kLen = len(katok)    # 선형 리스트의 길이를 파악
    katok[kLen-1] = friend


# 전역 변수부
katok = []

# 메인 코드부
add_data('다현')
add_data('정연')
add_data('쯔위')
add_data('사나')
add_data('지효')

print(katok)
```

### 데이터 삽입

```
# 함수 선언부

def insert_data(position, friend):
    # 1단계 : 빈칸 추가
    katok.append(None)
    kLen = len(katok)
    
    # 2단계 : 마지막 친구부터, 삽입할 위치까지 한 칸씩 뒤로 이동 
    for i in range(kLen-1, position, -1):     # 어려움 !! 자꾸 보면서 반복하면서 익힐 것
        katok[i] = katok[i-1]
        katok[i-1] = None

    # 3단계 : 위치에 친구 입력
    katok[position] = friend
```

### 데이터 삭제

```
def delete_data(position):
    # 1단계 : 데이터 삭제 
    katok[position] = None
    kLen = len(katok)
    
    # 2단계 : 한 칸씩 앞으로
    for i in range(position+1, kLen,1):     # 어려움
        katok[i-1] = katok[i]
        katok[i] = None

    # 3단계 : 마지막 칸을 제거 
    del(katok[kLen-1])
```

### 실제 사용 예시

```
# 전역 변수 선언
katok = []
select = -1

while (select != 4):
    select = int(input("선택하세요(1: 추가, 2: 삽입, 3: 삭제, 4: 종료)==> "))

    if select == 1:
        print("현재 katok 리스트는 => ",katok)
        data = input("추가할 데이터: ")
        add_data(data)
        print(katok)

    elif select == 2:
        print("현재 katok 리스트는 => ",katok)
        pos = int(input("삽입할 위치 --> "))
        data = input("추가할 데이터 --> ")
        insert_data(pos, data)
        print(katok)
    
    elif select == 3:
        print("현재 katok 리스트는 => ",katok)
        pos = int(input("삭제할 위치 --> "))
        delete_data(pos)
        print(katok)

    elif select == 4:
        print(katok)
        exit

    else:
        print("1부터 4까지 중 하나를 입력하세요~")
        continue
```


# 비선형 자료 구조(Non-Linear Data Structure)
하나의 데이터 뒤에 여러 개가 이어지는 형태  <br />
ex. 트리, 그래프 등





