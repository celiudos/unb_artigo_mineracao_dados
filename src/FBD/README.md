https://www.learnpythonwithrune.org/how-to-setup-a-mysql-server-in-docker-for-your-python-project/


# Step 1: Install Docker Desktop if you don’t have it
Docker enables you to run a lot of services locally on your machine with simple commands. Also, they are only run in Docker so no real installation is done on your machine. This makes it very handy. This is what we will do with the MySQL server in this tutorial.

First of all, you need to make sure you have Docker installed.

You can install Docker Desktop and it will automatically install all you need to manage all Docker tools need.

Go to Docker official download and get Docker Desktop for your OS (here).

Follow the installation instructions and you are ready to go.

Linux Notice. Please notice that if you use Linux there is no Docker Desktop you will need to use command lines when we use the Desktop. For the most part, we only use it to see the containers and see what is running. This can be done from a command line as well.
You can launch Docker Desktop, which will start the Docker Daemon in the background.


# Step 2: Clone the repository with the setup
To build the Docker image and set up the MySQL server, we need a few files.

You can get all the files from GitHub here.

The Dockerfile contains the recipe for the image we will build.

FROM mysql/mysql-server
ENV MYSQL_DATABASE=DB \
    MYSQL_ROOT_PASSWORD=password \
    MYSQL_ROOT_HOST=%
ADD schema.sql /docker-entrypoint-initdb.d
EXPOSE 3306
This file describes all Docker needs to build an image, which you can run afterward.

The first line contains the image from mysql/mysql-server which is the official MySQL server image (source).

Then it creates a Database and adds a schema.

Let’s explore the schema.

DROP DATABASE IF EXISTS `DB`;
CREATE DATABASE `DB`;
USE `DB`;
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `OrderTime` datetime,
  `Item` varchar(100) NOT NULL
);
Here you can change it for your needs. This one creates a simple database with one table Orders, with two columns OrderTime and Item.

# Step 3: Build the Docker image and run it
You can build the Docker image by the following command.

docker build -t local-mysql .
And run it as follows.

docker run -dp 3306:3306 local-mysql
If you want to learn more about Docker for Python developers also read this guide.


This should start the MySQL server in your Docker Desktop.

# Step 4: How to call your Docker MySQL server from Python
The file batch_process.py will insert a lot of rows into the MySQL database (the server).

import csv
from datetime import datetime
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="password"
)
cur = mydb.cursor()
cur.execute("USE DB")

data_file = 'orders.csv'
with open(data_file, "r") as f:
    csv_reader = csv.DictReader(f)
    records = list(csv_reader)

for record in records:
    print(record)
    order_time = record['order_time']
    date_obj = datetime.strptime(order_time, '%Y-%m-%d %H:%M:%S.%f')
    item = record['item']
    sql_stmt = f"INSERT INTO Orders(OrderTime, Item) VALUES('{date_obj}', '{item}')"
    cur.execute(sql_stmt)
    mydb.commit()
cur.close()
mydb.close()
Please notice, that you need to have mysql-connector-python installed.

pip install mysql-connector-python
The code opens a CSV file orders.csv and inserts all the rows into the database.

To see what is in the database run the view_sql.py.

import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="password"
)
cur = mydb.cursor()
cur.execute("USE DB")
sql_stmt = f"SELECT * FROM Orders"
cur.execute(sql_stmt)
response = cur.fetchall()
for row in response:
    print(row[0], row[1])
cur.close()
mydb.close()
This will show all the rows in the MySQL database running in your Docker.

# Step 5: Understanding it all and a few notes
You can stop and start the local-mysql container and the content will be kept.

But if you delete it, and re-run the command, all the content in the database will be lost.

Why bother using Docker and not install MySQL on your computer?

Well, you often need to produce code and be able to reproduce the setup on another machine. When you set up something locally, you forget what you did and some might be system specific. Hence, when you need to set up production, it often needs to be done differently. This is where Docker is great. It does it all, it keeps the steps, and it can be reproduced on all machines with Docker running.

As a professional Python developer, you need to start using Docker for all these kinds of things. This will enable you to work as the highly-paid developers do.

Be sure to learn about creating a Python REST API using your Docker MySQL server.