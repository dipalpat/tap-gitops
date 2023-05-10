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
   --name dev/${EKS_CLUSTER_NAME}/tanzu-sync/sync-git-ssh \
   --secret-string "$(cat <<EOF
{
 "ssh-privatekey": "$(cat ~/.ssh/id_ed25519 | awk '{printf "%s\\n", $0}')",
 "ssh-knownhosts": "$(ssh-keyscan github.com | awk '{printf "%s\\n", $0}')"
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