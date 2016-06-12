FROM cgswong/min-jessie:latest

# puts android tools in the PATH
ENV ANDROID_HOME=/android-sdk-linux
ENV PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
RUN curl -O http://dl.google.com/android/android-sdk_r23.0.1-linux.tgz
RUN tar xvzf android-sdk_r23.0.1-linux.tgz
RUN rm android-sdk_r23.0.1-linux.tgz
RUN android list sdk --all
ADD install_android_sdk.sh install_android_sdk.sh
RUN sh install_android_sdk.sh
RUN npm install -g react-native-cli
RUN mkdir /app
WORKDIR app
ADD package.json package.json
RUN npm install
