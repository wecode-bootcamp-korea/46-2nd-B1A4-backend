# Dockerfile

FROM node:current-alpine3.18

WORKDIR /usr/src/app

# 현재 패키지 설치 정보(package.json, package-lock.json)를 Docker 이미지에 복사합니다.
COPY package*.json .

RUN npm cache clean --force

RUN npm install

RUN chown -R node:node .

# 현재 경로에 존재하는 모든 파일을 Docker 이미지에 복사합니다.
COPY . .

EXPOSE 8001

CMD ["npm", "start"]
