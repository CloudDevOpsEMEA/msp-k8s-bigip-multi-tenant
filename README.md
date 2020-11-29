# msp-k8s-bigip-multi-tenant
UDF Demo repo for MSP Multi Tenant K8S use case

## UDF Blueprint Configuration

## Systems

| hostname   | vCPU | Mem(GiB) | Disk(GiB) | NICs |
|------------|------|----------|-----------|------|
| bigip      | 8    | 32       | 100       | 5    |
| master1    | 8    | 32       | 50        | 2    |
| node1      | 8    | 32       | 50        | 2    |
| master2    | 8    | 32       | 50        | 2    |
| node2      | 8    | 32       | 50        | 2    |
| master3    | 8    | 32       | 50        | 2    |
| node3      | 8    | 32       | 50        | 2    |
| jumphost   | 2    | 8        | 50        | 2    |
| operations | 8    | 64       | 150       | 5    |

### IP Management

| hostname   | Management | External     | Cluster1   | Cluster2   | Cluster3   |
|------------|------------|--------------|------------|------------|------------|
| bigip      | 10.1.1.4   | 10.1.10.4-10 | 10.1.20.4  | 10.1.30.4  | 10.1.40.4  |
| master1    | 10.1.1.5   |              | 10.1.20.5  |            |            |
| node1      | 10.1.1.6   |              | 10.1.20.6  |            |            |
| master2    | 10.1.1.7   |              |            | 10.1.30.7  |            |
| node2      | 10.1.1.8   |              |            | 10.1.30.8  |            |
| master3    | 10.1.1.9   |              |            |            | 10.1.40.9  |
| node3      | 10.1.1.10  |              |            |            | 10.1.40.10 |
| jumphost   | 10.1.1.11  | 10.1.10.11   |            |            |            |
| operations | 10.1.1.12  | 10.1.10.12   | 10.1.20.12 | 10.1.30.12 | 10.1.40.12 |

