# HADOOP

## Local Configuration
https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html

**NOTE:** Hadoop is jre8/11 compatible (jdk8 for development), do not use *sudo apt install default-jdk default-jre -y* , default version for Debian 12 (bookworm) is 17, for example.

OpenJDK v11 mirror (Default Java for bullseye/stretch): \
```deb http://ftp.de.debian.org/debian bullseye main```

OpenJDK v8 mirror (Default Java for for buster on ports where it is available): \
```deb http://ftp.de.debian.org/debian sid main```

Prerequisites are : ssh, pdsh, java 8 or 11

## Commands
- Create Hadoop folder, set virtual environment and install prerequisites:
```bash
$ mkdir Hadoop
Haddop $ python -m venv .venv
Haddop $ . .venv/bin/activate
(.venv) $ sudo apt-get update
(.venv) $ sudo apt-get install ssh
(.venv) $ sudo apt-get install pdsh
```
- Install compatible JAVA version
```
(.venv) $ sudo su -c "echo 'deb http://ftp.de.debian.org/debian bullseye main' > /etc/apt/sources.list.d/debian-bullseye.list"
(.venv) $ sudo apt-get install openjdk-11-jre
(.venv) $ java --version
    openjdk 11.0.20 2023-07-18
    OpenJDK Runtime Environment (build 11.0.20+8-post-Debian-1deb11u1)
    OpenJDK 64-Bit Server VM (build 11.0.20+8-post-Debian-1deb11u1, mixed mode, sharing)
```
- Download last hadoop version available: \
```wget https://dlcdn.apache.org/hadoop/common/stable/hadoop-3.3.6.tar.gz```
- Extract the file using : \
```tar -xzf Hadoop-3.3.6.tar.gz```

- Copy the Hadoop-3.3.6 folder to */home/username/hadoop*: \
```mv hadoop-3.3.6 $HOME/hadoop```
- Set environment variables, add this at the end of ~/.basrh \
    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
    export HADOOP_HOME=$HOME/hadoop #location of your hadoop file directory
    export HADOOP_MAPRED_HOME=$HADOOP_HOME
    export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export HADOOP_COMMON_HOME=$HADOOP_HOME
    export HADOOP_HDFS=$HADOOP_HOME
    export YARN_HOME=$HADOOP_HOME
    export HADOOP_USER_CLASSPATH_FIRST=true

    alias hadoop=$HADOOP_HOME/bin/./hadoop #for convenience
    alias hdfs=$HADOOP_HOME/bin/./hdfs #for convenience
    ``` 
- Execute : \
```~/hadoop/bin/hadoop```
- Copy unpacked conf dir to use as input
    ```bash
    (.venv) $ cd ~/hadoop
    (.venv) $ mkdir input
    (.venv) $ cp etc/hadoop/*.xml input
    (.venv) $ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar grep input output 'dfs[a-z.]+'
    (.venv) $ cat output/*
    ```
- Set *Local (Standalone) Mode* configuration \
    ***etc/hadoop/core-site.xml***
    ```xml
    <configuration>
        <property>
            <name>fs.defaultFS</name>
            <value>hdfs://localhost:9000</value>
        </property>
    </configuration>
    ```
    ***etc/hadoop/hdfs-site.xml***
    ```xml
    <configuration>
        <property>
            <name>dfs.replication</name>
            <value>1</value>
        </property>
    </configuration>
    ```

- ssh to localhost \
```(.venv) $ ssh localhost```

    ***NOTE:*** If using WSL (Windows Subsystem for Linux) start the ssh service executing the next command :\
    ```service ssh start```

- If you cannot ssh to localhost without a passphrase, execute the following commands:
    ```sh
    $ ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
    $ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    $ chmod 0600 ~/.ssh/authorized_keys
    ```

## Execution (Single node)
- Format the system \
```(.venv) $ bin/hdfs namenode -format```
- Start NameNode daemon and DataNode daemon: \
```(.venv) $ sbin/start-dfs.sh```
- If getting: \
```localhost: rcmd: socket: Permission denied```

- Check default pdsh's rcmd with \
```pdsh -q -w localhost```
sample output:
    ```sh
    -- DSH-specific options --
    Separate stderr/stdout  Yes
    Path prepended to cmd   none
    Appended to cmd         none
    Command:                none
    Full program pathname   /usr/bin/pdsh
    Remote program path     /usr/bin/pdsh

    -- Generic options --
    Local username          username
    Local uid               1000
    Remote username         username
    Rcmd type               rsh
    one ^C will kill pdsh   No
    Connect timeout (secs)  10
    Command timeout (secs)  0
    Fanout                  32
    Display hostname labels Yes
    Debugging               No

    -- Target nodes --
    localhost
    ```