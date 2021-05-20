# Transferring Files in and out of Containers
# Ref: https://developers.redhat.com/courses/foundations/transfer-files

## Create a project first
oc login -u developer -p developer
oc new-project
oc new-project transfer-files
oc new-app django-psql-example
oc get all
oc new-app openshiftkatacoda/blog-django-py --name blog
oc expose svc/blog
oc rollout status dc/blog

## Create a directory where you want to save the file to
mkdir transferred-files
cd transferred-files/

oc get pods

## oc rsh into that pod with the files you want to transfer-files
oc rsh <pod name>
pwd
ls -latr
exit

## Copies the README.md file to your local 
oc rsync blog-5dc99d7545-knnxs:/opt/app-root/src/README.md ./

##TLDR;
### The form of the command when copying a directory to the local machine is:
oc rsync <pod-name>:/remote/dir ./local/dir

### The form of the command when copying files from the local machine to the container is:
oc rsync ./local/dir <pod-name>:/remote/dir

### To copy the complete contents of the current directory to the htdocs directory in the container, run:
oc rsync . $POD:/opt/app-root/src/htdocs --no-perms
### The --no-perms options tells oc rsync to not attempt to update permissions to avoid it failing and returning errors.