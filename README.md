# BigData
Playground space for BigData projects

Projects were generally run using Debian WSL (Windows SubSystem for Linux)

If project depends on systemd check :
https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/



List of the technologies and tools for big data projects:

***NOTE:*** Added (<num_jobs>) next to the tool name as reference (metric) to establish an orden (prioritize) based on job market demand. (just for some)

1. **Data Ingestion and Collection**:
   - [Apache Kafka](https://kafka.apache.org/) ([778](https://uk.indeed.com/jobs?q=kafka&l=&vjk=f4531e1bb25afbb1)) : A real-time data streaming platform for event sourcing.
   - [Apache NiFi](https://nifi.apache.org/) ([34](https://uk.indeed.com/jobs?q=nifi&l=&vjk=b0085634ddee6b3c)) : An integrated data logistics platform for automating data movement.
   - [Apache Flume](https://flume.apache.org/) ([17](https://uk.indeed.com/jobs?q=flume&l=&vjk=9a005942bfd0cce2)): Collects, aggregates, and moves large volumes of data.

2. **Data Storage**:
   - [Hadoop Distributed File System (HDFS)](https://hadoop.apache.org/): A distributed file system for storing large datasets.
   - [Amazon S3](https://aws.amazon.com/s3/): Cloud-based object storage by Amazon Web Services.
   - [Azure Data Lake Storage](https://azure.microsoft.com/en-us/services/storage/data-lake-storage/): Cloud-based data storage by Microsoft Azure.
   - [Apache HBase](https://hbase.apache.org/): A NoSQL database for real-time data access.
   - [Cassandra](https://cassandra.apache.org/): A highly scalable NoSQL database.
   - [MongoDB](https://www.mongodb.com/): A document-oriented NoSQL database.

3. **Data Processing and Batch Processing**:
   - [Apache Hadoop MapReduce](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html): Batch processing and distributed data processing framework.
   - [Apache Spark](https://spark.apache.org/): Fast in-memory data processing, batch, and real-time stream processing.
   - [Apache Hive](https://hive.apache.org/): SQL-based querying and analysis.
   - [Presto](https://prestodb.io/): Distributed SQL query engine.
   - [Apache Pig](https://pig.apache.org/): Data flow scripting and analysis.

4. **Data Processing and Stream Processing**:
   - [Apache Kafka Streams](https://kafka.apache.org/documentation/streams/) ([782](https://uk.indeed.com/jobs?q=kafka&l=&vjk=f4531e1bb25afbb1)) : Real-time stream processing and event-driven applications.
   - [Apache Flink](https://flink.apache.org/) ([75](https://uk.indeed.com/jobs?q=flink&l=&vjk=b0085634ddee6b3c)) : Stream processing framework with low-latency and high-throughput capabilities.

5. **Data Orchestration and Workflow**:
   - [Apache Airflow](https://airflow.apache.org/) ([432](https://uk.indeed.com/jobs?q=Airflow&l=&vjk=9ac7d7fa69ae76c0)): Workflow automation and scheduling.
   - [Kubeflow Pipelines](https://www.kubeflow.org/docs/components/pipelines/v1/introduction/) ([32](https://uk.indeed.com/jobs?q=Kubeflow&l=&vjk=434da02026e15697)): Management of machine learning workflows on Kubernetes.
   - [Apache Oozie](http://oozie.apache.org/) ([5](https://uk.indeed.com/jobs?q=Oozie&l=&vjk=5ab256f058e15ccb)): Job scheduling, workflow management, and automation.

6. **Machine Learning and AI**:
   - [TensorFlow](https://www.tensorflow.org/) ([330](https://uk.indeed.com/jobs?q=TensorFlow&l=&vjk=8a551936816d81ba)): Open-source machine learning framework.
   - [PyTorch](https://pytorch.org/) ([326](https://uk.indeed.com/jobs?q=PyTorch&l=&vjk=8a551936816d81ba)): Deep learning framework.
   - [Scikit-learn](https://scikit-learn.org/) ([170](https://uk.indeed.com/jobs?q=Scikit-learn&l=&vjk=8a551936816d81ba)): Machine learning library for Python.
   - [Apache Spark MLlib](https://spark.apache.org/docs/latest/ml-guide.html) ([2](https://uk.indeed.com/jobs?q=Spark+MLlib&l=&vjk=1d735cc491b4a052)): Machine learning library integrated with Spark.
   - [Apache Mahout](https://mahout.apache.org/) ([1](https://uk.indeed.com/jobs?q=mahout&l=&vjk=7904a89403aa0da7)): Scalable machine learning and data mining.

7. **Data Visualization and Reporting**:
    - [Power BI](https://powerbi.microsoft.com/) ([2199](https://uk.indeed.com/jobs?q=power+bi&l=&vjk=ee498d15539ce894)): Data analytics and visualization by Microsoft.
    - [Tableau](https://www.tableau.com/) ([829](https://uk.indeed.com/jobs?q=tableau&l=&vjk=e10505ee35075603)): Data visualization and business intelligence tool.
    - [Looker](https://looker.com/) ([674](https://uk.indeed.com/jobs?q=looker&l=&vjk=6c577ba60031a001)): Data exploration and business intelligence platform.
    - [Dash](https://plotly.com/dash/) ([328](https://uk.indeed.com/jobs?q=dash&l=&vjk=3668120d6ea520da)): Python web application framework for building interactive data dashboards.
    - [Kibana](https://www.elastic.co/kibana) ([93](https://uk.indeed.com/jobs?q=kibana&l=&vjk=c702f85ca0e33400)): Data visualization and exploration for the Elastic Stack.
    - [Apache Superset](https://superset.apache.org/) ([1](https://uk.indeed.com/jobs?q=apache+superset&l=&vjk=08207349ba5baa76)): Data exploration and visualization platform.
    
    

8. **Data Security and Governance**:
   - [Apache Knox](https://knox.apache.org/) ([3](https://uk.indeed.com/jobs?q=Apache+Knox&l=&vjk=79c243574026da5b)): Gateway for securing Hadoop clusters.
   - [Apache Ranger](https://ranger.apache.org/) ([]()): Access control, auditing, and data governance.
   - [Cloudera Navigator](https://www.cloudera.com/products/navigator.html) ([]()): Data governance and management.

9. **Containers and Orchestration**:
   - [Docker](https://www.docker.com/) ([2706](4225e3a318)): Containerization of applications and services.
   - [Kubernetes](https://kubernetes.io/) ([1975](https://uk.indeed.com/jobs?q=Kubernetes&l=&vjk=5a785d09ed6383da)): Container orchestration and scaling.

10. **Monitoring and Logging**:
    - [Grafana](https://grafana.com/) ([361](https://uk.indeed.com/jobs?q=Grafana&l=&vjk=5a785d09ed6383da)): Metrics visualization and alerting.
    - [Prometheus](https://prometheus.io/) ([304](https://uk.indeed.com/jobs?q=Prometheus&l=&vjk=5a785d09ed6383da)): Metrics collection and monitoring.
    - [ELK Stack (Elasticsearch, Logstash, Kibana)](https://www.elastic.co/) ([206](https://uk.indeed.com/jobs?q=ELK&l=&vjk=8c6b3299c1b3ce4b)): Log analysis and visualization.
    - [Kibana](https://www.elastic.co/es/kibana) ([91](https://uk.indeed.com/jobs?q=kibana&l=&vjk=fbfc7bf4ccc4bc6d))
    - [Zabbix](https://www.zabbix.com/) ([53](https://uk.indeed.com/jobs?q=Zabbix&l=&vjk=0c689bda58764918))

11. **Resource Management**:
    - [Kubernetes](https://kubernetes.io/) ([1975](https://uk.indeed.com/jobs?q=Kubernetes&l=&vjk=5a785d09ed6383da)): Container orchestration and resource management.
    - [Apache YARN](https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YARN.html) ([84](https://uk.indeed.com/jobs?q=YARN&l=&vjk=59f26c9987199794)): Cluster resource management and job scheduling.
    - [Apache Mesos](http://mesos.apache.org/) ([32](https://uk.indeed.com/jobs?q=Mesos&l=&vjk=80a96a5964be2a6a)): Cluster resource management.

12. **Database and Querying Tools**:
    - [Apache Hive](https://hive.apache.org/) ([239](https://uk.indeed.com/jobs?q=hive+data&l=&vjk=167a7e2fcbcc715d)): SQL-based querying and data warehousing.
    - [Presto](https://prestodb.io/) ([136](https://uk.indeed.com/jobs?q=Presto&l=&vjk=e40f5c4542f898f4)): Distributed SQL query engine.
    - [Apache Impala](https://impala.apache.org/) ([16](https://uk.indeed.com/jobs?q=Impala&l=&vjk=e394fed4950b7c26)): High-performance SQL queries on Hadoop.

These descriptions provide an overview of each technology's purpose and capabilities. You can follow the links to access their official documentation for more detailed information.