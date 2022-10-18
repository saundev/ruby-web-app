# ruby-web-app

To run and test the Ruby server script on your local machine install Ruby v3.0.0 and run:

`cd $PWD/ruby-web-app/src`

`ruby server.rb`

To run Ruby container locally run the following commands from the root of the repository, replace Saundev with your own private Docker repo.

`docker build -t ruby-web-app .`

`docker run -p 8000:4040 --name ruby-instance ruby-web-app`

`docker tag ruby-web-app:latest izaun/saundev:saundev-ruby`

`docker push izaun/saundev:saundev-ruby`

`docker pull izaun/saundev:saundev-ruby`

### Terraform Instructions ###

Run the following TF commands:

`terraform init`

`terraform plan`

`terraform apply -auto-approve`

### Set docker target repo add  comainter image to Google Cloud Artifact: ###

`gcloud auth configure-docker \`
`    LOCATION-docker.pkg.dev`

`cat ~/.docker/config.json`

`gcloud auth configure-docker LOCATION-docker.pkg.dev`

`gcloud auth print-access-token \`
`  --impersonate-service-account  service-account@PROJECT_ID.iam.gserviceaccount.com | docker login \`
`  -u oauth2accesstoken \`
`  --password-stdin https://LOCATION-docker.pkg.dev`

`base64 -i service-account.json -o key.json`

`cat key.json | docker login -u _json_key_base64 --password-stdin \`
`https://LOCATION-docker.pkg.dev`

### Now service account is autenticated for 60 minutes, tag the docker image and push to GCR. ###

`docker tag IMAGE_ID LOCATION-docker.pkg.dev/PROJECT_ID/REPO_NAME/CONTAINER_NAME`

`docker push LOCATION-docker.pkg.dev/PROJECT_ID/REPO_NAME/CONTAINER_NAME`

`gcloud artifacts docker images list \`
`LOCATION-docker.pkg.dev/PROJECT_ID/REPO_NAME/CONTAINER_NAME --include-tags`

`gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) \`
`--region $(terraform output -raw region)`

`gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)`

* Default container option is Google Cloud Run, use Terraform Commands to run this, GKE and K8s Modules are optional *

### [Optional] Configure kubectl for GKE cluster post install: ###

`gcloud container clusters get-credentials PROJECT_ID --region LOCATION`

`sudo gcloud components install gke-gcloud-auth-plugin`

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml`

`kubectl proxy`

### [Optional] Open the following link on web browser ###
`http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/`

### [Optional] Open a new terminal and run the following cmd ###
`kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-gke-cluster/main/kubernetes-dashboard-admin.rbac.yaml`

### [Optional] Now that the new role has been established run this cmd to generate auth token ###
`kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')`

`gcloud container clusters describe $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region) --format='default(locations)'`

`kubectl get deployments`

`kubectl get services`