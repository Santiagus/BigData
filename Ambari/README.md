# AMBARI 

https://ambari.apache.org/

A web-based tool for provisioning, managing, and monitoring Apache Hadoop clusters which includes support for Hadoop HDFS, Hadoop MapReduce, Hive, HCatalog, HBase, ZooKeeper, Oozie, Pig and Sqoop. 

Ambari also provides a dashboard for viewing cluster health such as heatmaps and ability to view MapReduce, Pig and Hive applications visually alongwith features to diagnose their performance characteristics in a user-friendly manner.

## Prerequisites
- Install Maven \
```$ sudo apt install maven```


## Local Configuration
```sh
$ wget https://www-eu.apache.org/dist/ambari/ambari-2.7.7/apache-ambari-2.7.7-src.tar.gz
$ tar xfvz apache-ambari-2.7.7-src.tar.gz
$ cd apache-ambari-2.7.7-src
$ mvn versions:set -DnewVersion=2.7.7.0.0
$ pushd ambari-metrics
$ mvn versions:set -DnewVersion=2.7.7.0.0
$ popd
$ mvn -B clean install jdeb:jdeb -DnewVersion=2.7.7.0.0 -DbuildNumber=388e072381e71c7755673b7743531c03a4d61be8 -DskipTests -Dpython.ver="python >= 2.6"
```

