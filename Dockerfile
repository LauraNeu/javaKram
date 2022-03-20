FROM ubi7/ubi:7.7

MAINTAINER K.H. kherfert@informatik.hs-bremen.de

ENV PORT 2000

RUN yum install -y java-1.8.0-openjdk-devel && \
    yum clean all
RUN useradd karen

# Expose the custom port that you provided in the ENV var
EXPOSE ${PORT}

# Copy all files in working directory to java dir
COPY ./* /home/karen/java

RUN javac /home/karen/java/*.java

