#/bin/bash



# helm repo add eks https://aws.github.io/eks-charts
# helm repo update

Region_Name='ap-northeast-2'
Cluster_VPC_ID='vpc-cb8b30a0'
EKS_CLUSTER_NAME='MSA_ECOMMERCE_EKS_TEST'

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller |
    --set awsRegion=$Region_Name |
    --set clusterName=$EKS_CLUSTER_NAME |
    --set awsVpcID=$Cluster_VPC_ID |
    --set serviceAccount.create=false |
    --set serviceAccount.name=aws-load-balancer-controller |
    -n kube-system

# helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller `
#     --set awsRegion='ap-northeast-2' `
#     --set clusterName='vpc-cb8b30a0' `
#     --set awsVpcID='MSA_ECOMMERCE_EKS_TEST' `
#     --set serviceAccount.create=false `
#     --set serviceAccount.name=aws-load-balancer-controller `
#     -n kube-system