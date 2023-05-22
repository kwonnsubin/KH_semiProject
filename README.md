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
![메인페이지](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/a55080b1-83c1-4610-910c-0c9e25630d5b)

### 검색
![검색기능](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/0754f253-edc2-4491-9136-53a689690452)

- ajax를 활용한 실시간 검색 기능

<img width="704" alt="스크린샷 2023-05-22 오전 10 13 06" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/c40c292f-e40e-43bc-ac02-3f62842e6e21">

<img width="1023" alt="스크린샷 2023-05-13 오후 10 00 30" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/c7d9bd0e-dde8-40fe-9f7b-a63244dc8df0">

<img width="1244" alt="스크린샷 2023-05-13 오후 10 06 20" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/55c35a29-47ce-4df8-9413-6b8e5a8402f6">

<img width="866" alt="스크린샷 2023-05-13 오후 10 08 00" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/68a3fc12-c598-4984-9d4a-dc7098cddd8e">

### 회원가입
![회원가입](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/51c26d20-372a-479f-83d1-ea5933ce7702)

- 자바스크립트와 ajax를 활용한 이메일 중복확인, 비밀번호 일치 유효성 검사

<img width="785" alt="스크린샷 2023-05-22 오전 10 21 58" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/497ce072-dfcb-42e9-b9c1-495c6ddb3965">

<img width="596" alt="스크린샷 2023-05-22 오전 10 17 17" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/43900c8b-20a6-4410-97d1-f7aede255a78">

### 로그인/로그아웃
![로그인,로그아웃](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/bea34c28-65af-462b-b2f3-0f07296c370c)

### 커뮤니티 
#### 글 목록
![게시판 목록](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/c9d0d228-21ad-46ef-98d3-d95d288b9811)

- 페이징 적용

#### 글 작성
![게시판 회원글작성](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/a1dea4ae-3ab9-421d-8063-bef340ed6969)

![비회원 글작성](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/b68fa3af-d9be-4b40-b504-51090abf66b4)

- 회원/비회원 둘다 게시글 작성 가능
  - 비회원 일땐 아이디, 비밀번호 입력

#### 글 수정, 삭제
![글 수정,삭제](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/f10e0cf6-f01a-424f-8f32-fff84956e442)

- session에 저장된 로그인된계정 nickname과 글 작성자의 아이디가 같을 시 수정, 삭제 버튼이 활성화

<img width="1213" alt="스크린샷 2023-05-22 오전 10 32 43" src="https://github.com/kwonnsubin/KH_semiProject/assets/108276943/bd66facc-d7d2-48fa-817e-00a1b9bee45b">

#### 댓글 작성, 수정, 삭제
![댓글 작성수정삭제](https://github.com/kwonnsubin/KH_semiProject/assets/108276943/92b75182-565b-49c2-a54a-d6b95bd42ec7)

- 로그인한 아이디와 댓글 작성자의 아이디가 같을 시 수정, 삭제 버튼이 활성화
  - 각 댓글마다 고유번호id를부여하여 댓글 수정 시 해당번호의 댓글이 수정할 수 있는 수정폼으로 변경된다.

## Document
### 화면설계서
https://docs.google.com/presentation/d/1p4_CDNj-eKKnKpVJDsKBclZQUTaxA8bs/edit?usp=sharing&ouid=112907135514416036558&rtpof=true&sd=true
