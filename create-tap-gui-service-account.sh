
for i in "eks.dpatel-cloudgate-aws-credentials.us-east-2.build-green" "eks.dpatel-cloudgate-aws-credentials.us-east-2.run-green" "eks.dpatel-cloudgate-aws-credentials.us-east-2.run-yellow";
do
    kubectx $i
    kubectl apply -f ./tap-gui-viewer-service-account-rbac.yaml

    CLUSTER_URL=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
    kubectl apply -f ./tap-gui-view-secret.yaml

    CLUSTER_TOKEN=$(kubectl -n tap-gui get secret tap-gui-viewer -o=json \
    | jq -r '.data["token"]' \
    | base64 --decode)

    echo $i
    echo url: $CLUSTER_URL
    echo serviceAccountToken: "$CLUSTER_TOKEN"
done
