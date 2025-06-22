📘 PBL 프로젝트 결과보고서 요약
📌 과목 및 기본 정보
과목명: 웹앱프로그래밍 (Web App Programming)

팀원: 이은우(202025016), 임현수(202025026), 이민욱(202325007)

학년/반: 3-1

지도교수: 심효선

산업체 참가: 없음

🧠 프로젝트 개요
주제: 모바일 앱 작성하기

목표: 기계학습 서비스를 위한 서버 프로그래밍 학습 및 휴대폰 UI 환경에 맞춘 웹앱 개발

환경: JDK, Tomcat, Eclipse, Chrome, MySQL

🧩 핵심 기능
회원가입 / 탈퇴

로그인 / 로그아웃

블로그 등록 / 수정 / 삭제

블로그 내용 표시 (사진 포함)

데이터는 MySQL DB로 관리

모바일 기준 UI 구성

추가기능 구현 시 가산점 부여

📐 시스템 구조
서버 프로그램 구조

UI 구조

클라이언트 프로그램 구조: WebView 기반, IP 주소 입력 가능하게 구성

🔎 관련 기술 이론
HTTP 통신

Servlet

Database

Mobile Design

🛠️ 개선 사항 및 주요 구현
1. User Table에 필드 추가 (phonenum)
목적: 이름만으로 ID/PW 찾기 기능에 한계 → 휴대폰번호 추가

수정 항목:

signup.html: 폰번호 입력 필드 추가

signup.jsp: uphone 파라미터 저장

UserDAO.java: insert 함수에 uphone 추가

2. Feed Table에 필드 추가 (video)
목적: 게시글에 동영상 첨부 가능하도록 확장

수정 항목:

feedAdd.html: 비디오 파일 첨부 UI 추가

feedAdd4.jsp: 비디오 파일 처리 로직 추가

FeedDAO.java, FeedObj.java: video 필드 처리

main.jsp: 등록된 비디오 출력 UI 추가

3. 로그인 사용자의 정보 표시
main.jsp에서 로그인 사용자 ID 출력 추가

4. ID / PW 찾기 기능 구현
findID

HTML + JSP + DAO 구조로 이름+폰번호 기반 ID 찾기

findPW

ID+이름+폰번호 입력 → 비밀번호 재설정

비밀번호 변경 성공/실패 여부 출력

✅ 기대 효과 및 활용 방안
웹 기반의 머신러닝 서비스 구현을 위한 서버 백엔드 기초 기술 습득

프런트엔드 및 백엔드로의 진출 기반 마련

인공지능 서비스를 웹에서 제공 가능한 시스템 개발 능력 확보