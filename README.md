# Infrastructure as Code Project

This project was created as part of the Udacity Cloud DevOps Engineer Nanodegree.

It is designed for executing AWS Cloudformation templates to deploy two stacks:
- `network`: basic AWS networking stack (vpc, subnets, gateways and routing)
- `udagram`: a fake web application served by NGINX (incl. auto-scaling and load balancing).

Please refer to the diagram for more details on the infrastructure.

## Spin up instructions
Use the helper script `cloudformnation_run.sh` as follows:
```
./cloudformation_run.sh deploy network
./cloudformation_run.sh deploy udagram
```

In case of permission issues, run the following command first to grant yourself execute permission:
```
chmod +x cloudformation_run.sh
```

## Tear down instructions
Use the helper script `cloudformnation_run.sh` as follows:
```
./cloudformation_run.sh delete network
./cloudformation_run.sh delete udagram
```
