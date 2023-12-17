#!/bin/bash

create_cluster() {
    echo "Creating the cluster..."
    
    mkdir token

    vagrant up 

    cp config ~/.kube/config

    rm config

    kubectl apply --recursive -f manifests/

    echo "Cluster created and configured."

    echo "Port forwarding api-gateway to 8080. Service availabe on http://localhost:8080/api/"

    kubectl port-forward service/api-gateway-servic8080:1024
}

destroy_cluster() {

    echo "Destroying the cluster..."

    vagrant destroy -f

    rm -r token
    
    if [ -f "k3s-config.yaml" ]; then
        rm k3s-config.yaml
    fi

    echo "Cluster destroyed."
}

case "$1" in
    create)
        create_cluster
        ;;
    destroy)
        destroy_cluster
        ;;
    *)
        echo "Usage: $0 {create|destroy}"
        exit 1
        ;;
esac