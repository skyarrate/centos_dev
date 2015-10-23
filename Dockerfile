#Dockerfile
FROM centos:6.6
MAINTAINER rujie <xrjieyee@gmail.com>
RUN useradd rujie
RUN echo 'root:111111' | chpasswd
RUN yum install -y openssh-server
EXPOSE 22
EXPOSE 8080
RUN echo 'OPTIONS=-D' >>/etc/sysconfig/sshd
RUN yum install -y python-setuptools nginx
RUN easy_install tornado
CMD service sshd start
#End
