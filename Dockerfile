#Dockerfile
FROM centos:6.6
MAINTAINER rujie <xrjieyee@gmail.com>
RUN useradd rujie
RUN echo 'root:111111' | chpasswd
RUN echo 'rujie:rujie' | chpasswd
RUN yum install -y openssh-server
EXPOSE 22
EXPOSE 8080
RUN echo 'OPTIONS=-D' >>/etc/sysconfig/sshd
RUN yum install -y python-setuptools nginx
RUN easy_install tornado
RUN sed -i 's/#Port 22/Port 8022/g' /etc/ssh/sshd_config 
CMD service sshd start
#End
