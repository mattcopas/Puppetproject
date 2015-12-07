FROM ubuntu:trusty
CMD apt-get update -y
# RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y nano
# RUN apt-get install -y dpkg-dev
RUN apt-get install -y git
RUN wget http://download.virtualbox.org/virtualbox/5.0.10/virtualbox-5.0_5.0.10-104061~Ubuntu~trusty_amd64.deb
# RUN dpkg -i FILE_HERE
# RUN apt-get install -y vagrant
RUN wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb
RUN dpkg -i vagrant_1.7.4_x86_64.deb
RUN git clone https://github.com/mattcopas/Puppetproject.git

