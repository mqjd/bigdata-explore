#!/bin/bash

BIGDATA_HOME=/opt/hd

if [ -d "${BIGDATA_HOME}/jdk" ]; then
    export JAVA_HOME=${BIGDATA_HOME}/jdk
    export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib/rt.jar
    export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
fi

if [ -d "${BIGDATA_HOME}/scala" ]; then
    export SCALA_HOME=${BIGDATA_HOME}/scala
    export PATH=$PATH:$SCALA_HOME/bin
fi

if [ -d "${BIGDATA_HOME}/hadoop" ]; then
    export HADOOP_HOME=${BIGDATA_HOME}/hadoop
    export HADOOP_CONF_DIR=${BIGDATA_HOME}/conf/hadoop
    export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
fi

if [ -d "${BIGDATA_HOME}/hive" ]; then
    export HIVE_HOME=${BIGDATA_HOME}/hive
    export HIVE_CONF_DIR=${BIGDATA_HOME}/conf/hive
    export PATH=$PATH:$HIVE_HOME/bin
fi

if [ -d "${BIGDATA_HOME}/spark" ]; then
    export SPARK_HOME=${BIGDATA_HOME}/spark
    export SPARK_CONF_DIR=${BIGDATA_HOME}/conf/spark
    export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
fi
