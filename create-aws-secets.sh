aws secretsmanager create-secret \
   --name dev/${EKS_CLUSTER_NAME}/tanzu-sync/sync-git-ssh \
   --secret-string "$(cat <<EOF
{
 "ssh-privatekey": "$(cat ~/.ssh/id_ed25519 | awk '{printf "%s\\n", $0}')",
 "ssh-knownhosts": "$(ssh-keyscan github.com | awk '{printf "%s\\n", $0}')"
}
EOF
)"

aws secretsmanager create-secret \
   --name dev/${EKS_CLUSTER_NAME}/tanzu-sync/install-registry-dockerconfig \
   --secret-string "$(cat <<EOF
{
 "auths": {
   "${INSTALL_REGISTRY_HOSTNAME}": {
     "username": "${INSTALL_REGISTRY_USERNAME}",
     "password": "$(cat /Users/pdipal/Downloads/pa-dpatel-689de39b13dd.json)"
   }
 }
}
EOF
)"


aws secretsmanager create-secret \
   --name dev/${EKS_CLUSTER_NAME}/tap/sensitive-values.yaml \
   --secret-string "$(cat <<EOF
---
# this document is intentionally initially blank.
EOF
)"