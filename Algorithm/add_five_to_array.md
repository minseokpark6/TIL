# array의 모든 원소에 5를 더하는 함수 

### 제출 일자

2024년 04월 25일 

<hr>

### Problem
array의 모든 원소에 5를 더하는 함수를 만들어 보세요.

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

## 💡Solving_Numpy
```python
import numpy as np

arr = np.random.randint(1, 10, size = 5)
arr_added = arr + 5
print(arr_added)

# [ 9. 10. 12. 11. 13.]


```

<br />

## 💡Review
> 함수를 칠 때, 강사님들이 어떤 순서로 쳤는지 기억하자.
* Numpy의 Broadcasting이 얼마나 효율적인지 보여주기 위한 비교
* 실제로 데이터 사이즈가 1,000,000을 넘어가기 시작하면 유의미한 차이가 보인다. 

<br />

### 문제 출처

Pandas_01_넘파이 사용해보기.pdf / 멀티캠퍼스_멀티잇 데이터 분석&서비스개발(Python)_8회차
