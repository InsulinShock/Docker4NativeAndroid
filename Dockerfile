# Use an official Python runtime as a base image
FROM alpine:3.5

# Update and Upgrade Packages
RUN apk update && apk upgrade

# Add environment variables
ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r15

# install and source ansible
RUN apk add git 
RUN apk add cmake
RUN apk add wget 
RUN apk add zip
RUN apk add openjdk8-jre-base

#=====================================================================
# Download and Install Android NDK
#=====================================================================

# download
RUN mkdir -p /opt/android-ndk-tmp  
RUN cd /opt/android-ndk-tmp 
RUN wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip 

# uncompress
RUN unzip -q android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip

# move to its final location
RUN mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} 

# remove temp dir
#    cd ${ANDROID_NDK_HOME} && \
#    rm -rf /opt/android-ndk-tmp

# add to PATH
#ENV PATH ${PATH}:${ANDROID_NDK_HOME}



#=====================================================================
# Download OPENCV Source Code
#=====================================================================

# Clone opencv
RUN git clone https://github.com/opencv/opencv.git 


