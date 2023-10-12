# BigData
Playground space for BigData projects

Projects were generally run using Debian WSL (Windows SubSystem for Linux)

If project depends on systemd check :
https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/



List of the technologies and tools for big data projects:

***NOTE:*** Added (<num_jobs>) next to the tool name as reference to stablish an orden based on job market demand. (just for some)

1. **Data Ingestion and Collection**:
   - [Apache Kafka](https://kafka.apache.org/): A real-time data streaming platform for event sourcing.
   - [Apache Flume](https://flume.apache.org/): Collects, aggregates, and moves large volumes of data.
   - [Apache NiFi](https://nifi.apache.org/): An integrated data logistics platform for automating data movement.

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
   - [Apache Kafka Streams](https://kafka.apache.org/documentation/streams/): Real-time stream processing and event-driven applications.
   - [Apache Flink](https://flink.apache.org/): Stream processing framework with low-latency and high-throughput capabilities.

5. **Data Orchestration and Workflow**:
   - [Apache Oozie](http://oozie.apache.org/): Job scheduling, workflow management, and automation.
   - [Apache Airflow](https://airflow.apache.org/): Workflow automation and scheduling.
   - [Kubeflow Pipelines](https://www.kubeflow.org/docs/components/pipelines/v1/introduction/): Management of machine learning workflows on Kubernetes.

6. **Machine Learning and AI**:
   - [Apache Mahout](https://mahout.apache.org/): Scalable machine learning and data mining.
   - [Apache Spark MLlib](https://spark.apache.org/docs/latest/ml-guide.html): Machine learning library integrated with Spark.
   - [TensorFlow](https://www.tensorflow.org/): Open-source machine learning framework.
   - [PyTorch](https://pytorch.org/): Deep learning framework.
   - [Scikit-learn](https://scikit-learn.org/): Machine learning library for Python.

7. **Data Visualization and Reporting**:
    - [Power BI](https://powerbi.microsoft.com/) ([2199](https://uk.indeed.com/jobs?q=power+bi&l=&vjk=ee498d15539ce894)): Data analytics and visualization by Microsoft.
    - [Tableau](https://www.tableau.com/) ([829](https://uk.indeed.com/jobs?q=tableau&l=&vjk=e10505ee35075603)): Data visualization and business intelligence tool.
    - [Looker](https://looker.com/) ([674](https://uk.indeed.com/jobs?q=looker&l=&vjk=6c577ba60031a001)): Data exploration and business intelligence platform.
    - [Dash](https://plotly.com/dash/) ([328](https://uk.indeed.com/jobs?q=dash&l=&vjk=3668120d6ea520da)): Python web application framework for building interactive data dashboards.
    - [Kibana](https://www.elastic.co/kibana) ([93](https://uk.indeed.com/jobs?q=kibana&l=&vjk=c702f85ca0e33400)): Data visualization and exploration for the Elastic Stack.
    - [Apache Superset](https://superset.apache.org/) ([1](https://uk.indeed.com/jobs?q=apache+superset&l=&vjk=08207349ba5baa76)): Data exploration and visualization platform.
    
    

8. **Data Security and Governance**:
   - [Apache Ranger](https://ranger.apache.org/): Access control, auditing, and data governance.
   - [Cloudera Navigator](https://www.cloudera.com/products/navigator.html): Data governance and management.
   - [Apache Knox](https://knox.apache.org/): Gateway for securing Hadoop clusters.

9. **Containers and Orchestration**:
   - [Docker](https://www.docker.com/): Containerization of applications and services.
   - [Kubernetes](https://kubernetes.io/): Container orchestration and scaling.

10. **Monitoring and Logging**:
    - [Prometheus](https://prometheus.io/): Metrics collection and monitoring.
    - [Grafana](https://grafana.com/): Metrics visualization and alerting.
    - [ELK Stack (Elasticsearch, Logstash, Kibana)](https://www.elastic.co/): Log analysis and visualization.

11. **Resource Management**:
    - [Apache YARN](https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YARN.html): Cluster resource management and job scheduling.
    - [Apache Mesos](http://mesos.apache.org/): Cluster resource management.
    - [Kubernetes](https://kubernetes.io/): Container orchestration and resource management.

12. **Database and Querying Tools**:
    - [Apache Hive](https://hive.apache.org/): SQL-based querying and data warehousing.
    - [Presto](https://prestodb.io/): Distributed SQL query engine.
    - [Apache Impala](https://impala.apache.org/): High-performance SQL queries on Hadoop.

These descriptions provide an overview of each technology's purpose and capabilities. You can follow the links to access their official documentation for more detailed information.