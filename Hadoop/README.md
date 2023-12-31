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
- Install compatible JAVA version (Debian)
    <!-- (.venv) $ sudo su -c "echo 'deb http://ftp.de.debian.org/debian bullseye main' > /etc/apt/sources.list.d/debian-bullseye.list" -->
    <!-- (.venv) $ sudo apt-get install openjdk-11-jre -->
    ```sh    
    (.venv) $ sudo su -c "echo 'deb http://ftp.de.debian.org/debian sid main' > /etc/apt/sources.list.d/debian-sid.list"
    (.venv) $ sudo apt-get update    
    (.venv) $ sudo apt-get install openjdk-8-jdk
    (.venv) $ java -version```
    ```
    <details><summary>sample output</summary>

    ```
    openjdk version "1.8.0_382"
    OpenJDK Runtime Environment (build 1.8.0_382-8u382-ga-2-b05)
    OpenJDK 64-Bit Server VM (build 25.382-b05, mixed mode)
    ```
    </details>

- Install compatible JAVA version (CentOS7)
```sudo yum install java-1.8.0-openjdk-devel```

- If several JAVA versions installed use the following command to activate the desired one (JAVA 8): \
```sudo update-alternatives --config java```

- Download last hadoop version available: \
```wget https://dlcdn.apache.org/hadoop/common/stable/hadoop-3.3.6.tar.gz```
- Extract the file using : \
```tar -xzf Hadoop-3.3.6.tar.gz```

- Copy the Hadoop-3.3.6 folder to */home/username/hadoop*: \
```mv hadoop-3.3.6 $HOME/hadoop```
<!-- export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ -->
- Set environment variables, add this at the end of ~/.basrh \
    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
    export HADOOP_HOME=$HOME/hadoop       # location of your hadoop file directory
    export HADOOP_MAPRED_HOME=$HADOOP_HOME
    export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export HADOOP_COMMON_HOME=$HADOOP_HOME
    export HADOOP_HDFS=$HADOOP_HOME
    export YARN_HOME=$HADOOP_HOME
    export HADOOP_USER_CLASSPATH_FIRST=true

    alias hadoop=$HADOOP_HOME/bin/./hadoop # for convenience
    alias hdfs=$HADOOP_HOME/bin/./hdfs     # for convenience
    alias hdir='cd $HADOOP_HOME'           # for convenience
    ``` 
- For adding the specified environment variables run: \
```$ source ~/.bashrc```
- Check hadoop works: \
``` $ hadoop```
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
    ```$ service ssh start```

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
```$ localhost: rcmd: socket: Permission denied```

- Check default pdsh's rcmd with \
```$ pdsh -q -w localhost```
    <details> <summary>sample output:</summary>

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
    </details>

- If Rcmd type is rsh set run following command : \
```$ echo "export PDSH_RCMD_TYPE=ssh" >> ~/.bashrc```

- If JAVA_HOME not defined error set it in *$HADOOP_HOME/etc/hadoop/hadoop-env.sh* \

    ```$ echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> $HOME_HADOOP/etc/hadoop/hadoop-env.sh```

- Check web interface for NameNode: by default available at: \
http://localhost:9870/

- Make the HDFS directories required to execute MapReduce jobs: \
```$ bin/hdfs dfs -mkdir -p /user/<username> ```

- Copy the input files into the distributed filesystem: \
    ```$ bin/hdfs dfs -mkdir input``` \
    ```$ bin/hdfs dfs -put etc/hadoop/*.xml input```
- Run some of the examples provided: \
```$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar grep input output 'dfs[a-z.]+'```
- Examine the output files: Copy the output files from the distributed filesystem to the local filesystem and examine them: \
```$ bin/hdfs dfs -get output output``` \
```$ cat output/*``` \
or \
View the output files on the distributed filesystem: \
 ```$ bin/hdfs dfs -cat output/*```
- When you’re done, stop the daemons with: \
 ```$ sbin/stop-dfs.sh ```