#### Adding no to relevant deployments (for above) will do single resource deployment for intended resource only ####
#### Ensure comments do not have matching input parameters instead use: network-reponame, use-terraformstate, es-deployment, etc. in comments ####
#### network-reponame would be existing network repo created. ex. nonprod-network, dev-network, prod-network ####
AWSAccount="797382084246"
Region="ap-southeast-2"

# Change it to network repo path should resolve directory issue#
#NetworkRepositoryName="network-test"
EnvironmentSubgroupName="dev"

DeployRDS="yes"
DeployES="yes"
DeployEFS="yes"
DeployEKS="yes"
DeployRedis="yes"
DeployCPAM="no"
DeploySC2="no"
DeployIPSec="no"

# Variables to control cluster and application deployment
DeployCluster="yes"
DeployApplication="yes"

# Customer Details
CustomerName="borondra"
Environment="dev"
JiraTicket="38258"
Owner="garygreen"
Backupdr="nonprod"
key_pair_name="7973-aps2-boroondara-dev-24042023"
kms_key_id="default"
helm_release="Release-23.1.0"

##### common network parameters ####
##### Add only if values does not need to be pulled from nondev-network ####
VPCID="vpc-0489f83e23fd775ac"
AppSubnet1Id="subnet-0545d560d5b567dd9"
AppSubnet2Id="subnet-0545d560d5b567dd9"
#AppSubnet3Id="subnet-0fd2f2ff98ab66ac8"
DataSubnet1Id="subnet-01a8ad254f0095cfb"
DataSubnet2Id="subnet-01a8ad254f0095cfb"
WebSubnet1Id="100.64.97.192/27"
WebSubnet2Id="100.64.97.224/27"
AppSubnet1CIDR="100.64.97.0/26"
AppSubnet2CIDR="100.64.97.0/26"
#AppSubnet3CIDR="100.70.138.128/26"

##### rds-deployment variables ####
##### uncomment and update rds variables if rds deployment is true  ####
#### BackupRetentionPeriod should be 7 for non-prod and 15 for prod ####
RDSCreationMonth="mar-2023"
BackupRetentionPeriod="7"
RDSInstanceClass="db.r5.large"
RDSInstanceName="borondra-dev-rds"
MultiAZ="false"
RDSRootUserName="saviyntadmin"
RDSSchemaName="saviyntaws"
EnableProvisionedIOPs="false"
ProvisionedIOPs="1000"
OpenVPNJumpboxIP="192.168.247.14/32"
AllocatedStorage="100"
SnapshotIdentifier=""

##### elasticsearch deployment variables####
##### update elasticsearch variables if es-deployment is true  ####
##### uncomment VPC and Subnet IDs if the customer Network repo output file is not to be used #####
ESDomainName="borondra-dev-es"
ESVersion="6.8"
ESSize="100"
ESDataNodes="1"
ESUser="7973-apse2-borondra-dev-es-user"
ESInstanceType="r5.large.elasticsearch"

##### EFS-Deployment Variables ####
##### Values will be taken from common network parameters above ####


#### EKS-deployment variables #####
##### update elasticsearch variables if eks deployment is true  ####
EKSClusterName="borondra-dev-eks"

#Change the InstanceType to m5.4xlarge only for Customers with cpam large customers
InstanceType="r5.large"
NodeCount="2"

#### CPAM-deployment variables #####
##### update CPAM variables if CPAM deployment is true  ####
#cpam_bucket_name="k8upg-ebs-test-eks-cpam-recording-bucket"
#vault_instance_type="r5.xlarge"
#vault_instance_count="2"
#consul_instance_type="r5.xlarge"
#consul_instance_count="3"
#Instance_Profile="2494-AppInstance-Role"
#Provide the worker node role, this value is needed for all CPAM setups. Failing to provide will cause pipeline to fail.
#Worker node role is in the format "EKSClusterName-workernode-role"
Worker_Node_Role="borondra-dev-eks-workernode-role"

#### SC2-deployment variables ####
#### update SC2 variables if SC2 deployment is true ####
#### additional_sc2_count, Primary_Instance_Id, SC2_Security_Group_Id should be used for converting non-HA to HA####
#### Enable_HA should be no for non-HA ####
#sc2_total_instance_count="2"
#sc2_instance_type="m5.xlarge"
#sc2_instance_role="6612-AppInstanceRole"
#sc2_enable_ha="no"
#sc2_additional_instance_count="1"
#sc2_primary_instance_id=""

#### IPSec Deployment Variables ####
#### update IPSec variables if IPSec deployment is true ####
#customer_gateway_ip="54.212.10.6"

## Below env vars needs to be static and should not be changed. ##
UseTerraformState="no"
TerraformState=""
AllowResourceDestroy="no"
