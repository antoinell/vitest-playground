#
# Base-Node
#
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS nodewindows
# Install dependencies first
RUN mkdir c:\node
WORKDIR c:\\node

RUN curl.exe -o Node.zip https://nodejs.org/dist/v22.12.0/node-v22.12.0-win-x64.zip
RUN tar -xf Node.zip -C c:\node
RUN del Node.zip

USER ContainerAdministrator
RUN setx /M PATH "%PATH%;C:\Node\node-v22.12.0-win-x64"
USER ContainerUser

#
# Builder
#
FROM nodewindows AS builder

RUN mkdir c:\azurite
WORKDIR c:\\azurite

COPY *.json *.html *.ts *.js ./

# Copy the source code and build the app
COPY public ./public
COPY src ./src
COPY tests ./tests
RUN npm install
RUN npm run test

#ADD git@github.com:antoinell/vitest-playground.git /app




