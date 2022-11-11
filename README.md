timeline

11.1 ~ 11.5 : understanding dart & flutter basic

11.5 ~ 11.8 : making pilot apps & analyze official flutter document

11.9 ~ 11.14 : develope movieapp based on flutter

11.8 --

<img src="https://user-images.githubusercontent.com/53465675/200480143-cc67078f-eb5f-459a-8351-4ecd5a9d44b1.png" width="300" height="600">

1. pagination library 확인하기

2. scrollcontroller 기능파악

3. click후 detail 렌더링

   11.9 --

4. 페이지 이동시 argument 전달

5. json 구조 파악

6. argument의 변수형 변형

<img width="300" height="600" src="https://user-images.githubusercontent.com/53465675/200992310-46b2ae4e-3116-4749-8d09-e0021c984f51.png">

11.10--

7. search route 구현

7.1. futurebuiler & snapshot

7.2. search route로 이동후 query 받으면서 화면하단에 search result render

11.11--

<img width="300" height="600" alt="search_empty" src="https://user-images.githubusercontent.com/53465675/201268251-bacfab57-2021-4daf-9786-97a8f3bd306c.png">



7.3. search library 활용(불가능)

-> searchDelegate를 쓰려고 하였으나 활용하는 api가 scroll를 내리면서 url에 page를 받아야하는 구조. 따라서 statefulwidget을 써야함.또한 dart는 클래스 상속이 하나밖에 되지 않음. 따라서 search library버리고 statefulwidget을 써야함.
