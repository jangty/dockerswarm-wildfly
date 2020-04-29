# wildfly14 (java8) 도커 이미지 빌드하고, 이미지 run 하기

## 도커 빌드
Dockerfile 파일 존재하는 경로에서 아래 명령어 실행하면 이미지가 생성됨. (도커 이미지 확인 : docker images)

docker build --tag=이미지명 .
ex) docker build --tag=monitoring_server1 .

## 이미지 실행 (docker-compose)
docker-compose 파일 존재하는 경로에서 아래 명령어 실행

최초기동 : docker-compose up -d

중지 : docker-compose stop

실행 : docker-compose start

삭제 : docker-compose down