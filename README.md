# wildfly14 (java8) 도커 이미지 빌드하고, 이미지 run 하기

## 개요
docker 이미지빌드하면 /target/ 폴더에 있는 .war파일을 이미지로 함께 만든다

생성된 이미지를 run하면 wildfly + 어플리케이션 배포가 됨. 

## 사용방법
### docker폴더 위치
프로젝트 root 에 위치 (/target, /src 와 동일 선상)

### 도커 빌드
Dockerfile 파일 존재하는 경로에서 아래 명령어 실행하면 이미지가 생성됨. (도커 이미지 확인 : docker images)

docker build --tag=이미지명 .
ex) docker build --tag=monitoring_server1 .

### 이미지 실행 (docker-compose)
docker-compose 파일 존재하는 경로에서 아래 명령어 실행

최초기동 : docker-compose up -d

중지 : docker-compose stop

실행 : docker-compose start

삭제 : docker-compose down

## TODO
로그 관리

클러스터링
