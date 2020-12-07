#
#       Copyright 2017-2019 IBM Corp All Rights Reserved
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
FROM centos:7

USER root

RUN yum install -y java-1.8.0-openjdk

RUN mkdir -m 777 -p /app

WORKDIR /app

USER 1001

COPY target/portfolio-0.0.1.jar /app

EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","portfolio-0.0.1.jar"]
