# [AMBARI](https://ambari.apache.org/)

A web-based tool for provisioning, managing, and monitoring Apache Hadoop clusters which includes support for Hadoop HDFS, Hadoop MapReduce, Hive, HCatalog, HBase, ZooKeeper, Oozie, Pig and Sqoop. 

Ambari also provides a dashboard for viewing cluster health such as heatmaps and ability to view MapReduce, Pig and Hive applications visually alongwith features to diagnose their performance characteristics in a user-friendly manner.

## References: 
- [Github](https://github.com/apache/ambari)
- [Installation Guide Ambari 2.7.7](https://cwiki.apache.org/confluence/display/AMBARI/Installation+Guide+for+Ambari+2.7.7)
- [Quick Start Guide](https://cwiki.apache.org/confluence/display/AMBARI/Quick+Start+Guide)
- [CentOS WSL](https://github.com/mishamosher/CentOS-WSL/releases)
- [Ambari rpm packages for centos7](https://clemlabs.s3.eu-west-3.amazonaws.com/centos7/ambari-release/2.7.6.0-22/repos-ambari.tar.gz)
- [Docker Images](https://hub.docker.com/search?q=ambari)

## ***Notes:***
Building process is plenty of bugs and deprecated so you will have to do some or all of:
- Add Repositories / download some packages manually
- Update *pow.xml* files to remove WARNINGS or ERRORS due to duplicated refs or non found package versions

## Recommended Aproaches:
- [Docker Images](https://hub.docker.com/search?q=ambari)
- [Precompiled packages](https://clemlabs.s3.eu-west-3.amazonaws.com/centos7/ambari-release/2.7.6.0-22/repos-ambari.tar.gz)


## Prerequisites
- For WSL [enable systemd](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/)

- Maven
- JAVA 8 JDK
- CentOS 7 (Recommended)

## CentOS-7 (x86_64)

- Install Maven: 
    ```sh
    $ wget https://mirrors.ibiblio.org/apache/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz```
    $ tar xfvz apache-maven-3.9.5-bin.tar.gz```
    $ mv apache-maven-3.9.5 /usr/local
    $ export PATH=/usr/local/apache-maven-3.9.5/bin:$PATH
    ```
- Install *rpm-build*: \
```$ yum install rpm-build```

- Update pow.xml and set maven-plugin version from 1.8 to 3.4.0
    ```xml
    <artifactId>build-helper-maven-plugin</artifactId>
    <version>3.4.0</version>
    ```
<details><summary>maven-plugin error</summary>

```
[ERROR] Failed to execute goal org.codehaus.mojo:versions-maven-plugin:2.14.1:set (default-cli) on project ambari: Execution default-cli of goal org.codehaus.mojo:versions-maven-plugin:2.14.1:set failed: Unable to load the mojo 'set' (or one of its required components) from the plugin 'org.codehaus.mojo:versions-maven-plugin:2.14.1': com.google.inject.ProvisionException: Guice provision errors:
```
</details>

```bash
$ mvn -B build-helper:parse-version org.codehaus.mojo:versions-maven-plugin:2.5:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion}`
$ mvn -B clean install rpm:rpm -DnewVersion=2.7.7.0.0 -DbuildNumber=388e072381e71c7755673b7743531c03a4d61be8 -DskipTests -Dpython.ver="python >= 2.6" -Drat.skip=true
```

## Local Configuration
```sh
$ wget https://www-eu.apache.org/dist/ambari/ambari-2.7.7/apache-ambari-2.7.7-src.tar.gz
$ tar xfvz apache-ambari-2.7.7-src.tar.gz
$ cd apache-ambari-2.7.7-src
$ mvn versions:set -DnewVersion=2.7.7.0.0
$ pushd ambari-metrics
$ mvn versions:set -DnewVersion=2.7.7.0.0
$ popd
$ npm install --no-fund karma-cli
$ mvn -B clean install jdeb:jdeb -DnewVersion=2.7.7.0.0 -DbuildNumber=388e072381e71c7755673b7743531c03a4d61be8 -DskipTests -Dpython.ver="python >= 2.6" -Drat.skip=true
```


## Comments about building Errors
- Plugin duplicated errors:
    <details>

    ```sh
    [WARNING] Some problems were encountered while building the effective model for org.apache.ambari:ambari-agent:jar:2.7.7.0.0
    [WARNING] 'dependencies.dependency.(groupId:artifactId:type:classifier)' must be unique: org.apache.zookeeper:zookeeper:jar -> duplicate declaration of version (?) @ line 142, column 17
    [WARNING]
    [WARNING] Some problems were encountered while building the effective model for org.apache.ambari:ambari-logsearch-logfeeder:jar:2.7.7.0.0
    [WARNING] 'build.plugins.plugin.(groupId:artifactId)' must be unique but found duplicate declaration of plugin org.apache.maven.plugins:maven-compiler-plugin @ line 334, column 15
    [WARNING]
    [WARNING] Some problems were encountered while building the effective model for org.apache.ambari:ambari-serviceadvisor:jar:1.0.0.0-SNAPSHOT
    [WARNING] 'build.plugins.plugin.version' for org.vafer:jdeb is missing. @ line 132, column 15
    ```
    </details>
    <details> <summary> Solution </summary>
    Check *pow.xml* files and remove/comment duplicates (meaning same groupId:artifactId:type:classifier XML tags)
    </details>
pom.xml
<!-- <url>https://nexus-private.hortonworks.com/nexus/content/groups/public/</url> -->
<url>https://repo.hortonworks.com/content/groups/public/</url>


- build failed: Too many files with unapproved license \
Run *mvn* with *-Drat.skip=true \
```mvn clean install -Drat.skip=true```



- *ambari-metrics-storm-sink-legacy/pow.xml* (https://mvnrepository.com/artifact/org.apache.storm/storm-core/1.2.4)
```xml
<groupId>org.apache.storm</groupId>
<artifactId>storm-core</artifactId>
<version>1.2.4</version>
<!-- <version>${storm.version}</version> -->      
<scope>compile</scope>
```

```$ cd ambari-server/target/rpm/ambari-server/RPMS/noarch/```


## Alternative

https://www.opensourcedataplatform.com/en/docs/installation-01-ambari

- Install httpd ```yum install httpd```
- File download ```wget https://clemlabs.s3.eu-west-3.amazonaws.com/centos7/ambari-release/2.7.6.0-22/repos-ambari.tar.gz```
- Extract the archive in */var/www/html* (default installation folder for httpd)

Configure the yum repository on your servers. Edit /etc/yum.repos.d/ambari.repo
```sudo reposync -g -l -d -m --repoid=centosplus --newest-only --download-metadata --download_path=/var/www/html/repos/```
NOTE: rpm packages can be found at */var/www/html/ambari-release/dist/centos7/1.x/BUILDS/2.7.6.0-22/rpms/* : \
```
ambari-metrics-collector-2.7.6.0-0.x86_64.rpm
ambari-views-2.7.6.0-0.noarch.rpm
ambari-infra-2.7.6.0-0.noarch.rpm
ambari-metrics-hadoop-sink-2.7.6.0-0.x86_64.rpm
...
```
About repo set up : https://linuxhostsupport.com/blog/how-to-set-up-and-use-yum-repositories-on-centos-7/

## PostgreSQL installation
```
sudo yum install epel-release
sudo yum install zstd zstd-devel
sudo yum install postgresql15-server postgresql15
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
mkdir /usr/local/pgsql
mkdir /usr/local/pgsql/etc
sudo cp /usr/pgsql-15/share/pg_service.conf.sample /usr/local/pgsql/etc/pg_service.conf
```
- For WSL check [Install PostgreSQL](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database#install-postgresql)


## Ambari Start Up
```
$ ambari-server setup -s
$ ambari-server start
```

- Check in http://localhost:8080/#/login
- default *user/pass : admin/admin*