#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
        sshpass -p "sahin" scp /root/.jenkins/workspace/project1/target/sampleparameter.war sahin@172.17.0.3:/home/sahin/Destros/apache-tomcat-9.0.16/webapps
        sshpass -p "sahin" ssh gamut@172.17.0.2 "JAVA_HOME=/home/sahin/Destros/jdk1.8.0_151" "/home/sahin/Destros/apache-tomcat-9.0.16/bin/startup.sh"

elif  [ $ENVIRONMENT = "SIT" ];then
        sshpass -p "gamut" scp target/gamutkart.war gamut@172.17.0.3:/home/gamut/Distros/apache-tomcat-8.5.23/webapps
        sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/gamut/Distros/apache-tomcat-8.5.23/bin/startup.sh"
echo "deployment has been done!"
fi
