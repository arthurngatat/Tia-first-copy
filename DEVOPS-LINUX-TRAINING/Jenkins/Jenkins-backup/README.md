## Jenkins Backup jobs
* [Automated Daily Backups of Jenkins Master to Amazon S3 Bucket](https://medium.com/@bennirus/automated-daily-backups-of-jenkins-master-to-amazon-s3-bucket-1ba6e875c0f0)

* This work well when Jenkins master is local and we need to install aws cli, configure it and run those commands manually to uplaod the backup in AWS.

```sh
cd /var/lib/jenkins/jobs/
tar -cvf jenkins_backup.tar .
aws s3 cp jenkins_backup.tar s3://jenkins-backup-job/
rm -rf jenkins_backup.tar
```

```sh
echo 'Creating a tar file'
cd /var/lib/jenkins/jobs/
rm -rf jenkins_backup.tar
tar -cvf jenkins_backup.tar .
echo 'Upload jenkins_backup.tar to S3 bucket'
aws s3 cp jenkins_backup.tar s3://jenkins-backup-job/
echo 'Remove files after succesful upload to S3'
rm -rf jenkins_backup.tar
```

* This work well when Jenkins master is in AWS
* Configure Jenkins Environment Variables and Job
    * Manage Jenkins > Configure System > Global Properties > Environment Variables.

```s
# Jenkins environment variables
AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY_ID>
AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_ACCESS_KEY_ID>
AWS_DEFAULT_REGION=<YOUR_S3_BUCKET_REGION>
```
```sh
echo 'tar $JENKINS_HOME directory'
set +e 
tar -cvf jenkins_backup.tar -C $JENKINS_HOME .
exitcode=$?
if [ "$exitcode" != "1" ] && [ "$exitcode" != "0" ]; then
exit $exitcode
fi
set -e
echo 'Upload jenkins_backup.tar to S3 bucket'
aws s3 cp jenkins_backup.tar s3://<YOUR_BUCKET_NAME>/
echo 'Remove files after succesful upload to S3'
rm -rf *
```

```sh
#!/bin/bash
echo 'tar $JENKINS_HOME directory'
set +e 
tar -cvf jenkins_backup.tar -C $JENKINS_HOME .
exitcode=$?
if [ "$exitcode" != "1" ] && [ "$exitcode" != "0" ]; then
exit $exitcode
fi
set -e
echo 'Upload jenkins_backup.tar to S3 bucket'
aws s3 cp jenkins_backup.tar s3://jenkins-backup-job/
echo 'Remove files after succesful upload to S3'
rm -rf *
```


