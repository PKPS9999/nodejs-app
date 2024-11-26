Architecture

Provision an EKS Cluster using Terraform.
Deploy a Node.js application to the cluster using Helm charts.
Expose the application through a Network Load Balancer (NLB) with the AWS Load Balancer Controller.


Build and push the Docker image
docker build -t sivadevops28041999/node-app:latest .
docker push sivadevops28041999/node-app:latest


Deploy Application to EKS with Helm
Install the AWS Load Balancer Controller:

helm repo add eks https://aws.github.io/eks-charts
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=eks-demo-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
  
  
Deploy the Node.js application using the Helm chart:

cd ../node-app-chart
helm install node-app ./ --set image.repository=sivadevops28041999/node-app --set image.tag=latest


Accessing the Application
Retrieve the Load Balancer's DNS name:

kubectl get svc node-app -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'


Access the application in your browser using the retrieved DNS name.


