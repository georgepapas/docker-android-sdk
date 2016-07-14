FROM java:8-jdk

MAINTAINER George Papastamatopoulos "george.papas@gmail.com"

VOLUME /opt/app
VOLUME /root/.gradle/

#
# Taken from webratio docker file
# http://hub.docker.com/r/webratio/android-sdk
#
# Installs i386 architecture required for running 32 bit Android tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

ENV ANDROID_BUILD_TOOLS_VERSION 23.0.3
ENV ANDROID_SDK android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK}

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

ENV DROID_XTRA extra-android-m2repository,extra-android-support
ENV DROID_TOOLS platform-tools,tools,build-tools-${ANDROID_BUILD_TOOLS_VERSION}
ENV DROID_API_LEVELS android-23 

ENV FILTER ${DROID_XTRA},${DROID_TOOLS},${DROID_API_LEVELS}

RUN wget -qO- ${ANDROID_SDK_URL} | tar -zxv -C /opt/
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a -n
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a --filter ${FILTER}

WORKDIR /opt/app

ENTRYPOINT ["./gradlew"]