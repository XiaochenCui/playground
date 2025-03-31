# Demo

## Compile the Demo

```shell
cd EMP_Project/demo
mvn clean compile
```

## Run the Demo

```shell
mvn exec:java -Dexec.mainClass="com.example.EmpDBConsoleApp"
```

# RMI Project

## Compile the RMI Project

```shell
cd EMP_Project/rmi
mvn clean compile
```

## Start the RMI Registry

```shell
# the rmiregistry must be started in the same directory as the classes
cd EMP_Project/rmi/target/classes
rmiregistry
```

## Run the RMI Server

```shell
mvn exec:java -Dexec.mainClass="com.rmi.Server"
```

## Run the RMI Client

```shell
mvn exec:java -Dexec.mainClass="com.rmi.EmpDBConsoleApp"
```

# Implementation Details
