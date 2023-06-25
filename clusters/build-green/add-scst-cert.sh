kubectx eks.dpatel-cloudgate-aws-credentials.us-east-2.view-green
CA_CERT=$(kubectl get secret -n metadata-store ingress-cert -o json | jq -r ".data.\"ca.crt\"")
AUTH_TOKEN=$(kubectl get secrets metadata-store-read-write-client -n metadata-store -o jsonpath="{.data.token}" | base64 -d)
cat <<EOF > store_ca.yaml
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: store-ca-cert
  namespace: metadata-store-secrets
data:
  ca.crt: $CA_CERT
EOF

kubectx eks.dpatel-cloudgate-aws-credentials.us-east-2.build-green
kubectl create ns metadata-store-secrets
kubectl apply -f ./store_ca.yaml
kubectl create secret generic store-auth-token \
  --from-literal=auth_token=$AUTH_TOKEN -n metadata-store-secrets
kubectl apply -f ./secret-export.yml