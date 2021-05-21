# Deploying Applications From Sourcecode Using the Commandline
## Sourcecode: https://github.com/openshift-katacoda/blog-django-py
oc new-project blog-django-py-project
oc new-app python:latest~https://github.com/openshift-katacoda/blog-django-py
oc logs bc/blog-django-py --follow # to monitor log output
oc status
oc expose service/blog-django-py
oc get route/blog-django-py

## The source code for an application isn't going to be static, so a way to trigger a new build after making any changes is required.
## To do this from the command line using oc, run the command:
oc start-build blog-django-py

## As before you can use oc logs to monitor the log output as the build runs. 
## You can also monitor the progress of any builds in a project by running the command:
oc get builds --watch

## To display information about the build configuration for the application you can run:
oc describe bc/blog-django-py