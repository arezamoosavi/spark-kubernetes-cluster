FROM python:3.7-slim-stretch

RUN apt-get update -y && apt-get install -y libzbar-dev bash gcc git libc-dev curl wget vim nano \
    && apt-get install -y iputils-ping telnet openssh-client net-tools \
    man unzip vim-tiny bc openssh-server thrift-compiler netcat sudo \
    && apt-get install -y build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install OpenJDK 8
RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
RUN echo $JAVA_HOME

# install spark
RUN wget --no-verbose https://downloads.apache.org/spark/spark-3.1.1/spark-3.1.1-bin-hadoop3.2.tgz && \
    tar -xzvf spark-3.1.1-bin-hadoop3.2.tgz && \
    mv spark-3.1.1-bin-hadoop3.2 /opt/spark && \
    rm -rf spark-3.1.1-bin-hadoop3.2.tgz

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python3:$SPARK_HOME/python3/lib/py4j-0.10.7-src.zip:$PYTHONPATH

COPY container/k8s/requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf requirements.txt

RUN mkdir -p /opt/spark/work-dir
COPY ./src /opt/spark/work-dir

COPY container/k8s/entrypoint.sh /opt/
COPY container/k8s/decom.sh /opt/

RUN chmod g+w /opt/work-dir
RUN chmod a+x /opt/decom.sh

WORKDIR /opt/work-dir
ENTRYPOINT [ "/opt/entrypoint.sh" ]