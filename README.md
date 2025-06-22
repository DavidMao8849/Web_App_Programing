# 📄 JSP 웹 프로그래밍
**웹 앱 프로그래밍 PBL 프로젝트**  
> 프로젝트 기간: 2025년 6월 9일 ~ 2025년 6월 23일

## 🧠 과목 및 기본 정보

- **과목명**: 웹앱프로그래밍 (Web App Programming)  
- **학년**: 3학년
- **팀원(역할)**: 이은우(id/pw 찾기 기능 추가, user 테이블 필드 추가 및 UI 디자인), 임현수(Feed 테이블 필드 추가 및 UI 디자인)

## 📌 프로젝트 개요
해당 프로젝트는 JSP의 동작 원리[서블릿으로 어떻게 변환 되는지], 처리과정, HTML입력 양식/프로토콜, 서블릿, DataBase[MySQL,JDBC 활용]에 대해 배우고, 제공된 초기 클라이언트 프로그램의 **UI 및 동작 기능을 추가/수정**해보는 실습 형태의 프로젝트로 진행되었다.

- **주제**: 모바일 앱 작성하기
- **목표**: 기계학습 서비스를 위한 서버 프로그래밍 학습 및 휴대폰 UI 환경에 맞춘 웹 앱 개발  
- **환경**: JDK, Tomcat, Eclipse, Chrome, MySQL
- **서버**: JSP + Servlet 기반 백엔드
- **데이터 관리**: MySQL을 활용한 DB 연동
  
---

## 🧩 핵심 기능

- 회원가입 / 탈퇴  
- 로그인 / 로그아웃  
- 블로그 등록 / 수정
- 블로그 내용 표시
- 사진 업로드 기능
- 동영상 업로드 기능 추가 (video 필드)
- ID / PW 찾기 기능 구현 (이름 + 전화번호 기반)

---

## 🧱 프로젝트 파일 구조

```bash
web_project/                 # 전체 프로젝트 루트
├── WebContent/              # 웹 리소스 및 정적/동적 HTML, JSP
│   ├── *.html               # 로그인, 회원가입, 블로그 등록 등 UI
│   ├── mysns.sql            # DB 초기화 SQL
│   ├── META-INF/            # 메타 정보
│   │   ├── MANIFEST.MF
│   │   ├── context.xml
│   ├── WEB-INF/             # 웹 애플리케이션 구성 파일 (web.xml 등 예상)
│   ├── jsp/                 # JSP 동적 페이지 폴더
│   │   ├── feedAdd.jsp
│   │   ├── findID.jsp
│   │   ├── findPW.jsp
│   │   ├── login*.jsp
│   │   ├── main.jsp
│   │   ├── resetPW.jsp
│   │   ├── signup.jsp
│   │   ├── ...
├── build/                   # 컴파일된 클래스 파일 (이클립스 자동 생성)
│   ├── classes/
├── src/                     # 자바 소스 코드 (Servlet, DAO 등)
│   ├── dao/                 # DAO 및 DTO 클래스
│   │   ├── FeedDAO.java     # 피드 데이터 처리 DAO
│   │   ├── FeedObj.java     # 피드 객체 클래스
│   │   ├── UserDAO.java     # 사용자 처리 DAO
│   │   ├── UserObj.java     # 사용자 객체 클래스
│   ├── util/                # 유틸리티 클래스
│   │   ├── ConnectionPool.java  # DB 연결 풀
│   │   ├── FileUtil.java        # 파일 처리 유틸
```

---

## 🔎 관련 기술 이론

- HTTP 통신
- JSP / Servlet 기반 서버 개발
- Database 연동 (User/Feed 테이블 등)
- Mobile Web UI 구성 (WebView 기반)

---

## 🛠️ 개선 사항 및 주요 구현

### 1. User Table에 필드 추가 (`phonenum`)

- **목적**: 이름만으로 ID/PW 찾기 기능에 한계 → 휴대폰번호 추가
- **수정 항목**:
  - `signup.html`: 폰번호 입력 필드 추가
  - `signup.jsp`: `uphone` 파라미터 저장
  - `UserDAO.java`: insert 함수에 `uphone` 추가

### 2. Feed Table에 필드 추가 (`video`)

- **목적**: 게시글에 동영상 첨부 가능하도록 확장
- **수정 항목**:
  - `feedAdd.html`: 비디오 파일 첨부 UI 추가
  - `feedAdd4.jsp`: 비디오 파일 처리 로직 추가
  - `FeedDAO.java`, `FeedObj.java`: `video` 필드 처리
  - `main.jsp`: 등록된 비디오 출력 UI 추가

### 3. 로그인 사용자의 정보 표시

- `main.jsp`에서 로그인 사용자 ID 출력 추가

### 4. ID / PW 찾기 기능 구현

- **findID**
  - HTML + JSP + DAO 구조로 이름+폰번호 기반 ID 찾기
- **findPW**
  - ID+이름+폰번호 입력 → 비밀번호 재설정
  - 비밀번호 변경 성공/실패 여부 출력

---

## ✅ 기대 효과 및 활용 방안

- 웹 기반의 머신러닝 서비스 구현을 위한 **서버 백엔드 기초 기술 습득** 
- 프론트엔드 및 백엔드로의 진출 기반 마련  
- 인공지능 서비스를 웹에서 제공 가능한 시스템 개발 능력 확보  

---

## 📎 부록

- 📄 [PBL 결과보고서 PDF]
