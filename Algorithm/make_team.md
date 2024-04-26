# 랜덤으로 팀 만들기 
### Type_Date
2024년 4월 24일

<hr>

### Problem
세미 프로젝트 팀을 짜봅시다. 전체 인원은 20명이고 4팀을 짤거에요. <br />
5명씩 한 팀이 되도록 랜덤으로 팀을 짜주세요.

<hr>

<br />

## 💡Solving
```python
import pandas as pd 
import numpy as np


path = './students.csv'
students = pd.read_csv(path, encoding='cp949').reset_index(drop=True) 

raw_data = students.sample(frac = 1)
# print(raw_data)
# frac = 0.1 (10%), frac = 1(100%)  >> 비율로 샘플을 뽑아

df = raw_data.copy()
students_list = df['성함'].tolist()

# 빈 리스트 생성
teams = [[] for i in range(4)]

# 각 팀에 5명씩 배정 
for i in range(5):
    for team in teams:
        student = students_list[0]
        team.append(student)
        students_list.remove(student)


# 결과 출력
for idx, team in enumerate(teams):
    print(f"팀 {idx+1}: {team}")
```

<br />

## 💡Review


<br />
