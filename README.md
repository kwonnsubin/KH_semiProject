# KH_semiProject 개인 프로젝트(쓰레기 백과사전)

## 구현 목표
- 사용자가 자신이 버릴 쓰레기가 어떤 분리수거함에 들어가는지, 어떻게 처리해야 하는지 쉽게 알 수 있도록 안내하고, <br>
쓰레기의 종류와 분리방법을 포함한 정보를 사용자가 쉽게 찾을 수 있도록 제공하는 것 
- 쓰레기 분리와 관련된 활동에 대한 참여도를 높이기 위해 쓰레기 처리에 대한 정보를 제공하는 게시판 형태의 커뮤니티 추가

## 구현 기간
프로젝트 구현기간 : 2023-02-16 ~ 2023-02-23

## 개발 환경
OS : Window 10(x64)
<br>
Language : Java11, Servlet/JSP, HTML5, JavaScript, CSS, JSP/Servlet
<br>
Web Application Server : Apache-Tomcat 9.0
<br>
DataBase : Oracle 21c Express Edition
<br>
Framework : Bootstrap5, jQuery, Ajax, Gson(2.8.5), Json(1.1.1)
<br>
Developer Tool : Eclipse(2020-09), SQL Developer(22.2.1.234), DBeaver(22.2.4)
<br>
Version Management System : Git (Github Desktop)

## 구현 기능
### 메인 페이지
![메인페이지](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/43da3c54-c50c-4117-9a26-9e3ac0301657)

### 검색
![메인페이지 검색](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/b26b5274-de65-4de6-bf21-4582d27138ba)

- ajax를 활용한 실시간 검색 기능

<img width="704" alt="스크린샷 2023-05-22 오전 10 13 06" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/768b9998-95e2-44e7-8a26-c945612c8a2e">

<img width="1022" alt="스크린샷 2023-05-22 오후 1 32 04" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/6c71971d-0fad-45da-9322-6e6d96f2bc7f">

<img width="1059" alt="스크린샷 2023-05-22 오후 1 41 37" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/eb4de9b4-c1da-4480-a89e-c5f28f1232e1">

<img width="866" alt="스크린샷 2023-05-22 오후 1 38 46" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/fe14b409-f5ba-4ec6-bd69-3b1beb26e37b">

### 회원가입
![회원가입](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/5996bfa1-00a9-4bbd-a4ee-91aa77e5da30)

- 자바스크립트와 ajax를 활용한 이메일 중복확인, 비밀번호 일치 유효성 검사

<img width="785" alt="스크린샷 2023-05-22 오전 10 21 58" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/e20cf974-dfbe-42d3-832c-8043c0bf2ad2">

<img width="596" alt="스크린샷 2023-05-22 오전 10 17 17" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/51b8a425-a597-42fd-9d4f-9f00998b27f8">

### 로그인/로그아웃
![로그인로그아웃](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/4c767ff9-8f18-4bdb-9240-d9f6366ee214)

### 커뮤니티 
#### 글 목록
![커뮤니티목록](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/ff3d96d3-533a-4ef3-ab20-eb130fcc2157)

- 페이징 적용

#### 글 작성
![회원글작성](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/88caded7-a9f2-4036-bffc-317ec4c99552)

![비회원 글작성](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/80cd9403-f687-4cf0-9880-cce02629998a)

- 회원/비회원 둘다 게시글 작성 가능
  - 비회원 일땐 아이디, 비밀번호 입력

#### 글 수정, 삭제
![글수정삭제](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/158ac6ad-1e18-4d38-a156-815520e77254)

- session에 저장된 로그인된계정 nickname과 글 작성자의 아이디가 같을 시 수정, 삭제 버튼이 활성화

<img width="1213" alt="스크린샷 2023-05-22 오전 10 32 43" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/b91f606e-6f3b-4983-94a0-53deeff6962c">

#### 댓글 작성, 수정, 삭제
![댓글작성수정삭제](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/439743fe-375e-414b-99f5-e7e9c202b902)

- 로그인한 아이디와 댓글 작성자의 아이디가 같을 시 수정, 삭제 버튼이 활성화
  - 각 댓글마다 고유번호id를부여하여 댓글 수정 시 해당번호의 댓글이 수정할 수 있는 수정폼으로 변경된다.

## Document
### 화면설계서
https://docs.google.com/presentation/d/1p4_CDNj-eKKnKpVJDsKBclZQUTaxA8bs/edit?usp=sharing&ouid=112907135514416036558&rtpof=true&sd=true
