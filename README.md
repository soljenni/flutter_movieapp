timeline

11.1 ~ 11.5 : understanding dart & flutter basic

11.5 ~ 11.8 : making pilot apps & analyze official flutter document

11.9 ~ 11.14 : develope movieapp based on flutter

---11.8---

<img src="https://user-images.githubusercontent.com/53465675/200480143-cc67078f-eb5f-459a-8351-4ecd5a9d44b1.png" width="300" height="600">

1. pagination library 확인하기

2. scrollcontroller 기능파악

3. click후 detail 렌더링

---11.9---

4. 페이지 이동시 argument 전달

5. json 구조 파악

6. argument의 변수형 변형

<img width="300" height="600" src="https://user-images.githubusercontent.com/53465675/200992310-46b2ae4e-3116-4749-8d09-e0021c984f51.png">

---11.10---

7. search route 구현

7.1. futurebuiler & snapshot

7.2. search route로 이동후 query 받으면서 화면하단에 search result render

---11.11---

<img width="300" height="600" alt="search_empty" src="https://user-images.githubusercontent.com/53465675/201268251-bacfab57-2021-4daf-9786-97a8f3bd306c.png">

7.3. search library 활용(불가능)

-> searchDelegate를 쓰려고 하였으나 활용하는 api가 scroll를 내리면서 url에 page를 받아야하는 구조.
따라서 statefulwidget을 써야함.또한 dart는 클래스 상속이 하나밖에 되지 않음. 따라서 search library버리고 statefulwidget을 써야함.

7.4. search route 부분구현
-> 문제점: onsubmit후에 api 가져와서 화면에 뿌리는 구조임. 그러나 textField에서 글자를 한개씩 지울때 에러뜸.
이유는 stackoverflow에도 안나옴. api 문제가 있는듯.
-> 가능한 대안: onchange에서 movie list를 진공으로 만들면서 scaffold에서 json을 못 뿌리게 막아야함.

<img width="300" height="600" alt="search_dollar" src="https://user-images.githubusercontent.com/53465675/201346430-69ec42d6-e3a8-4101-b981-694c559077d6.png">

7.5. search route 구현완료

---11.12---
(복습)

8. buildcontext, widget tree

9. asynchronous programming

- future(uncomplete, completed w/ value, complete w/ error) & futurebuilder
- iterable vs list

10. mouse scroll function added

11. \*\*\*setState -> trigger a rebuild of the view whenever the widget changes

---11.13---

12. scroll bottom일 경우 top 이동 구현

13. renderflex overflow 오류

14. 오후 9시 api 호출 제한 걸림
    -> 일일 호출이 매우 낮은, 안좋은 api 사용
    error message
    "Connection closed before full header was received "
    --> master branch로 publish 후 스마트폰으로 정상작동 확인

---11.14---

15. new api called

16. menu route 

<img width="300" height="600" src="https://user-images.githubusercontent.com/53465675/201593730-aacc464c-3551-4cd6-b7be-6b55b1142cbe.png">

