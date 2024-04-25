# array의 모든 원소에 5를 더해서 만드는 함수 

### 제출 일자

2024년 04월 25일 

<hr>

### 💡Problem
array의 모든 원소에 5를 더해서 만드는 함수를 만들어 보세요.

<hr>

<br />

## 💡Solving
```python
import numpy as np

# 함수 선언
def add_five_to_array(values):
  output = np.empty(len(values))

  for i in range(len(values)):
    output[i] = values[i] + 5
  return output

# 메인 코드

values = np.random.randint(1, 10, size = 5)
print(values)
print()

print(add_five_to_array(values))
```

<br />

## 💡Review
>> 

<br />

### 문제 출처

Pandas_01_넘파이 사용해보기.pdf / 멀티캠퍼스_멀티잇 데이터 분석&서비스개발(Python)_8회차
