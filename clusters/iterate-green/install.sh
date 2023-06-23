direnv allow . && eval "$(direnv export bash)"
eksctl utils associate-iam-oidc-provider --region=us-east-2 --cluster=$EKS_CLUSTER_NAME --approve
tanzu-sync/scripts/aws/delete-policies.sh
tanzu-sync/scripts/aws/delete-irsa.sh
tanzu-sync/scripts/aws/create-policies.sh
tanzu-sync/scripts/aws/create-irsa.sh
tanzu-sync/scripts/configure.sh
tanzu-sync/scripts/bootstrap.sh
tanzu-sync/scripts/deploy.sh